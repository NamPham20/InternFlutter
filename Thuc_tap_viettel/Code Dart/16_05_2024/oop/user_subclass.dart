import 'person_parent_class.dart';

class User extends PerSon{

var _id ;
var _userName;
var _password;

  //Generative constructors
   User(String name, int age, this._id, this._userName, this._password) : super(name, age);

  //name constructors
   User.origin() : 
   this._id= "xx111",
   this._userName ="Nam@gmail.com",
   this._password="namnam",
   super("Nam",20);
  
  User.createName(String name) : this(name,20,"xxx"+"$name","$name"+"@gmail.com","$name"+"$name");

  @override
  void printInformation(){
    super.printInformation(); 
    print('ID: $_id, UserName: $_userName, Password: $_password');
  }


void setId(var id){
  this._id = id;
}
getId(){
  return _id;
}
void setUserName(var useName){
  this._userName = useName;
}
getUserName(){
  return _userName;
}
void setPassword(var password){
  this._password = password;
}
getPassword(){
  return _password;
}

  
}