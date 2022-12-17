
import 'package:infarm/constants/constantBuilder.dart';
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
          backgroundColor: appBlue,
        ),
        scaffoldBackgroundColor: bgWhite,
        fontFamily: regular,
      ),
      home: const SplashScreen(),
    );
  }
}
