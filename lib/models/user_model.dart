class UserModel {
  String nama, userID;
  UserModel({required this.nama, required this.userID});

  //mengambil data dari JSON untuk diconvert ke dalam map
  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        nama: json['nama'],
        userID: json["userId"],
      );

  //menconvert map menjadi JSON
  Map<String, dynamic> toJson() => {"nama": nama, "userId": userID};
}
