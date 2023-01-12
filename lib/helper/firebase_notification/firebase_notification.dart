import 'dart:io';
import 'dart:math';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'notification_handler.dart';

class FirebaseNotification {
  FirebaseMessaging? _messaging;
  BuildContext? myContext;
  String myToken = "";

  void setupFirebase(BuildContext? context) {
    _messaging = FirebaseMessaging.instance;
    NotificationHandler.initNotification(context!);
    firebaseCloudMessageListener(context);
    myContext = context;
  }

  void firebaseCloudMessageListener(BuildContext context) async {
    NotificationSettings settings = await _messaging!.requestPermission(
        alert: true,
        announcement: true,
        badge: true,
        carPlay: false,
        provisional: false,
        sound: true);

    print("setting ${settings.authorizationStatus}");
    // use token to receive notification
    _messaging!.getToken().then((token) {
      print("MyToken: $token");
      myToken = token.toString();
    });

    // send to topic
    _messaging!
        .subscribeToTopic("native")
        .whenComplete(() => print("Subscribe ok"));

    // when app is terminated you can get a notification
    /* FirebaseMessaging.instance.getInitialMessage().then((message) {
      print("new notification");
      print(message.data["_id"]);

    });
*/

    // handle message
    // when app in foreground it mean app must be opened
    FirebaseMessaging.onMessage.listen((RemoteMessage remoteMessage) {
      print("receive ${remoteMessage}");
      if (Platform.isAndroid) {
        showNotification(
            remoteMessage.notification!.title,
            remoteMessage.notification!.body,
            remoteMessage.notification!.android!.imageUrl != null
                ? remoteMessage.notification!.android!.imageUrl!
                : "");
      } else if (Platform.isIOS) {
        showNotification(
            remoteMessage.notification!.title,
            remoteMessage.notification!.body,
            remoteMessage.notification!.android!.imageUrl != null
                ? remoteMessage.notification!.android!.imageUrl!
                : "");
      }
    });

    // when app in background and not terminated (not closed)
    FirebaseMessaging.onMessageOpenedApp.listen((remoteMessageing) {
      print("Receive Open app ${remoteMessageing}");
      if (Platform.isIOS) {
        // showDialog(
        //     context: myContext!,
        //     builder: (context) => CupertinoAlertDialog(
        //           title: Text(remoteMessageing.notification!.title!),
        //           content: Text(remoteMessageing.notification!.body!),
        //           actions: [
        //             CupertinoDialogAction(
        //               isDefaultAction: true,
        //               child: Text("OK"),
        //               onPressed: () {
        //                 Navigator.of(context, rootNavigator: true).pop();
        //               },
        //             ),
        //           ],
        //         ));
      } else {}
    });
  }

  static void showNotification(title, body, String imageUrl) async {
    int id = Random().nextInt(1000);

    /* Future<Uint8List> getImageBytes() async{
      http.Response response = await http.get(
          Uri.parse(imageUrl));
      return response.bodyBytes; //Uint8List
    }*/

    /* getImageBytes().then((bodyBytes) async {

    });*/

    var iosChannel = const DarwinNotificationDetails();
    AndroidNotificationDetails androidChannel;

    androidChannel = const AndroidNotificationDetails(
        "com.appnormal.native_talk_academy", "My Channel",
        autoCancel: false,
        ongoing: true,
        importance: Importance.max,
        playSound: true,
        priority: Priority.high);

    //var ios = IOSNotificationDetails();
    var notificationDetails =
        NotificationDetails(android: androidChannel, iOS: iosChannel);
/*
      var platform = NotificationDetails(android: androidChannel, iOS: ios);
*/
    await NotificationHandler.flutterLocalNotificationPlugin
        .show(id, title, body, notificationDetails);
  }
}
