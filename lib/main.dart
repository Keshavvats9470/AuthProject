import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:project_socioapp/providers/user_provider.dart';
import 'package:project_socioapp/responsive/mobile_screen_layout.dart';
import 'package:project_socioapp/responsive/responsive_layout_screen.dart';
import 'package:project_socioapp/responsive/web_screen_layout.dart';
import 'package:project_socioapp/screens/login_screen.dart';
import 'package:project_socioapp/screens/signup_screen.dart';
import 'package:project_socioapp/utils/colors.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: 'AIzaSyBzhVLGUYj8es6ud-W9vz7I43m6GS9QOcw',
          appId: '1:994732390254:web:6d763d31ca5691c470737f',
          messagingSenderId: '994732390254',
          projectId: 'project-social-fadf0',
          storageBucket: "project-social-fadf0.appspot.com"),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Social Code',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: mobileBackgroundColor,
        ),

        // concept of persisting user authentication state
        // we will store some uid from memory and if that is authenticated or not
        // we will persist that in firebase
        home: StreamBuilder(
          // looks at changes, suppose the user restores that in new device. userChanges -> when signin signout happens with, updation qualities.
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              if (snapshot.hasData) {
                return const ResponsiveLayout(
                  mobileScreenLayout: MobileScreenLayout(),
                  webScreenLayout: WebScreenLayout(),
                );
              } else if (snapshot.hasError) {
                return Center(
                    child: Text(
                  '${snapshot.error}',
                ));
              }
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(color: primaryColor),
              );
            }

            return const LoginScreen();
          },
        ),
      ),
    );
  }
}

// Here it code