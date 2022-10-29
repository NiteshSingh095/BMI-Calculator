import 'package:bmi_calculator/packages/package.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);
  runApp(const MaterialApp(
      title: 'Flutter Demo',
      home: SplashScreen()));
}
