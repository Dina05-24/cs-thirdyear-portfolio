import 'package:oop/oop.dart';
import 'package:test/test.dart';
class BankAcc{
  double balance = 0;
  set setB(double val){
    balance = val;
  }

  //double get getB => balance;
  double get getB{
    return balance;
  }
  void deposit(double amount){
    balance += amount;
  }
  void withdraw(double amount){
    if(balance >= amount){
      balance -= amount;
    }else
      return;

  }
}
class person{
  String name;
  int age;
  String address;
  person(this.name,this.age,this.address);

  void p(){
    print("name: ${name}, age: ${age}, address: ${address}");
  }

}
class student extends person{
  String degree;
  int grade;
  String gender;
  student(String name,int age,String address,this.degree,this.grade,this.gender)
      :super(name,age,address);
  @override
  void p(){
    super.p();
    print("degree: $degree, grade: $grade, gender: $gender");
  }
}
abstract class shape{
  double area();
}
class circle extends shape{
  double radius;
  circle(this.radius);
  @override
  double area()=>3.14*radius*radius;
}
class rectangle extends shape{
  double length;
  double width;
  rectangle(this.length,this.width);
  @override
  double area()=>length*width;

}
void Parea(shape sh)=>print("area is: ${sh.area()} ");
void main() {
  print("\n");
  var a= BankAcc();
  a.deposit(100);
  a.withdraw(50);
  print("Current Balance: ${a.getB}");
  print("\n");
  student st = student("Dina", 20, "Baghdad", "CS", 3, "F");

  st.p();
  print("\n");
  circle c = circle(2);
  rectangle r = rectangle(2,4);

  Parea(c);
  Parea(r);
}
