import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String input='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
        centerTitle: true,
      ),
        body:Column(children: [
        Expanded(
          child: Container(
            alignment: Alignment.bottomRight,
            padding: EdgeInsets.all(16),
            child: Text(input,style: TextStyle(fontSize: 36)),
          ),
        ),
          Row(
        children: [
          _buildButton('1'),
          _buildButton('2'),
          _buildButton('3'),
          _buildButton('+'),
        ],
      ),
      Row(
        children: [
          _buildButton('4'),
          _buildButton('5'),
          _buildButton('6'),
          _buildButton('-'),
        ],
      ),
      Row(
        children: [
          _buildButton('7'),
          _buildButton('8'),
          _buildButton('9'),
          _buildButton('*'),
        ],
      ),
      Row(
        children: [
          _buildButton('0'),
          _buildButton('C'),
          _buildButton('='),
          _buildButton('/'),

        ],
      ),

    ],)
    );
  }
  Widget _buildButton(String textButton,{Color color=Colors.white}){
    return Expanded(
      child: ElevatedButton(onPressed: () {
    setState(() {
      if(textButton == '='){
        //  result calculation
        try{
            Parser parser=Parser();
            Expression expression=parser.parse(input);
            ContextModel contextModel=ContextModel();
            double result=expression.evaluate(EvaluationType.REAL, contextModel);
            input=result.toString();

        }catch(e){
         setState(() {
           input="Error";
         });
        }
      }else if(textButton == 'C'){
        //  to clear the text.
          input='';

      }else{
        //  remaining button task
        input +=textButton;
      }

    });
      },
          style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))
      ), child: Text(textButton,style: TextStyle(fontSize: 24,color: Colors.black),)),
    );
  }
}

