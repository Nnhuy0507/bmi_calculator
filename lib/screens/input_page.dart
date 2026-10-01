import 'package:flutter/material.dart';
import '../../constants.dart';
import '../../components/reusable_card.dart';
import '../../components/icon_content.dart';
import '../../components/round_icon_button.dart';
import '../../components/bottom_button.dart';
import 'results_page.dart';
import '../../calculator_brain.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int height = 170;
  int weight = 60;
  int age = 20;
  int selectedGender = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'BMI CALCULATOR',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
        centerTitle: true,
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: ReuseableCard(
                          color: selectedGender == 1
                              ? maleColor.withOpacity(0.2)
                              : cardColor,
                          onTap: () {
                            setState(() {
                              selectedGender = 1;
                            });
                          },
                          child: const IconContent(
                            icon: Icons.male,
                            label: 'MALE',
                          ),
                        ),
                      ),
                      Expanded(
                        child: ReuseableCard(
                          color: selectedGender == 2
                              ? femaleColor.withOpacity(0.2)
                              : cardColor,
                          onTap: () {
                            setState(() {
                              selectedGender = 2;
                            });
                          },
                          child: const IconContent(
                            icon: Icons.female,
                            label: 'FEMALE',
                          ),
                        ),
                      ),
                    ],
                  ),
                  ReuseableCard(
                    color: cardColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'HEIGHT',
                          style: labelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              '$height',
                              style: numberTextStyle,
                            ),
                            const Text(
                              ' cm',
                              style: TextStyle(
                                fontSize: 18,
                                color: secondaryTextColor,
                              ),
                            ),
                          ],
                        ),
                        Slider(
                          value: height.toDouble(),
                          min: 120,
                          max: 220,
                          divisions: 100,
                          activeColor: primaryColor,
                          inactiveColor: Colors.grey.shade300,
                          onChanged: (double value) {
                            setState(() {
                              height = value.round();
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ReuseableCard(
                          color: cardColor,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'WEIGHT',
                                style: labelTextStyle,
                              ),
                              Text(
                                '$weight kg',
                                style: numberTextStyle,
                              ),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                children: [
                                  RoundIconButton(
                                    icon: Icons.remove,
                                    onPressed: () {
                                      setState(() {
                                        if (weight > 1) {
                                          weight--;
                                        }
                                      });
                                    },
                                  ),
                                  const SizedBox(width: 10),
                                  RoundIconButton(
                                    icon: Icons.add,
                                    onPressed: () {
                                      setState(() {
                                        weight++;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: ReuseableCard(
                          color: cardColor,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'AGE',
                                style: labelTextStyle,
                              ),
                              Text(
                                '$age',
                                style: numberTextStyle,
                              ),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                children: [
                                  RoundIconButton(
                                    icon: Icons.remove,
                                    onPressed: () {
                                      setState(() {
                                        if (age > 1) {
                                          age--;
                                        }
                                      });
                                    },
                                  ),
                                  const SizedBox(width: 10),
                                  RoundIconButton(
                                    icon: Icons.add,
                                    onPressed: () {
                                      setState(() {
                                        age++;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
            title: 'CALCULATE',
            onTap: () {
              CalculatorBrain calculator = CalculatorBrain(
                height: height,
                weight: weight,
              );

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                    bmiResult: calculator.calculateBMI(),
                    resultText: calculator.getResult(),
                    interpretation: calculator.getInterpretation(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}