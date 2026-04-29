using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.IdentityModel.Tokens;
using Microsoft.OpenApi.Models;

var builder = WebApplication.CreateBuilder(args);
var keyBytes = Encoding.UTF8.GetBytes("ThisIsMySuperSecretKeyForAmnaApp123!"); // Min 32 characters

builder.Services.AddEndpointsApiExplorer();

// 1. إعداد المصادقة (Authentication)
builder.Services.AddAuthentication(JwtBearerDefaults.AuthenticationScheme)
    .AddJwtBearer(options =>
    {
        options.TokenValidationParameters = new TokenValidationParameters
        {
            ValidateIssuerSigningKey = true,
            IssuerSigningKey = new SymmetricSecurityKey(keyBytes),
            ValidateIssuer = false,
            ValidateAudience = false,
            ValidateLifetime = true,
            ClockSkew = TimeSpan.Zero
        };
    });

// 2. إعداد الصلاحيات (Authorization Logic) بناءً على الأدوار
builder.Services.AddAuthorization(options =>
{
    options.AddPolicy("PatientOnly", policy => policy.RequireRole("Patient"));
    options.AddPolicy("StaffOnly", policy => policy.RequireRole("Staff"));
});

// 3. إعداد Swagger ليقبل إدخال التوكن (زر القفل)
builder.Services.AddSwaggerGen(c =>
{
    c.AddSecurityDefinition("Bearer", new OpenApiSecurityScheme
    {
        Name = "Authorization",
        Type = SecuritySchemeType.Http,
        Scheme = "Bearer",
        BearerFormat = "JWT",
        In = ParameterLocation.Header
    });

    c.AddSecurityRequirement(new OpenApiSecurityRequirement
    {
        {
            new OpenApiSecurityScheme { Reference = new OpenApiReference { Type = ReferenceType.SecurityScheme, Id = "Bearer" } },
            Array.Empty<string>()
        }
    });
});

var app = builder.Build();

app.UseAuthentication();
app.UseAuthorization();

if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

// --- قاعدة بيانات وهمية للمستخدمين ---
var usersDb = new List<User>
{
    new User(Id: 1, Username: "amna", Password: "123", Role: "Patient"),
    new User(Id: 2, Username: "ahmed", Password: "123", Role: "Patient"),
    new User(Id: 3, Username: "dr_sara", Password: "admin", Role: "Staff")
};

// --- قاعدة بيانات وهمية للمواعيد ---
var appointmentsDb = new List<Appointment>();

// ==========================================
// مسارات التطبيق (Endpoints)
// ==========================================

// 1. تسجيل الدخول (متاح للجميع) - POST /login
app.MapPost("/login", (LoginRequest request) =>
{
    var user = usersDb.FirstOrDefault(u => u.Username == request.Username && u.Password == request.Password);
    
    if (user != null)
    {
        return Results.Ok(new { token = GenerateJwtToken(user, keyBytes) });
    }

    return Results.Unauthorized();
}).AllowAnonymous();

// 2. حجز موعد جديد (متاح للمرضى فقط) - POST /appointments
app.MapPost("/appointments", (BookAppointmentRequest request, ClaimsPrincipal user) =>
{
    // استخراج معرّف المريض (User ID) من التوكن
    //var userIdStr = user.FindFirst(JwtRegisteredClaimNames.Sub)?.Value;
    var userIdStr = user.FindFirst(ClaimTypes.NameIdentifier)?.Value;
    int patientId = int.Parse(userIdStr!);

    var newAppointment = new Appointment(appointmentsDb.Count + 1, patientId, request.Date, request.Description);
    appointmentsDb.Add(newAppointment);

    return Results.Ok(new { message = "تم حجز الموعد بنجاح!", appointment = newAppointment });
}).RequireAuthorization("PatientOnly");

// 3. عرض مواعيدي (متاح للمرضى - يرى مواعيده هو فقط) - GET /my-appointments
app.MapGet("/my-appointments", (ClaimsPrincipal user) =>
{
    //var userIdStr = user.FindFirst(JwtRegisteredClaimNames.Sub)?.Value;
    var userIdStr = user.FindFirst(ClaimTypes.NameIdentifier)?.Value;
    int patientId = int.Parse(userIdStr!);

    // فلترة المواعيد حسب الـ ID الموجود في التوكن
    var myAppointments = appointmentsDb.Where(a => a.PatientId == patientId).ToList();

    return Results.Ok(myAppointments);
}).RequireAuthorization("PatientOnly");

// 4. عرض كل المواعيد (متاح للموظفين فقط) - GET /admin/all
app.MapGet("/admin/all", () =>
{
    return Results.Ok(appointmentsDb);
}).RequireAuthorization("StaffOnly");

app.Run();

// ==========================================
// الدوال المساعدة (Helper Methods & Models)
// ==========================================

string GenerateJwtToken(User user, byte[] key)
{
    var descriptor = new SecurityTokenDescriptor
    {
        // تضمين الـ sub (User ID) والـ role (Patient/Staff)
        Subject = new ClaimsIdentity(new[] 
        { 
            new Claim(JwtRegisteredClaimNames.Sub, user.Id.ToString()),
            new Claim(ClaimTypes.Role, user.Role) 
        }),
        Expires = DateTime.UtcNow.AddHours(1),
        SigningCredentials = new SigningCredentials(new SymmetricSecurityKey(key), SecurityAlgorithms.HmacSha256Signature)
    };
    var handler = new JwtSecurityTokenHandler();
    return handler.WriteToken(handler.CreateToken(descriptor));
}

// النماذج (Models)
public record User(int Id, string Username, string Password, string Role);
public record Appointment(int AppointmentId, int PatientId, string Date, string Description);

public class LoginRequest
{
    public string Username { get; set; } = string.Empty;
    public string Password { get; set; } = string.Empty;
}

public class BookAppointmentRequest
{
    public string Date { get; set; } = string.Empty;
    public string Description { get; set; } = string.Empty;
}