class Post {
  int id;
  String nameUser;
  String title;
  String pathImage;
  String scope;
  String? createTime;

  Post({
        this.id=0,
        required this.nameUser,
        required this.title,
        required this.pathImage,
        required this.scope,
        this.createTime
      });

  factory Post.fromMap(Map<String, dynamic> map){
    return Post(
      id: map['id'],
      nameUser: map['name_user'],
      title: map['title'],
      pathImage: map['path_image'],
      scope: map['scope'],
      createTime: map['create_time']
    );
  }

}