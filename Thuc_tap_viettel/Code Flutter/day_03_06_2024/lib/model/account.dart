class Account {
  String? id;
  String? userName;
  String? password;
  String? fullName;
  String? position;

  Account(
      {this.id, this.userName, this.password, this.fullName, this.position});

  Account.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['userName'];
    password = json['password'];
    fullName = json['fullName'];
    position = json['position'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userName'] = this.userName;
    data['password'] = this.password;
    data['fullName'] = this.fullName;
    data['position'] = this.position;
    return data;
  }
}