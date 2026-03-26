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

  p=>print("name: $name, age: $age, address: $address");

}
class student extends person{
  String degree;
  int grade;
  char gender;
  student(String name,int age,String address,this.degree,this.grade,this.gender)
      :super(name,age,address);

  s=>print("name: $name, age: $age, address: $address, degree: $degree, grade: $grade, gender: $gender");
}
abstract class shape{
  double area();
}
class circle extends shape{
  double radius;
  circle(this.radius);
  area(double radius)=>3.14*radius*radius;
  Parea()=>print("area of circle is $area");
}
class rectangle extends shape{
  double length;
  double width;
  rectangle(this.length,this.width);
  area(double length,double width)=>length*width;
  Parea()=>print("area of rectangle is $area");
}
void main() {
  circle c = circle(5);
  rectangle r = rectangle(4, 6);

  Parea(c);
  Parea(r);
}
