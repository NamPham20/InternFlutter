import 'user_subclass.dart';

void main(List<String> args) {
  User user = User("Hoàng", 20, "xx123", "hoang@gmail.com","hoanghoang");

  user.personRun();
  user.personWork();
  user.printInformation();

  User user1 = User.origin();
  user1.printInformation();

  user1.setAge(30);
  user1.printInformation();

  User user2 = User.createName("Phong");
  user2.printInformation();

  user.playGame();
  user1.music();
  user2.football();

  user.fly();
  user1.swimming();
  user2.fighting();

}