import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String numero = '';
  double primeiroNumero = 0;
  double resultado = 0;
  String op = '';

  void addTecla(String tecla){ // chama todas as funcionalidades
    switch(tecla){
      case "0":
      case "1":
      case "2":
      case "3":
      case "4":
      case "5":
      case "6":
      case "7":
      case "8":
      case "9":
        addNumero(tecla);
        break;

      case ".":
        addVirgula(tecla);
        break;
      
      case "+":
      case "-":
      case "x":
      case "/":
       
        op = tecla;
        if(numero.isNotEmpty && numero !="ERRO"){
          primeiroNumero = double.parse(numero);
          numero = ''; 
        }
         
        break;

      case "=":
        double numeroDouble = 0;
        if(numero.isNotEmpty){
          numeroDouble = double.parse(numero); 
        }
          
        if(op == "+"){
          resultado = primeiroNumero + numeroDouble;    
        }else if(op == "-"){
          resultado = primeiroNumero - numeroDouble;
        }else if(op == "x"){
          resultado = primeiroNumero * numeroDouble;
        }else if(op == "/"){
          if(numeroDouble != 0){
            resultado = primeiroNumero / numeroDouble;
          }
        }else{
          resultado = double.parse(numero);
        }
        setState(() {
          if(numeroDouble == 0 && op == '/'){
            numero = "ERRO";
          }
          else{
            numero = resultado.toString();
          }
          
        });
        
        break;
    }
  }

  void addNumero(String valor) {
    setState(() {
      if(numero == "ERRO"){
        numero = '';
      }
      numero += valor;
      if (numero.contains('.')) {
        if(numero.substring(numero.length - 1,numero.length ) != '0'){
          double numeroDouble = double.parse(numero);
          numero = numeroDouble.toString();
        }
      } else {
        
        int numeroInt = int.parse(numero);
        numero = numeroInt.toString();
      }
    });
  }

  void addVirgula(String virgula) {
    if (numero.isNotEmpty && !numero.contains('.')) {
      setState(() {
        numero += virgula;
      });
    }
  }

  void apagarTudo() {
    setState(() {
      numero = '';  
    });
  }

  void apagar() {
    if (numero.isNotEmpty) {
      setState(() {
        numero = numero.substring(0, numero.length - 1);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
              child: Text(
            'calculadora bolada',
            style: TextStyle(
                fontSize: 30, color: Color.fromARGB(255, 186, 230, 220)),
          )),
        ),
        body:
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("", style: TextStyle(fontSize: 50)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(numero, style: TextStyle(fontSize: 50)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    apagarTudo();
                  },
                  child: Text(
                    "AC",
                    style: TextStyle(fontSize: 40),
                  ),
                ),
                Text(
                  " ",
                  style: TextStyle(fontSize: 50),
                ),
                Text(
                  " ",
                  style: TextStyle(fontSize: 50),
                ),
                GestureDetector(
                  onTap: () {
                    apagar();
                  },
                  child: Text(
                    "<",
                    style: TextStyle(fontSize: 50),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                    onTap: () {
                      addTecla('7');
                    },
                    child: Image.asset(
                    "assets/n7.png",
                    width :80,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    addTecla('8');
                  },
                  child: Image.asset(
                    "assets/n8.png",
                    width :80,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    addTecla('9');
                  },
                  child: Image.asset(
                    "assets/n9.png",
                    width :80,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    addTecla('/');
                  },
                  child: Image.asset(
                    "assets/divisao.png",
                    width :80,
                  ),
                ),  
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    addTecla("4");
                  },
                  child: Image.asset(
                    "assets/n4.png",
                    width :80,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    addTecla("5");
                  },
                  child: Image.asset(
                    "assets/n5.png",
                    width :80,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    addTecla("6");
                  },
                  child: Image.asset(
                    "assets/n6.png",
                    width :80,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    addTecla("x");
                  },
                  child: Image.asset(
                    "assets/mult.png",
                    width :80,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    addTecla("1");
                  },
                  child: Image.asset(
                    "assets/num.png",
                    width :80,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    addTecla("2");
                  },
                  child: Image.asset(
                    "assets/ndois.png",
                    width :80,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    addTecla("3");
                  },
                  child: Image.asset(
                    "assets/n3.png",
                    width :80,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    addTecla("-");
                  },
                  child: Image.asset(
                    "assets/menos.png",
                    width :80,
                  ),
                ),

              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    addTecla("0");
                  },
                  child: Image.asset(
                    "assets/n0.png",
                    width :80,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    addVirgula(".");
                  },
                  child: Image.asset(
                    "assets/virgula.png",
                    width :80,
                ),
                ),
                GestureDetector(
                  onTap: (){
                    addTecla("=");
                  },
                  child: Image.asset(
                    "assets/igual.png",
                    width :80,
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    addTecla("+");
                  },
                  child: Image.asset(
                    "assets/mais.png",
                    width :80,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
