import 'package:flutter/material.dart';
import 'package:temperature_conversion_app/visuals/conversion_visuals.dart';

class TemperatureConversionApp extends StatefulWidget {
  const TemperatureConversionApp({super.key});

  @override
  State<TemperatureConversionApp> createState() =>
      _TemperatureConversionAppState();
}

class _TemperatureConversionAppState extends State<TemperatureConversionApp> {
  final List<Widget> _calculationHistory = [];
  String? _selectedOption = "fahrenheit";
  String _temperatureValue = "";
  String? _typeError = "";
  final TextEditingController _convertedController = TextEditingController();

  /*
    @func _onsubmit Private method
    @params None
    @return None
  */
  void _onSubmit() {
    num? parsedValue;

    if (_temperatureValue.isEmpty) {
      setState(() {
        _typeError = "Please enter decimal or whole number.";
      });
    } else if (int.tryParse(_temperatureValue) != null) {
      parsedValue = int.parse(_temperatureValue);
      _calculateTemperature(parsedValue);
    } else if (double.tryParse(_temperatureValue) != null) {
      parsedValue = double.parse(_temperatureValue);
      _calculateTemperature(parsedValue);
    } else {
      setState(() {
        _typeError = "Please enter decimal or whole number.";
      });
    }
  }

  /*
    @func _calculateTemperature Private method
    @params [{"name": parsedValue, "type": int}]
    @return None
  */
  void _calculateTemperature(num parsedValue) {
    switch (_selectedOption) {
      case null:
        return;
      case "fahrenheit":
        String tempConversion =
            ((5 / 9) * (parsedValue - 32)).toStringAsFixed(2);
        setState(() {
          _convertedController.text = tempConversion;
          _typeError = "";
          _calculationHistory.add(Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "F to C:",
                style: TextVisuals.getTextStyle(32.0, 800.0, 255, 0, 0, 0),
              ),
              Text(
                "$parsedValue",
                style: TextVisuals.getTextStyle(32.0, 800.0, 255, 0, 0, 0),
              ),
              const SizedBox(
                width: 2.0,
              ),
              const Icon(
                Icons.arrow_forward,
                size: 40.0,
                weight: 700.0,
              ),
              const SizedBox(
                width: 2.0,
              ),
              Text(
                tempConversion,
                style: TextVisuals.getTextStyle(32.0, 800.0, 255, 0, 0, 0),
              ),
            ],
          ));
        });
        break;
      case "celsius":
        String tempConversion =
            (((9 / 5) * parsedValue) + 32).toStringAsFixed(2);
        setState(() {
          _convertedController.text = tempConversion;
          _typeError = "";
          _calculationHistory.add(Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "C to F:",
                style: TextVisuals.getTextStyle(32.0, 800.0, 255, 0, 0, 0),
              ),
              Text(
                "$parsedValue",
                style: TextVisuals.getTextStyle(32.0, 800.0, 255, 0, 0, 0),
              ),
              const SizedBox(
                width: 2.0,
              ),
              const Icon(
                Icons.arrow_forward,
                size: 40.0,
                weight: 700.0,
              ),
              const SizedBox(
                width: 2.0,
              ),
              Text(
                tempConversion,
                style: TextVisuals.getTextStyle(32.0, 800.0, 255, 0, 0, 0),
              ),
            ],
          ));
        });
        break;
      default:
    }
  }

  /*
    This callback function is used to clear
    all history. 
  */
  void _clearHistory() {
    setState(() {
      _calculationHistory.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0.0,
        title: Text(
          "Converter",
          style: TextVisuals.getTextStyle(32.0, 400.0, 255, 255, 255, 255),
        ),
        backgroundColor: Colors.blue.shade800,
      ),
      body: ListView(
        padding: const EdgeInsets.only(top: 5.0),
        children: [
          Text(
            "Conversion:",
            style: TextVisuals.getTextStyle(22.0, 800.0, 255, 0, 0, 0),
          ),
          const SizedBox(
            height: 5.0,
          ),
          Form(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                        child: RadioListTile(
                            title: Text(
                              "Fahrenheit to Celsius",
                              style: TextVisuals.getTextStyle(
                                  16.0, 800.0, 255, 0, 0, 0),
                            ),
                            selected: _selectedOption == "fahrenheit",
                            activeColor: Colors.black54,
                            value: "fahrenheit",
                            groupValue: _selectedOption,
                            onChanged: (String? radioValue) {
                              setState(() {
                                _selectedOption = radioValue;
                                // print(radioValue ?? "fahrenheit" "fahr");
                              });
                            })),
                    Expanded(
                        child: RadioListTile(
                            title: Text(
                              "Celsius to Fahrenheit",
                              style: TextVisuals.getTextStyle(
                                  16.0, 800.0, 255, 0, 0, 0),
                            ),
                            selected: _selectedOption == "celsius",
                            activeColor: Colors.black54,
                            value: "celsius",
                            groupValue: _selectedOption,
                            onChanged: (String? radioValue) {
                              setState(() {
                                _selectedOption = radioValue;
                                // print(radioValue ?? "celsius" "cel");
                              });
                            }))
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: 140.0,
                          height: 50.0,
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.done,
                            autofocus: true,
                            initialValue: _temperatureValue,
                            cursorHeight: 30.0,
                            style: TextVisuals.getTextStyle(
                                25.0, 900.0, 255, 0, 0, 0),
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.fromLTRB(
                                  10.0, 0.0, 10.0, 17.0),
                              filled: true,
                              fillColor: Colors.grey.shade300,
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide:
                                    const BorderSide(color: Colors.black),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide:
                                    const BorderSide(color: Colors.black),
                              ),
                            ),
                            onChanged: (String textValue) {
                              setState(() {
                                _temperatureValue = textValue;
                              });
                            },
                          ),
                        ),
                        const SizedBox(width: 10.0),
                        Text(
                          "=",
                          style: TextVisuals.getTextStyle(
                              45.0, 800.0, 255, 0, 0, 0),
                        ),
                        const SizedBox(width: 10.0),
                        SizedBox(
                          width: 140.0,
                          height: 50.0,
                          child: TextFormField(
                              enabled: false,
                              controller: _convertedController,
                              style: TextVisuals.getTextStyle(
                                  25.0, 900.0, 255, 0, 0, 0),
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.fromLTRB(
                                    10.0, 0.0, 10.0, 17.0),
                                filled: true,
                                fillColor: Colors.grey.shade300,
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  borderSide:
                                      const BorderSide(color: Colors.black),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  borderSide:
                                      const BorderSide(color: Colors.black),
                                ),
                              )),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "$_typeError",
                      style:
                          TextVisuals.getTextStyle(16.0, 400.0, 255, 255, 2, 2),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Center(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey.shade400,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6.0),
                                  side: BorderSide(
                                    color: Colors.blue.shade800,
                                    width: 2.0,
                                  ))),
                          onPressed: _onSubmit,
                          child: Text(
                            "Convert",
                            style: TextVisuals.getTextStyle(
                                32.0, 700, 255, 0, 0, 0),
                          )),
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(
            height: 5.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.all(10.0),
                width: 200.0,
                height: 70.0,
                child: ElevatedButton(
                    onPressed: _clearHistory,
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.resolveWith<Color?>(
                          (Set<WidgetState> states) {
                        if (states.contains(WidgetState.hovered)) {
                          return const Color.fromARGB(
                              255, 255, 0, 0); // Color when pressed
                        } else {
                          return const Color.fromARGB(255, 180, 0, 0);
                        }
                      }),
                    ),
                    child: Text(
                      "Clear History",
                      style: TextVisuals.getTextStyle(
                          22.0, 700.0, 255, 255, 255, 255),
                    )),
              )
            ],
          ),
          const SizedBox(
            height: 5.0,
          ),
          Container(
            alignment: const Alignment(10.0, 10.0),
            margin: const EdgeInsets.all(15.0),
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 254, 254),
              border: Border.all(
                color: const Color.fromARGB(255, 241, 242, 244),
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: _calculationHistory.reversed.toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
