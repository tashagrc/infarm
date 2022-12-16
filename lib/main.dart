
import 'package:firebase_auth/firebase_auth.dart';
import 'package:infarm/constants/constantBuilder.dart';
import 'package:infarm/pages/authentication_page/login_page.dart';
import 'package:infarm/pages/homescreen_page/home_page.dart';
import 'package:infarm/pages/homescreen_page/navigation.dart';
import 'package:infarm/pages/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Infarm',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
        ),
        scaffoldBackgroundColor: bgWhite,
        fontFamily: regular,
      ),
      home: const SplashScreen(),
    );
  }
}
