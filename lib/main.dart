import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: MyWidget()));
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  
  final TextEditingController salaryController = TextEditingController();
  String employeeType = "standard";
  double? netSalary;
  double? taxAmount;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Calculator Salariu")),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [
            TextField(
              controller: salaryController,
              decoration: const InputDecoration(
                labelText: "Brut Salary",
                border: OutlineInputBorder(),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Align(
                alignment: Alignment.centerLeft,
                child: const Text(
                  "Chose type salary:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),

            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RadioListTile<String>(
                    contentPadding: EdgeInsets.zero,
                    // dense: true,
                    // visualDensity: const VisualDensity(vertical: -4),
                    title: const Text("Standart employee"),
                    value: "standard",
                    groupValue: employeeType,
                    onChanged: (value) {
                      setState(() {
                        employeeType = value!;
                      });
                    },
                  ),

                  RadioListTile<String>(
                    contentPadding: EdgeInsets.zero,
                    title: const Text("Tax-exempt employee"),
                    value: "scutire",
                    groupValue: employeeType,
                    onChanged: (value) {
                      setState(() {
                        employeeType = value!;
                      });
                    },
                  ),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.only(top: 10),
              child: SizedBox(
                width: double.infinity,

                child: ElevatedButton(
                  onPressed: () {
                    double? salary = double.tryParse(salaryController.text);

                    if (salary == null || salary < 0) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Input a valid salary! Try Again"),
                        ),
                      );
                      return;
                    }
                    double taxRate;

                    if (employeeType == "standard") {
                      taxRate = 0.18;
                    } else {
                      taxRate = 0.10;
                    }

                    double tax = salary! * taxRate;
                    double net = salary - tax;

                    setState(() {
                      taxAmount = tax;
                      netSalary = net;
                    });
                  },
                  child: const Text("Calculate"),
                ),
              ),
            ),

            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (taxAmount != null && netSalary != null) ...[
                    const Text(
                      "Results:",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Row(
                      children: [
                        const Text(
                          "Tax:",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text("${taxAmount!.toStringAsFixed(2)} mdl"),
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          "Net Salary:",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text("${netSalary!.toStringAsFixed(2)} mdl"),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
