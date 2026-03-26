import 'dart:math';
import 'dart:io';

import 'package:flutter/services.dart';
void leap(int year) {
  if((year % 4 == 0 && year % 100 != 0) || (year % 400 == 0)) {
    print("is leap");
  }else{
    print("not leap");
  }
 }
// int Sarea(int l,[int? l2]){
//   int a;
//   if(l2==null){
//     a=l*l;
//   }else{
//     a=l*l2;
//   }
//   return a;
// }
// int Rarea(int rl,{ required int rw}){
//   int ra;
//   ra=rl*rw;
//   return ra;
// }
// double Carea(int r){
//   double ca;
//   ca=pi*(r*r);
//   //ca=(3.14)*(r*r);
//   return ca;
// }
void main() {
  //3.2
  print("Enter a year: ");
  int year = int.parse(stdin.readLineSync()!);
  leap(year);
  // //3.3
  // print("enter the number you want a mul table for: ");
  // int num = int.parse(stdin.readLineSync()!);
  // for(int i=0; i<10; i++){
  //   print("${num}*${i}=${num*i}");
  // }
  //3.4
  // List<int> l1=[1,1,1,1];
  // int sum=0;
  // for(var v in l1){
  //   sum+=l1[v];
  // }
  // print("the summation of elements: ${sum}");
  //3.5
  // int n;
  // int g=6;
  // do{
  //   print("guess the number: ");
  //   n = int.parse(stdin.readLineSync()!);
  // }while(n!=6);
  //3.6
  // do{
  //   print("choose an op:");
  //   print("0.exit");
  //   print("1.add");
  //   print("2.sub");
  //   print("3.mul");
  //   print("4.div");
  //   int c = int.parse(stdin.readLineSync()!);
  //   switch(c){
  //     case 1:
  //     print("enter the number1: ");
  //     int num1 = int.parse(stdin.readLineSync()!);
  //     print("enter the number2: ");
  //     int num2 = int.parse(stdin.readLineSync()!);
  //       print("${num1}+${num2}=${num1+num2}");
  //     case 2:
  //       print("enter the number1: ");
  //       int num1 = int.parse(stdin.readLineSync()!);
  //       print("enter the number2: ");
  //       int num2 = int.parse(stdin.readLineSync()!);
  //       print("${num1}-${num2}=${num1-num2}");
  //     case 3:
  //       print("enter the number1: ");
  //       int num1 = int.parse(stdin.readLineSync()!);
  //       print("enter the number2: ");
  //       int num2 = int.parse(stdin.readLineSync()!);
  //       print("${num1}*${num2}=${num1*num2}");
  //     case 4:
  //       print("enter the number1: ");
  //       int num1 = int.parse(stdin.readLineSync()!);
  //       print("enter the number2: ");
  //       int num2 = int.parse(stdin.readLineSync()!);
  //       print("${num1}/${num2}=${num1/num2}");
  //     case 0:
  //       exit(0);
  //   }
  // }while(true);
  //4.1
  // print("Square: l");
  // int n = int.parse(stdin.readLineSync()!);
  // Sarea(n);
  // //Sarea(n,l2:3);
  // print("Rectangle l: ");
  // int r1 = int.parse(stdin.readLineSync()!);
  // print("Rectangle w: ");
  // int r2 = int.parse(stdin.readLineSync()!);
  // Rarea(r1, rw: r2);
  // print("circle r: ");
  // int r = int.parse(stdin.readLineSync()!);
  // Carea(r);

}
