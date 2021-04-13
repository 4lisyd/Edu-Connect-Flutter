import 'package:firebase_messaging/firebase_messaging.dart';

class Fcm_notifications {
  FirebaseMessaging firebasemessaging = FirebaseMessaging();

  dynamic getToken() {
    firebasemessaging.configure();
  }
}
