import 'package:firebase_auth/firebase_auth.dart';
import 'package:infarm/constants/constantBuilder.dart';
import 'package:infarm/pages/homescreen_page/navigation.dart';
import 'package:infarm/pages/onboarding_page/onboarding_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    routeScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBlue,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage(splashBg), fit: BoxFit.fill),
        ),
      ),
    );
  }

  routeScreen(){
    Future.delayed(const Duration(seconds: 3), () {
      auth.authStateChanges().listen((User? user) { 
        if(user == null && mounted) {
          Get.offAll(() => const OnboardingPage());
        } else {
          Get.offAll(()=> const Navigation());
        }
      });
    });
  }

}