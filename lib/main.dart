import 'dart:math';

import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI calculator app',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Your BMI calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtcontroller = TextEditingController();
  var ftcontroller = TextEditingController();
  var incontroller = TextEditingController();
  var result="";
  var bgcolour;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text("your BMI"),
        ),
        body: Container(
          color: bgcolour,
          child: Center(
            child:Container(
            width:300,
            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('BMI', style: TextStyle(
                  fontSize: 34, fontWeight: FontWeight.w700
              ),),
              TextField(
                controller: wtcontroller,
                decoration: const InputDecoration(
                  label: Text("Enter your Weight (in KGs)"),
                    prefixIcon: Icon(Icons.line_weight)
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 30,),
              TextField(
                controller: ftcontroller,
                decoration: const InputDecoration(
                    label: Text("Enter your Height (in Feet)"),
                    prefixIcon: Icon(Icons.height),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 30),
              TextField(
                controller: incontroller,
                decoration: const InputDecoration(
                  label: Text("Enter your Height(in INCH)"),
                        prefixIcon: Icon(Icons.height),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 30),
              ElevatedButton(onPressed: (){
                var wt= wtcontroller.text.toString();
                var ft= incontroller.text.toString();
                var inch= ftcontroller.text.toString();
                if(wt!="" && ft != "" && inch!= ""){
                  var iwt= int.parse(wt);
                  var iinch= int.parse(inch);
                  var ift= int.parse(ft);
                  var tinch= (ift*12)+iinch;
                  var tcm= tinch*2.54;
                  var tm= tcm/100;
                  var bmi= iwt/(tm*tm);
                  var respond='';
                  if(bmi>25){
                    respond="You are Overweight";
                    bgcolour= Colors.deepOrange;
                  }else if(bmi<18){
                    respond="You are Underweight";
                    bgcolour= Colors.red;
                  }else{
                    respond="You are in great shape hence neutral";
                    bgcolour= Colors.green;
                  }
                  setState(() {
                    result="Your BMI is $bmi";
                  });

                }
                else{
                  setState(() {
                    result="please fill all the parameters to find your correct BMI";

                  });
                }
              },child: const Text("Calculated your BMI"),
              ),
              Text(result, style: const TextStyle(fontSize: 18),
              ),
            ],
          ),
          ),
          ),
        ),
        );


  }

}


