import 'package:flutter/material.dart';

class Searchbycityblock {
  String title;
  String imageAsset;
  Function onPressFunc;

  Searchbycityblock([this.title, this.imageAsset, this.onPressFunc]);
}

//// you can add cities here

List<Searchbycityblock> list_searchbycityblock = [
  Searchbycityblock(
      "Victoria", "lib/assets/userData/defaultUserAvatar.png", () {}),
  Searchbycityblock(
      "Tronto", "lib/assets/userData/defaultUserAvatar.png", () {}),
  Searchbycityblock(
      "Vancouver", "lib/assets/userData/defaultUserAvatar.png", () {}),
  Searchbycityblock(
      "Calgary", "lib/assets/userData/defaultUserAvatar.png", () {}),
];

//Searchbycityblock searchbycityblock = Searchbycityblock();

class Searchbysubjectblock {
  String title;
  String imageAsset;
  Function onPressFunc;

  Searchbysubjectblock([this.title, this.imageAsset, this.onPressFunc]);
}

//// you can add subjects here

List<Searchbysubjectblock> list_searchbysubjectblock = [
  Searchbysubjectblock(
      "Maths", "lib/assets/UI_pictures/subject_icons/maths.png", () {}),
  Searchbysubjectblock(
      "English", "lib/assets/UI_pictures/subject_icons/english.png", () {}),
  Searchbysubjectblock(
      "Arabic", "lib/assets/UI_pictures/subject_icons/arabic.png", () {}),
  Searchbysubjectblock(
      "Science", "lib/assets/UI_pictures/subject_icons/science.png", () {}),
  Searchbysubjectblock("Social Studies",
      "lib/assets/UI_pictures/subject_icons/socialstudies.png", () {}),
];

//// you can add tests here

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
