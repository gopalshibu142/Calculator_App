import 'package:flutter/material.dart';
import 'package:neubrutalism_ui/neubrutalism_ui.dart';
import 'package:function_tree/function_tree.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

//calculator app
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String getLabal(int index) {
    if (index == 0) return "AC";
    if (index == 1) return "DEL";
    if (index == 2) return "%";
    if (index == 3) return "+";
    if (index == 4) return "7";
    if (index == 5) return "8";
    if (index == 6) return "9";
    if (index == 7) return "-";
    if (index == 8) return "4";
    if (index == 9) return "5";
    if (index == 10) return "6";
    if (index == 11) return "*";
    if (index == 12) return "1";
    if (index == 13) return "2";
    if (index == 14) return "3";
    if (index == 15) return "/";
    if (index == 16) return "0";
    if (index == 17) return "00";
    if (index == 18) return ".";
    if (index == 19) return "=";
    return "";
  }

  String _expression = "";
  String _history = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text('Calculator'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height /
                      MediaQuery.of(context).size.width *
                      5,
                ),
                
                   NeuContainer(
                    width: double.infinity,
                    height: 200,
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      alignment: Alignment.bottomRight,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            _history,
                            textAlign: TextAlign.end,
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            _expression,
                            textAlign: TextAlign.end,
                            style: TextStyle(
                              fontSize: 70,
                            
                          ),
                    ),
                        ],
                      ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height /
                      MediaQuery.of(context).size.width *
                      25,
                ),
                GridView.builder(
                  //build the buttons using gridview and NeuButton
                  shrinkWrap: true,
                  itemCount: 20,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    String label = getLabal(index);
                    return NeuTextButton(
                      borderRadius: BorderRadius.circular(20),
                        onPressed: () {
                          print(label);
                          if (label == "AC") {
                            setState(() {
                              _history = "";
                              _expression = "";
                            });
                          } else if (label == "DEL") {
                            setState(() {
                              _expression = _expression.substring(
                                  0, _expression.length - 1);
                            });
                          } else if (label == "=") {
                            setState(() {
                              _history = _expression;
                              _expression = _expression.interpret().toString();
                            });
                          } else {
                            setState(() {
                              _expression += label;
                            });
                          }

                        },
                        child: Center(
                          child: Text(label
                            ,style: TextStyle(
                              fontSize: 20,
                            ))
                        ),
                      
                    );
                  },
                )
              ],
            )),
      ),
    );
  }
}
