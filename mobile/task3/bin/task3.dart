import 'dart:math';
import 'dart:io';

import 'package:task3/task1.dart';
//
// void leap(int year) {
//   if ((year % 4 == 0 && year % 100 != 0) || (year % 400 == 0)) {
//     print("is leap");
//   } else {
//     print("not leap");
//   }
// }
//
// int Sarea(int l, [int? l2]) {
//   int a;
//   if (l2 == null) {
//     a = l * l;
//   } else {
//     a = l * l2;
//   }
//   return a;
// }
//
// int Rarea(int rl, {required int rw}) {
//   int ra;
//   ra = rl * rw;
//   return ra;
// }
//
// double Carea(int r) {
//   double ca;
//   ca = pi * (r * r);
//   //ca=(3.14)*(r*r);
//   return ca;
// }
//
// void main() {
//   //3.2
//   print("Enter a year: ");
//   int year = int.parse(stdin.readLineSync()!);
//   leap(year);
//   //3.3
//   print("enter the number you want a mul table for: ");
//   int num = int.parse(stdin.readLineSync()!);
//   for (int i = 0; i < 10; i++) {
//     print("${num}*${i}=${num * i}");
//   }
//   //3.4
//   List<int> l1 = [1, 1, 1, 1];
//   int sum = 0;
//   for (var v in l1) {
//     sum += l1[v];
//   }
//   print("the summation of elements: ${sum}");
//   //3.5
//   int n;
//   int g = 6;
//   do {
//     print("guess the number: ");
//     n = int.parse(stdin.readLineSync()!);
//   } while (n != 6);
//   //3.6
//   // do{
//   //   print("choose an op:");
//   //   print("0.exit");
//   //   print("1.add");
//   //   print("2.sub");
//   //   print("3.mul");
//   //   print("4.div");
//   //   int c = int.parse(stdin.readLineSync()!);
//   //   switch(c){
//   //     case 1:
//   //       print("enter the number1: ");
//   //       int num1 = int.parse(stdin.readLineSync()!);
//   //       print("enter the number2: ");
//   //       int num2 = int.parse(stdin.readLineSync()!);
//   //       print("${num1}+${num2}=${num1+num2}");
//   //     case 2:
//   //       print("enter the number1: ");
//   //       int num1 = int.parse(stdin.readLineSync()!);
//   //       print("enter the number2: ");
//   //       int num2 = int.parse(stdin.readLineSync()!);
//   //       print("${num1}-${num2}=${num1-num2}");
//   //     case 3:
//   //       print("enter the number1: ");
//   //       int num1 = int.parse(stdin.readLineSync()!);
//   //       print("enter the number2: ");
//   //       int num2 = int.parse(stdin.readLineSync()!);
//   //       print("${num1}*${num2}=${num1*num2}");
//   //     case 4:
//   //       print("enter the number1: ");
//   //       int num1 = int.parse(stdin.readLineSync()!);
//   //       print("enter the number2: ");
//   //       int num2 = int.parse(stdin.readLineSync()!);
//   //       print("${num1}/${num2}=${num1/num2}");
//   //     case 0:
//   //       exit(0);
//   //   }
//   //}while(true);
//   //4.1
//   print("Square: l");
//   int nu = int.parse(stdin.readLineSync()!);
//   Sarea(nu);
//   //Sarea(n,l2:3);
//   print("Rectangle l: ");
//   int r1 = int.parse(stdin.readLineSync()!);
//   print("Rectangle w: ");
//   int r2 = int.parse(stdin.readLineSync()!);
//   Rarea(r1, rw: r2);
//   print("circle r: ");
//   int r = int.parse(stdin.readLineSync()!);
//   Carea(r);
// }
// class task1{
//   late String title,des,date;
//   task1(String this.title, String this.date, String this.des){
//     // title:"Trools";
//     // date:"2016";
//     // des:"a movie";
//   }
//   void printc(){
//     print(title);
//     print(des);
//     print(date);
//   }
// }
class Human {
  String? name;
  int? age;
  int _numberOfArms = 2;
  double? hight;
  double? weight;

  Human(
      {required this.name, required this.age, required this.hight, required this.weight});

  void run() {
    print("running");
  }

  void eat() => print("eating");

  void sleep() {
    print("sleeping");
  }

  void walk() {
    print("walking");
  }

  void talk() {
    print("talking");
  }

  void jump() {
    print("jumping");
  }

  void swim() {
    print("swimming");
  }

  void setNumberOfArms(int numberOfArms) {
    if (_numberOfArms <= 2) {
      print("Is human");
    } else {
      print("Is animal");
    }
  }

  int getNumberOfArms() {
    return _numberOfArms;
  }
}

class Animal {
  int numOfLimbs = 4;

  eat() => print('eating');
  double? weight;
  String? Skin;
  Animal(this.weight, this.Skin);
}
class Dog extends Animal {
  Dog(super.weight, super.Skin);
}
class Cat extends Animal {
  Cat(super.weight, super.Skin);
}
class lion extends Animal {
  lion(super.weight, super.Skin);
}

void main(){
  // task1 t=new task1("trols","2013","a movie");
  // t.printc();
  Human h=Human(age: 20,name: "Dina",hight: 175, weight: 84);
  h.run();
  h.eat();
  print("${h.name} is ${h.age} years old");

  h.setNumberOfArms(h._numberOfArms);
  print(h.getNumberOfArms());
  Dog j=Dog(30,"black");
  Cat k=Cat(2, "orange");
  lion l=lion(20, "white");

}