
import 'dart:math';

import 'package:app_settings/app_settings.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationServices{
  FirebaseMessaging messaging=FirebaseMessaging.instance;
  String? token;

  void requestNotificationpermission()async{
    NotificationSettings settings= await messaging.requestPermission(
      alert: true,
      badge: true,
      carPlay: true,
      criticalAlert: true,
      provisional: true,
      sound: true
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized){
      print("User granted permission");
    }
    else if(settings.authorizationStatus == AuthorizationStatus.provisional){
      print("User granted provisional permission");
    }else{
      AppSettings.openAppSettings();
      print("User denied permission");
    }
  }



  final  FlutterLocalNotificationsPlugin _flutterLocalNotifcationPlugin=FlutterLocalNotificationsPlugin() ;


  void initLocalNotification(BuildContext context, RemoteMessage message) async{

    var androidInitializationSettings=AndroidInitializationSettings("@mipmap/ic_launcher");
    var iOsInitializationSettings=const DarwinInitializationSettings();

    var initializationSettings=InitializationSettings(
      android: androidInitializationSettings,
      iOS:iOsInitializationSettings,
    );

    await _flutterLocalNotifcationPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (payload){

      }
    );

  }



  void firebaseInit(){
    FirebaseMessaging.onMessage.listen((message) {

      if(kDebugMode){
        print(message.notification!.title.toString());
        print(message.notification!.body.toString());
      }
      showNotifications(message);

    });
  }

  Future<void> showNotifications(RemoteMessage message)async{

    AndroidNotificationChannel channel= AndroidNotificationChannel(
      Random.secure().nextInt(1000).toString(),
      'High Importance Notification',
      importance: Importance.max
    ) ;

    AndroidNotificationDetails androidNotificationDetails =AndroidNotificationDetails(
      channel.id.toString(),
      channel.name.toString(),
      channelDescription:'your channel description',
      importance: Importance.high,
      priority: Priority.high,
      ticker: "ticker",
        icon: '@mipmap/ic_launcher'
    );

    const DarwinNotificationDetails darwinNotificationDetails =DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    NotificationDetails notificationDetails=NotificationDetails(
      android: androidNotificationDetails,
      iOS: darwinNotificationDetails,
    );

    Future.delayed(Duration.zero,() async{
      _flutterLocalNotifcationPlugin.show(
          0,
          message.notification!.title.toString(),
          message.notification!.body.toString(),
          notificationDetails
      );
    });
  }

  Future<String?> getDevicetoken() async {
    token = await messaging.getToken();
    if (token == null) {
      throw Exception('Failed to retrieve device token');
    }
    return token;
  }


  void UpdateFirebase(String tokenId) async {
    User? _currentUser = FirebaseAuth.instance.currentUser;
    if (_currentUser != null) {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('userEmail', isEqualTo: _currentUser.email)
          .limit(1)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        String documentId = querySnapshot.docs.first.id;

        // Get document data
        Map<String, dynamic>? data = querySnapshot.docs.first.data() as Map<String, dynamic>?;

        // Check if data is not null and contains 'tokenId' field
        if (data != null && data.containsKey('tokenId')) {
          // Update the value of the 'tokenId' field
          await FirebaseFirestore.instance
              .collection('users')
              .doc(documentId)
              .update({'tokenId': tokenId});
        }
        print('Field added/updated successfully!');
      } else {
        print('User document not found!');
      }
    } else {
      print('Current user not found!');
    }
  }




  void isTokenrefresh() async {
    messaging.onTokenRefresh.listen((event) {
      event.toString();
      print("refresh");
    });
  }

}



class MyFirebaseMessagingService {
  @override
  Future<void> onMessage(RemoteMessage message) async {
    print("onMessage: $message");
  }

  @override
  Future<void> onBackgroundMessage(RemoteMessage message) async {
    print("onBackgroundMessage: $message");
  }

  @override
  Future<void> onMessageOpenedApp(RemoteMessage message) async {
    print("onMessageOpenedApp: $message");
  }
}
