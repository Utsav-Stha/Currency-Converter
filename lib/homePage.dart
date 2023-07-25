import 'package:flutter/material.dart';

import 'package:dropdown_button2/dropdown_button2.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('CURRENCY CONVERTER')),
        // titleSpacing: 5,
      ),
      body: Body(),
    );
  }
}

class Body extends StatefulWidget {
  Body({super.key});

  @override
  State<Body> createState() => BodyState();
}

class BodyState extends State<Body> {
  final items = ['DOLLAR', 'INR', 'NPR'];
  TextEditingController inputAmount = TextEditingController();

  final text = 'FROM : ';

  String? selectedValue1;

  String? selectedValue2;
  String? output = '0';

  void Converter(String? first, String? second) {
    if (first == second) {
      output = inputAmount.text;
    }
    //dollar to INR and vice-versa
    else if (first == items[0] && second == items[1] ||
        first == items[1] && second == items[0]) {
      output = DollarInr(inputAmount.text, first)!.toStringAsFixed(3);
    }
    //dollar to NPR and vice-versa
    else if (first == items[0] && second == items[2] ||
        first == items[2] && second == items[0]) {
      output = DollarNpr(inputAmount.text, first)!.toStringAsFixed(3);
    }
    //NPR to INR and vice-versa
    else if (first == items[1] && second == items[2] ||
        first == items[2] && second == items[1]) {
      output = InrNpr(inputAmount.text, first)!.toStringAsFixed(3);
    }

    setState(() {
      output;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
            height: 200,
            child: Container(
              padding: EdgeInsets.only(top: 40),
              // width: 300,
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.only(left: 65.0),
                        child: Text(
                          ('From'),
                          style: TextStyle(
                            fontSize: 20,
                            color: Theme.of(context).hintColor,
                          ),
                        ),
                      )),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 50.0),
                          child: Center(
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton2<String>(
                                isExpanded: true,
                                hint: Text(
                                  'Select',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Theme.of(context).hintColor,
                                  ),
                                ),
                                items: items
                                    .map((String item) =>
                                        DropdownMenuItem<String>(
                                          value: item,
                                          child: Text(
                                            item,
                                            style: const TextStyle(
                                              fontSize: 20,
                                            ),
                                          ),
                                        ))
                                    .toList(),
                                value: selectedValue1,
                                onChanged: (String? value) {
                                  setState(
                                    () {
                                      selectedValue1 = value;
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 15.0, left: 25, right: 25),
                    child: TextField(
                      controller: inputAmount,
                      decoration: InputDecoration(
                        hintText: 'Enter your value',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0)),
                      ),
                    ),
                  ),
                ],
              ),
            )),
        Container(
          // padding: EdgeInsets.only(top: 40),
          // width: 300,
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.only(left: 65.0),
                    child: Text(
                      "To",
                      style: TextStyle(
                        fontSize: 20,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                  )),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 50.0),
                      child: Center(
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton2<String>(
                            isExpanded: true,
                            hint: Text(
                              'Select',
                              style: TextStyle(
                                fontSize: 20,
                                color: Theme.of(context).hintColor,
                              ),
                            ),
                            items: items
                                .map((String item) => DropdownMenuItem<String>(
                                      value: item,
                                      child: Text(
                                        item,
                                        style: const TextStyle(
                                          fontSize: 20,
                                        ),
                                      ),
                                    ))
                                .toList(),
                            value: selectedValue2,
                            onChanged: (String? value) {
                              setState(
                                () {
                                  selectedValue2 = value;
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0, left: 25, right: 25),
                child: Container(
                  height: 50,
                  width: 450,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.transparent,
                      border: Border.all(color: Colors.black)),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(output!),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 50,
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(30.0),
          child: ElevatedButton(
            onPressed: () {
              Converter(selectedValue1, selectedValue2);
            },
            child: Container(
              margin: EdgeInsets.all(15),
              child: Text(
                'Convert',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

double? DollarInr(String? amount, String? type) {
  double? a = double.parse(amount!);
  if (type == 'DOLLAR') {
    return a * 81.2;
  } else {
    return a * 0.012;
  }
}

double? DollarNpr(String? amount, String? type) {
  double? a = double.parse(amount!);
  if (type == 'DOLLAR') {
    return a * 130.89;
  } else {
    return a * 0.0076;
  }
}

double? InrNpr(String? amount, String? type) {
  double? a = double.parse(amount!);
  if (type == 'INR') {
    return a * 1.60;
  } else {
    return a * 0.63;
  }
}
