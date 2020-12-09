import 'package:flutter/material.dart';

// class searchbycityblock extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
//
// class searchbysubjectblock extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
//
// class searchbytestprepblock extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }

class Searchbycityblock {
  String title;
  String imageAsset;
  Function onPressFunc;

  Searchbycityblock([this.title, this.imageAsset, this.onPressFunc]);
}

List<Searchbycityblock> list_searchbycityblock = [
  Searchbycityblock("Victoria",
      "/edu_connect/lib/assets/userData/defaultUserAvatar.png", () {}),
  Searchbycityblock("Tronto",
      "/edu_connect/lib/assets/userData/defaultUserAvatar.png", () {}),
  Searchbycityblock("Vancouver",
      "/edu_connect/lib/assets/userData/defaultUserAvatar.png", () {}),
  Searchbycityblock("Calgary",
      "/edu_connect/lib/assets/userData/defaultUserAvatar.png", () {}),
];

//Searchbycityblock searchbycityblock = Searchbycityblock();

class Searchbysubjectblock {
  String title;
  String imageAsset;
  Function onPressFunc;

  Searchbysubjectblock([this.title, this.imageAsset, this.onPressFunc]);
}

List<Searchbysubjectblock> list_searchbysubjectblock = [
  Searchbysubjectblock(
      "Maths", "/edu_connect/lib/assets/userData/defaultUserAvatar.png", () {}),
  Searchbysubjectblock("English",
      "/edu_connect/lib/assets/userData/defaultUserAvatar.png", () {}),
  Searchbysubjectblock("Arabic",
      "/edu_connect/lib/assets/userData/defaultUserAvatar.png", () {}),
  Searchbysubjectblock("Geology",
      "/edu_connect/lib/assets/userData/defaultUserAvatar.png", () {}),
];

class Searchbytestprepblock {
  String title;
  String imageAsset;
  Function onPressFunc;

  Searchbytestprepblock([this.title, this.imageAsset, this.onPressFunc]);
}

List<Searchbytestprepblock> list_searchbytestprepblock = [
  Searchbytestprepblock(
      "IELTS", "/edu_connect/lib/assets/userData/defaultUserAvatar.png", () {}),
  Searchbytestprepblock(
      "FSC", "/edu_connect/lib/assets/userData/defaultUserAvatar.png", () {}),
  Searchbytestprepblock("Engineering",
      "/edu_connect/lib/assets/userData/defaultUserAvatar.png", () {}),
  Searchbytestprepblock("Humanity Sci",
      "/edu_connect/lib/assets/userData/defaultUserAvatar.png", () {}),
];
