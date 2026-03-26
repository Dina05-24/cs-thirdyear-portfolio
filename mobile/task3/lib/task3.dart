
class Human{
  String? name;
  int? age;
  int _numberOfArms=2;
  double? hight;
  double? weight;
  Human({required this.name,required this.age,required this.hight,required this.weight});
  void run(){
    print("running");
  }
  void eat()=>print("eating");
  void sleep(){
    print("sleeping");
  }
  void walk(){
    print("walking");
  }
  void talk(){
    print("talking");
  }
  void jump(){
    print("jumping");
  }
  void swim(){
    print("swimming");
  }
}