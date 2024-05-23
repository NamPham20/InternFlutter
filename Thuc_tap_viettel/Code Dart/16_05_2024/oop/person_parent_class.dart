import 'favorite_abstract_class.dart';
import 'tatent_mixins.dart';

class PerSon with Talent implements Favorite {
  var _name;
  var _age;

  PerSon(this._name, this._age);

  void personRun (){
    print("person is running");
  }

  void personWork(){
    print ("persion is working");
  }

   void printInformation() {
    print('Name: $_name, Age: $_age');
  }

  void setName(var name){
    this._name = name;
  }
  getName(){
    return _name;
  }
  void setAge(var age){
    this._age = age;
  }
  getAge(){
    return _age;
  }
  
  @override
  void football() {
    print("I like football");
  }
  
  @override
  void music() {
    print("I like music");
  }
  
  @override
  void playGame() {
    print("I like playing Game");
  }
}