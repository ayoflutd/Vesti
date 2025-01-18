class User{
  int? id;
  String? name;
  String? lastname;
  String? email;
  String? avatar;
  String? fcmtoken;
  String? about;
  String? username;
  int? verify;
  int? followings;
  int? followers;
  User({this.id,this.name,this.lastname,this.email,this.avatar,this.fcmtoken,
    this.about,this.username,this.verify,this.followings,this.followers});

  factory User.fromJson(Map<String, dynamic> json){
    return User(
      id: json["id"],
      name: json["name"],
      lastname: json["lastname"],
      email: json["email"],
      avatar: json["avatar"],
      fcmtoken: json["fcmtoken"],
      about: json["about"],
      username: json["username"],
      verify: json["verify"],
      followings: json["followings"],
      followers: json["followers"],
    );
  }

  Map<String, dynamic> toJson()=>{
    "id": id,
    "name": name,
    "lastname": lastname,
    "email": email,
    "avatar": avatar,
    "about": about,
    "username": username,
    "verify": verify,
  };

}

class UserEntity{
  final int code;
  final String message;
  final User data;
  UserEntity({required this.code,required this.message,required this.data});

  factory UserEntity.fromJson(Map<String, dynamic> json){
    return UserEntity(
      code: json["code"],
      message: json["message"],
      data: User.fromJson(json["data"]),
    );
  }
}


class UserId{
  int? id;
  UserId({this.id});

  Map<String, dynamic> toJson()=>{
    "id": id,
  };
}

