class User {
  int? id;
  String? name, username, email;

  User(this.id, this.name, this.username, this.email);

  User.fromMap(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
    email = json['email'];
  }
}
