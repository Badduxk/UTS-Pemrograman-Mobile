import 'package:flutter/material.dart';
import 'dart:math';

class KalkulatorFragment extends StatefulWidget {
  const KalkulatorFragment({super.key});

  @override
  State<KalkulatorFragment> createState() => _KalkulatorFragmentState();
}

class _KalkulatorFragmentState extends State<KalkulatorFragment> {
  String _output = '0';
  String _operand = '';
  double _num1 = 0;
  double _num2 = 0;
  String _operator = '';

  void _buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == 'C') {
        _output = '0';
        _num1 = 0;
        _num2 = 0;
        _operator = '';
        _operand = '';
      } else if (buttonText == '+' || buttonText == '-' || buttonText == '×' || buttonText == '÷') {
        _num1 = double.parse(_output);
        _operator = buttonText;
        _operand = '';
      } else if (buttonText == '=') {
        _num2 = double.parse(_output);
        if (_operator == '+') {
          _output = (_num1 + _num2).toString();
        } else if (_operator == '-') {
          _output = (_num1 - _num2).toString();
        } else if (_operator == '×') {
          _output = (_num1 * _num2).toString();
        } else if (_operator == '÷') {
          _output = (_num1 / _num2).toString();
        }
        _operator = '';
        _operand = '';
      } else if (buttonText == 'x²') {
        double num = double.parse(_output);
        _output = (num * num).toString();
      } else if (buttonText == '√') {
        double num = double.parse(_output);
        _output = sqrt(num).toString();
      } else {
        if (_output == '0') {
          _operand = buttonText;
        } else {
          _operand = _operand + buttonText;
        }
        _output = _operand;
      }
      
      // Format output
      if (_output.contains('.') && _output.endsWith('0')) {
        _output = double.parse(_output).toStringAsFixed(2);
      }
    });
  }

  Widget _buildButton(String buttonText, {Color? color}) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(4),
        child: ElevatedButton(
          onPressed: () => _buttonPressed(buttonText),
          style: ElevatedButton.styleFrom(
            backgroundColor: color ?? Colors.grey.shade300,
            foregroundColor: color != null ? Colors.white : Colors.black,
            padding: const EdgeInsets.all(20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Text(
            buttonText,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            padding: const EdgeInsets.all(20),
            alignment: Alignment.bottomRight,
            child: Text(
              _output,
              style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Expanded(
          flex: 5,
          child: Column(
            children: [
              Row(
                children: [
                  _buildButton('7'),
                  _buildButton('8'),
                  _buildButton('9'),
                  _buildButton('÷', color: Colors.orange),
                ],
              ),
              Row(
                children: [
                  _buildButton('4'),
                  _buildButton('5'),
                  _buildButton('6'),
                  _buildButton('×', color: Colors.orange),
                ],
              ),
              Row(
                children: [
                  _buildButton('1'),
                  _buildButton('2'),
                  _buildButton('3'),
                  _buildButton('-', color: Colors.orange),
                ],
              ),
              Row(
                children: [
                  _buildButton('0'),
                  _buildButton('.'),
                  _buildButton('C', color: Colors.red),
                  _buildButton('+', color: Colors.orange),
                ],
              ),
              Row(
                children: [
                  _buildButton('x²', color: Colors.blue.shade700),
                  _buildButton('√', color: Colors.blue.shade700),
                  _buildButton('=', color: Colors.green),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}