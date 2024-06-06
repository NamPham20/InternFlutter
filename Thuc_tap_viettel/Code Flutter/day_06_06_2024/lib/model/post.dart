class Post {
  String? id;
  String nameUser;
  String title;
  String pathImage;
  String scope;
  String? createTime;

  Post({
        this.id,
        required this.nameUser,
        required this.title,
        required this.pathImage,
        required this.scope,
        this.createTime
      });
}