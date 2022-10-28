import 'package:bmi_calculator/packages/package.dart';

class Input_Page extends StatefulWidget {
  const Input_Page({Key? key}) : super(key: key);

  @override
  State<Input_Page> createState() => _Input_PageState();
}

class _Input_PageState extends State<Input_Page> {
  Gender selectGender = Gender.others;
  int slideValue = 146;
  int weight = 50;
  int age = 20;
  Timer? _timer;

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
        body: Column(
          children: <Widget>[
            //creating 1st element of col

            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectGender = Gender.male;
                        });
                      },
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const <Widget>[
                            Icon(
                              FontAwesomeIcons.mars,
                              color: Colors.white,
                              size: 80,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "MALE",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  letterSpacing: 1.0),
                            ),
                          ],
                        ),
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: selectGender == Gender.male
                                ? Colors.cyan
                                : Colors.lightBlue),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectGender = Gender.female;
                        });
                      },
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const <Widget>[
                            Icon(
                              FontAwesomeIcons.venus,
                              color: Colors.white,
                              size: 80,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "FEMALE",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  letterSpacing: 1.0),
                            ),
                          ],
                        ),
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: selectGender == Gender.female
                                ? Colors.cyan
                                : Colors.lightBlue),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            //Creating 2nd  element of col

            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text(
                            "HEIGHT",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                letterSpacing: 1.0),
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          Row(
                            textBaseline: TextBaseline.alphabetic,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                slideValue.toString(),
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 65,
                                    letterSpacing: 1.0),
                              ),
                              const Text(
                                "cm",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    letterSpacing: 1.0),
                              )
                            ],
                          ),
                          Slider(
                            value: slideValue.toDouble(),
                            min: 146,
                            max: 193,
                            onChanged: (value) {
                              setState(() {
                                slideValue = value.toInt();
                              });
                            },
                            inactiveColor: Colors.white,
                          ),
                        ],
                      ),
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.lightBlue),
                    ),
                  ),
                ],
              ),
            ),

            //Creating 3rd element of col

            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          const Text(
                            "WEIGHT",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                letterSpacing: 1.0),
                          ),
                          Text(
                            weight.toString(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 60,
                                letterSpacing: 1.0),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (weight > 150)
                                      weight = 50;
                                    else
                                      weight++;
                                  });
                                },
                                onTapDown: (TapDownDetails details) {
                                  print('down');
                                  _timer = Timer.periodic(
                                      Duration(milliseconds: 100), (t) {
                                    setState(() {
                                      if (weight > 150)
                                        weight = 50;
                                      else
                                        weight++;
                                    });
                                  });
                                },
                                onTapUp: (TapUpDetails details) {
                                  print('up');
                                  _timer!.cancel();
                                },
                                onTapCancel: () {
                                  print('cancel');
                                  _timer!.cancel();
                                },
                                child: const CircleAvatar(
                                  child: Icon(
                                    FontAwesomeIcons.plus,
                                    color: Colors.lightBlue,
                                  ),
                                  backgroundColor: Colors.white,
                                  radius: 22.0,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (weight < 5)
                                      weight = 50;
                                    else
                                      weight--;
                                  });
                                },
                                onTapDown: (TapDownDetails details) {
                                  print('down');
                                  _timer = Timer.periodic(
                                      Duration(milliseconds: 100), (t) {
                                    setState(() {
                                      if (weight < 5)
                                        weight = 50;
                                      else
                                        weight--;
                                    });
                                  });
                                },
                                onTapUp: (TapUpDetails details) {
                                  print('up');
                                  _timer!.cancel();
                                },
                                onTapCancel: () {
                                  print('cancel');
                                  _timer!.cancel();
                                },
                                child: const CircleAvatar(
                                  child: Icon(
                                    FontAwesomeIcons.minus,
                                    color: Colors.lightBlue,
                                  ),
                                  backgroundColor: Colors.white,
                                  radius: 22.0,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.lightBlue),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          const Text(
                            "AGE",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                letterSpacing: 1.0),
                          ),
                          Text(
                            age.toString(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 60,
                                letterSpacing: 1.0),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (age > 100)
                                      age = 30;
                                    else
                                      age++;
                                  });
                                },
                                onTapDown: (TapDownDetails details) {
                                  print('down');
                                  _timer = Timer.periodic(
                                      Duration(milliseconds: 100), (t) {
                                    setState(() {
                                      if (age > 100)
                                        age = 30;
                                      else
                                        age++;
                                    });
                                  });
                                },
                                onTapUp: (TapUpDetails details) {
                                  print('up');
                                  _timer!.cancel();
                                },
                                onTapCancel: () {
                                  print('cancel');
                                  _timer!.cancel();
                                },
                                child: const CircleAvatar(
                                  child: Icon(
                                    FontAwesomeIcons.plus,
                                    color: Colors.lightBlue,
                                  ),
                                  backgroundColor: Colors.white,
                                  radius: 22.0,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (age < 5)
                                      age = 20;
                                    else
                                      age--;
                                  });
                                },
                                onTapDown: (TapDownDetails details) {
                                  print('down');
                                  _timer = Timer.periodic(
                                      Duration(milliseconds: 100), (t) {
                                    setState(() {
                                      if (age < 5)
                                        age = 20;
                                      else
                                        age--;
                                    });
                                  });
                                },
                                onTapUp: (TapUpDetails details) {
                                  print('up');
                                  _timer!.cancel();
                                },
                                onTapCancel: () {
                                  print('cancel');
                                  _timer!.cancel();
                                },
                                child: const CircleAvatar(
                                  child: Icon(
                                    FontAwesomeIcons.minus,
                                    color: Colors.lightBlue,
                                  ),
                                  backgroundColor: Colors.white,
                                  radius: 22.0,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.lightBlue),
                    ),
                  ),
                ],
              ),
            ),

            //  Creating 4th element of col

            GestureDetector(
              onTap: () {
                if (selectGender == Gender.male ||
                    selectGender == Gender.female) {
                  setState(() {
                    Fluttertoast.cancel();
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultPage.calc(
                            selectGender: selectGender,
                            weight: weight.toDouble(),
                            height: slideValue.toDouble())),
                  );
                } else {
                  Fluttertoast.showToast(
                      msg: "Select Gender",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0);
                }
              },
              child: Container(
                color: Colors.blue,
                width: double.infinity,
                height: 60,
                child: const Center(
                  child: Text(
                    "CALCULATE",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
