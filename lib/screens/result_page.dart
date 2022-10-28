import 'package:bmi_calculator/packages/package.dart';

class ResultPage extends StatefulWidget {
  double? weight = 0;
  double? height = 0;
  int? age = 0;
  Gender selectGender = Gender.others;

  ResultPage.calc({required this.selectGender, @required this.weight, @required this.height, age});

  ResultPage({Key? key}) : super(key: key);

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  Calculation calc = Calculation();
  double result = 1.0;

  Color ? textColor;

  @override
  void initState() {
    Fluttertoast.cancel();
    result = calc.calculate(widget.weight!, widget.height!);
    textColor = getColor(result);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "BMI  Calculator",
            style: TextStyle(letterSpacing: 1.0),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              const Text(
                "BMI Result : ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                ),
              ),
              Text(
                "${result.toStringAsFixed(1)}",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 55.0,
                  color: textColor,
                ),
              ),
              Container(
                child: Image.asset(
                  "images/bmichart.png",
                  height: 325,
                  width: 325,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color getColor(double result)
  {
    Color colorText = Colors.lightBlue;
    if(result <= 18.5)
    {
      colorText = Colors.lightBlue;
    }
    else if(result <= 24.9)
    {
      colorText = Colors.lightGreen;
    }
    else if(result <= 29.9)
    {
      colorText = Colors.yellow;
    }
    else if(result <= 34.9)
    {
      colorText = Colors.orange;
    }
    else if(result <= 39.9)
    {
      colorText = Colors.deepOrange;
    }
    else
    {
      colorText = Colors.red;
    }
    return colorText;
  }

}
