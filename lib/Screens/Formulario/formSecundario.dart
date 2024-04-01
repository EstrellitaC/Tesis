import 'package:flutter/material.dart';
import 'tercerform.dart'; // Asegúrate de importar la pantalla tercera

class SegundaPantalla extends StatefulWidget {
  @override
  _SegundaPantallaState createState() => _SegundaPantallaState();
}

class _SegundaPantallaState extends State<SegundaPantalla> {
  List<String?> _opcionesSeleccionadas = List.filled(5, null);
  List<String?> _textAreas = List.filled(5, null); // Lista de textos ingresados en los text areas

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Puntos de Inspección",
          style: TextStyle(
            color: Colors.black87,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 255, 186, 59),
        toolbarHeight: 70,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Niveles de fluidos',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 0, 0, 0), 
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 5, 
              itemBuilder: (context, index) {
                String preText = '';
                switch (index) {
                  case 0:
                    preText = 'Verificar nivel de aceite de motor';
                    break;
                  case 1:
                    preText = 'Verificar nivel de refrigerante';
                    break;
                  case 2:
                    preText = 'Verificar niveles de aceite transmisión e hidráulico';
                    break;
                  case 3:
                    preText = 'Verificar niveles de aceite transmisión en mandos finales';
                    break;
                  case 4:
                    preText = 'Verificar nivel de combustible (mayor a 1/4 de tanque)';
                    break;
                  default:
                    preText = 'Pregunta';
                }
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        preText,
                        style: const TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 15.0),
                        width: double.infinity,
                        child: DropdownButtonFormField<String>(
                          value: _opcionesSeleccionadas[index], 
                          hint: const Text('Elige tu opción'), 
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(), 
                            contentPadding: EdgeInsets.symmetric(horizontal: 20.0), 
                          ),
                          onChanged: (String? newValue) {
                            setState(() {
                              _opcionesSeleccionadas[index] = newValue; 
                            });
                          },
                          items: <String>[
                            'Buena',
                            'Mala',
                            'Regular',
                            'No Testeada',
                            'No Aplicable',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 15.0),
                        width: double.infinity,
                        child: TextField(
                          onChanged: (String newValue) {
                            setState(() {
                              _textAreas[index] = newValue;
                            });
                          },
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Observaciones',
                          ),
                          maxLines: 2,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TerceraPantalla()), // Navega a la pantalla 3
            );
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 255, 186, 59)), // Color de fondo amarillo
          ),
          child: 
          const Text(
            'Siguiente',
            style: TextStyle(
              color: Colors.black, // Color del texto negro
            ),
          ),
        ),
      ),
    );
  }
}
