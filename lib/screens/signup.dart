import 'package:despensa/main.dart';
import 'package:despensa/services/auth_service.dart';
import 'package:despensa/services/notification_service.dart';
import 'package:despensa/utils/AppPhoneSize.dart';
import 'package:despensa/utils/GetIt.dart';
import 'package:despensa/utils/constantes.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:universal_platform/universal_platform.dart';
// import 'package:flutter/foundation.dart' show kIsWeb;

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  NotificationService notificationService = NotificationService();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  @override
  void initState() {
    if (!UniversalPlatform.isWeb) {
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        RemoteNotification? notification = message.notification;
        AndroidNotification? android = message.notification?.android;
        if (notification != null && android != null) {
          flutterLocalNotificationsPlugin.show(
              notification.hashCode,
              notification.title,
              notification.body,
              NotificationDetails(
                android: AndroidNotificationDetails(
                  channel.id,
                  channel.name,
                  color: Colors.blue,
                  playSound: true,
                  icon: '@mipmap/ic_launcher',
                ),
              ));
        }
      });

      FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
        print('A new onMessageOpenedApp event was published!');
        RemoteNotification? notification = message.notification;
        AndroidNotification? android = message.notification?.android;
        if (notification != null && android != null) {
          showDialog(
              context: context,
              builder: (_) {
                return AlertDialog(
                  title: Text(notification.title!),
                  content: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [Text(notification.body!)],
                    ),
                  ),
                );
              });
        }
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[400],
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Dapp",
                style: TextStyle(fontSize: 30, color: Colors.blueGrey[700]),
              ),
              SizedBox(
                height: 30,
              ),
              Form(
                  child: Column(
                children: [
                  Container(
                    width: widthScreen(context) / 1.2,
                    child: TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Email",
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    width: widthScreen(context) / 1.2,
                    child: TextFormField(
                      controller: passwordController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), labelText: "Password"),
                    ),
                  ),
                ],
              )),
              SizedBox(
                height: 30,
              ),
              Container(
                width: 150,
                margin: EdgeInsets.only(bottom: 15),
                child: ElevatedButton(
                  child: Text(
                    'REGISTAR',
                    style: TextStyle(color: Colors.blueGrey[400]),
                  ),
                  onPressed: () => getIt<AuthService>()
                      .register(emailController.text, passwordController.text)
                      .whenComplete(() {})
                      .then((value) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(value.toString()),
                    ));

                    notificationService.askPermission();
                    if (getIt<AuthService>().isEmailVerified())
                      Navigator.pushNamed(context, family_screen);
                  }),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              TextButton(
                  onPressed: () =>
                      Navigator.pushReplacementNamed(context, login_screen),
                  child: Text(
                    'Already have a account? Log in!',
                    style: TextStyle(color: Colors.black45),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
