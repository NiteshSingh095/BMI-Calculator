import 'package:bmi_calculator/packages/package.dart';

class Calculation
{

  double calculate(double weight, double height)
  {
    height = height / 100;

    double result = weight / (height * height) ;

    return result;

  }
}