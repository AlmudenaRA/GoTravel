class User {
  final String id;
  final String userName;
  final String password;
  final String email;
  final String avatar;
  final int puntos;
  final List<String> fav;

  User(this.id, this.userName, this.password, this.email, this.avatar,
      this.puntos, this.fav);

  User.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        userName = json['userName'],
        password = json['password'],
        email = json['email'],
        avatar = json['avatar'],
        puntos = json['puntos'],
        fav = json['fav'].cast<String>();

  Map<String, dynamic> toJson() => {
        'id': id,
        'userName': userName,
        'password': password,
        'email': email,
        'avatar': avatar,
        'puntos': puntos,
        'fav': fav,
      };
}
