import 'package:flutter/material.dart';
import 'package:media_chat_app/screens/profile.dart';
import 'package:media_chat_app/screens/welcome_screen.dart';
import 'package:media_chat_app/theme.dart';
import 'package:media_chat_app/screens/login_registration_screen.dart';
import 'package:media_chat_app/screens/chats/chat_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:media_chat_app/theme_changer.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Splash());
}

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeChanger>(
      create: (_) => ThemeChanger(themeData: lightThemeData(context)),
      child: MaterialWidgetWithTheme(),
    );
  }
}

class MaterialWidgetWithTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme.getTheme(),
        // darkTheme: darkThemeData(context),
        initialRoute: WelcomeScreen.id,
        routes: {
          WelcomeScreen.id: (context) => WelcomeScreen(),
          LoginOrRegistrationScreen.id: (context) =>
              LoginOrRegistrationScreen(),
          ChatScreen.id: (context) => ChatScreen(),
          Profile.id: (context) => Profile(),
        });
  }
}
