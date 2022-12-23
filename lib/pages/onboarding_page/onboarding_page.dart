import 'package:infarm/pages/authentication_page/login_page.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:infarm/constants/constantBuilder.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) => SafeArea(
      child: IntroductionScreen(
        pages: [
          PageViewModel(
            title: "Infarm",
            decoration: pageDecoration(),
            body: "Aplikasi penghubung antar petani dengan pelaku usaha penjual farm input",
            image: Image.asset(onboarding1,),
          ),
          PageViewModel(
            decoration: pageDecoration(),
            title: "Lawan Liberalisasi Harga!",
            body: "Infarm mencegah terjadinya liberalisasi harga terhadap harga beli farm inputs oleh pelaku usaha akibat pandemi Covid-19",
            image: Image.asset(onboarding2)
          ),

          PageViewModel(
            title: "Daftarkan dirimu segera!",
            body: "Ayo eksplorasi berbagai macam harga pertanian yang murah dan terjangkau!",
            image: Image.asset(onboarding3),
           
          ),
        ],
        showNextButton: true,
        showDoneButton: true,
        done: const Text('Selesai',).text.fontFamily(bold).size(19).color(appBlue).make(),
        onDone: (){
          Get.offAll(()=> const LoginPage());
        },
        showSkipButton: true,
        skip: "Lewati".text.fontFamily(bold).size(19).color(appBlue).make(),
        next: const Icon(Icons.arrow_forward_ios_rounded, color: appBlue,),
        dotsDecorator: DotsDecorator(
          activeColor: appBlue,
          size: Size(10,10),
          activeSize: Size(22,10),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25)
          )
        ),
      )
    );
  }

  pageDecoration() => const PageDecoration(
    titleTextStyle: TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.w900
    ),
    bodyPadding: EdgeInsets.symmetric(horizontal: 10),
    fullScreen: true,
    bodyAlignment: Alignment.center,
    bodyFlex: 2,
  );