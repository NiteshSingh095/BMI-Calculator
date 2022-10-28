import 'package:bmi_calculator/packages/package.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _navigateToHome();
    super.initState();
  }

  _navigateToHome() async {
    await Future.delayed(Duration(milliseconds: 2000), () {});

    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => Input_Page()));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 200),
                child: Image.asset(
                  "images/bmi.png",
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 0),
                child: const Text(
                  "Body Mass Index",
                  style: TextStyle(
                      fontSize: 24,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 3.0,
                  color: Colors.black26),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
