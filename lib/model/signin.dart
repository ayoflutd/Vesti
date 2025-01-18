class SignIn{
  final String email;
  final String password;

  SignIn({required this.email,required this.password});

  Map<String, dynamic> toJson()=>{
    "email": email,
    "password": password
  };
}

