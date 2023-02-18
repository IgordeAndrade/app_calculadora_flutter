import 'package:flutter/material.dart';
import 'create_button.dart';
import 'package:math_expressions/math_expressions.dart';

//variable of visor
String visor = '0';

class Interface extends StatefulWidget {
  const Interface({super.key});

  @override
  State<Interface> createState() => _InterfaceState();
}

class _InterfaceState extends State<Interface> {
  @override
  Widget build(BuildContext context) {
    //função para setar os valores dos botões na tela
    void setValue(String value) {
      if (visor == '0') {
        setState(
          () {
            visor = value;
          },
        );
      } else {
        setState(
          () {
            visor = (visor + value);
          },
        );
      }
    }

    //função para resetar os valores
    void reset() {
      setState(() {
        visor = '0';
      });
    }

//função para calcular o resultado
    void result() {
      Parser parser = Parser();
      Expression expression = parser.parse(visor);
      double result = expression.evaluate(EvaluationType.REAL, ContextModel());
      // printar o resultado na tela
      setState(() {
        visor = result.toString();
      });
    }

    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 32, 3, 3),
        title: const Text(
          'Calculadora',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //calculator visor
          Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width * 0.63,
            height: MediaQuery.of(context).size.height * 0.13,
            margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            child: Center(
              child: Text(
                visor,
                style: const TextStyle(fontSize: 50),
              ),
            ),
          ),

          //calculator buttons
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  createButton(
                      caracter: 'C',
                      press: () => reset(),
                      color: Colors.orange,
                      context: context),
                  createButton(
                      caracter: 'DEL',
                      press: () => reset(),
                      color: Colors.orange,
                      context: context),
                  createButton(
                      caracter: '%',
                      press: () => setValue('%'),
                      color: Colors.orange,
                      context: context),
                  createButton(
                      caracter: '/',
                      press: () => setValue('/'),
                      color: Colors.orange,
                      context: context),
                ],
              ),
              Row(
                children: [
                  createButton(
                      caracter: '7',
                      press: () => setValue('7'),
                      color: Colors.white,
                      context: context),
                  createButton(
                      caracter: '8',
                      press: () => setValue('8'),
                      color: Colors.white,
                      context: context),
                  createButton(
                      caracter: '9',
                      press: () => setValue('9'),
                      color: Colors.white,
                      context: context),
                  createButton(
                      caracter: '*',
                      press: () => setValue('*'),
                      color: Colors.orange,
                      context: context),
                ],
              ),
              Row(
                children: [
                  createButton(
                      caracter: '4',
                      press: () => setValue('4'),
                      color: Colors.white,
                      context: context),
                  createButton(
                      caracter: '5',
                      press: () => setValue('5'),
                      color: Colors.white,
                      context: context),
                  createButton(
                      caracter: '6',
                      press: () => setValue('6'),
                      color: Colors.white,
                      context: context),
                  createButton(
                      caracter: '+',
                      press: () => setValue('+'),
                      color: Colors.orange,
                      context: context),
                ],
              ),
              Row(
                children: [
                  createButton(
                      caracter: '1',
                      press: () => setValue('1'),
                      color: Colors.white,
                      context: context),
                  createButton(
                      caracter: '2',
                      press: () => setValue('2'),
                      color: Colors.white,
                      context: context),
                  createButton(
                      caracter: '3',
                      press: () => setValue('3'),
                      color: Colors.white,
                      context: context),
                  createButton(
                      caracter: '-',
                      press: () => setValue('-'),
                      color: Colors.orange,
                      context: context),
                ],
              ),
              Row(
                children: [
                  createButton(
                      caracter: '0',
                      press: () => setValue('0'),
                      color: Colors.white,
                      context: context),
                  createButton(
                      caracter: '.',
                      press: () => setValue('='),
                      color: Colors.white,
                      context: context),
                  createButton(
                      caracter: '=',
                      press: () => result(),
                      color: Colors.orange,
                      context: context),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
