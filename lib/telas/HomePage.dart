import 'package:flutter/material.dart'
    show
        AppBar,
        BuildContext,
        Colors,
        Column,
        Container,
        EdgeInsets,
        ElevatedButton,
        Image,
        InputDecoration,
        Key,
        OutlineInputBorder,
        Padding,
        Scaffold,
        SingleChildScrollView,
        SizedBox,
        State,
        StatefulWidget,
        Text,
        TextEditingController,
        TextField,
        TextInputType,
        TextStyle,
        Widget;

String _resultado = '';

// ignore: prefer_typing_uninitialized_variables
var imagem;
String textoResult = "";

TextEditingController _controllerPeso = TextEditingController();
TextEditingController _controllerAltura = TextEditingController();

//Criando a classe Homepage e extendendo Stateful pois os dados são dinâmicos
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // ignore: todo
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora IMC'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 0.0),
              child: Text(
                'Insira as informações',
                style: TextStyle(fontSize: 25.0),
              ),
            ),
            criarEditText('Peso (kg)', _controllerPeso),
            criarEditText('Altura (cm)', _controllerAltura),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 16.0),
              child: Text(
                _resultado,
                style: const TextStyle(fontSize: 25.0),
              ),
            ),
            Container(
              height: 50.0,
              width: 200.0,
              color: Colors.pink[800],
              child: ElevatedButton(
                onPressed: () {
                  double? peso = double.tryParse(_controllerPeso.text);
                  double? altura = double.tryParse(_controllerAltura.text);

                  if (peso != null && altura != null) {
                    altura = altura / 100.0;

                    double _imc = (peso / (altura * altura));

                    setState(() {
                      if (_imc < 18.5) {
                        _resultado =
                            "Seu IMC é: ${_imc.toStringAsPrecision(4)}\nAbaixo do Peso";
                        imagem = "images/1.jpg";
                      } else if (_imc >= 18.5 && _imc <= 24.9) {
                        _resultado =
                            "Seu IMC é: ${_imc.toStringAsPrecision(4)}\nPeso Normal";
                        imagem = "images/2.jpg";
                      } else if (_imc >= 25.0 && _imc <= 29.9) {
                        _resultado =
                            "Seu IMC é: ${_imc.toStringAsPrecision(4)}\nSobrepeso";
                        imagem = "images/3.jpg";
                      } else if (_imc >= 30.0 && _imc <= 34.9) {
                        _resultado =
                            "Seu IMC é: ${_imc.toStringAsPrecision(4)}\nObesidade Grau l";
                        imagem = "images/4.png";
                      } else if (_imc >= 35 && _imc <= 39.9) {
                        _resultado =
                            "Seu IMC é: ${_imc.toStringAsPrecision(4)}\nObesidade Grau ll";
                        imagem = "images/5.jpeg";
                      } else if (_imc > 39.9) {
                        _resultado =
                            "Seu IMC é: ${_imc.toStringAsPrecision(4)}\nObesidade Grau lll (Mórbida)";
                        imagem = "images/6.jpeg";
                      }
                    });
                  } else {
                    setState(() {
                      _resultado = '';
                    });
                  }
                },
                child: const Text('Calcular'),
              ),
            ),
            Container(
              height: 40,
            ),
            SizedBox(
              width: 300,
              height: 300,
              child: imagem != null ? Image.asset(imagem) : null,
            ),
          ],
        ),
      ),
    );
  }

  Padding criarEditText(String texto, TextEditingController _controller) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 8.0),
      child: TextField(
        controller: _controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: texto,
          border: const OutlineInputBorder(),
          //Tamanho da font
          labelStyle: TextStyle(
            fontSize: 20.0,
            color: Colors.blue[800],
          ),
        ),
      ),
    );
  }
}
