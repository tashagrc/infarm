import 'package:infarm/constants/constantBuilder.dart';
import 'package:infarm/pages/onboarding_page/onboarding_page.dart';
import 'package:infarm/pages/splash_screen.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FlutterNativeSplash.remove();
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
          iconTheme: IconThemeData(color: white),
          backgroundColor: appBlue,
        ),
        scaffoldBackgroundColor: bgWhite,
        fontFamily: regular,
      ),
      home: const OnboardingPage(),
    );
  }
}
