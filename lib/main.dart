
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'Views/Authentication/SplashScreen.dart';
import 'Widgets/constants.dart';
import 'firebase_options.dart';

void main()  async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  runApp( MyApp());
}


@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();

  if (message.notification != null) {
    print(message.notification!.title);
  } else {
    print('Message notification is null');
  }
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_ , child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          // You can use the library anywhere in the app even in theme
          theme: ThemeData(

            fontFamily: 'Poppins',
            focusColor: Colors.green.withOpacity(0.7),
            textSelectionTheme: TextSelectionThemeData(
              cursorColor: PrimaryColors.whitetext,
            )

          ),


          home: child,
        );
      },
      child:  SplashScreen(),
    );
  }
}
