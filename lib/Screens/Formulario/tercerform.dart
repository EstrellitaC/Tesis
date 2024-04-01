import 'package:flutter/material.dart';

class TerceraPantalla extends StatefulWidget {
  @override
  _TerceraPantallaState createState() => _TerceraPantallaState();
}

class _TerceraPantallaState extends State<TerceraPantalla> {
  List<String?> _opcionesSeleccionadas = List.filled(8, null);
  String? _textoAdicional;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: 
        const Text(
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
              'Iluminación de cabina',
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
              itemCount: 8,
              itemBuilder: (context, index) {
                String preText = '';
                switch (index) {
                  case 0:
                    preText = 'Verificar funcionamiento de luces delanteras de tracto';
                    break;
                  case 1:
                    preText = 'Verificar funcionamiento de luces posteriores de tracto';
                    break;
                  case 2:
                    preText = 'Verificar funcionamiento de luces posteriores de carreta';
                    break;
                  case 3:
                    preText = 'Verificar funcionamiento de luces laterales de carreta';
                    break;
                  case 4:
                    preText = 'Verificar funcionamiento de circulina';
                    break;
                  case 5:
                    preText = 'Verificar funcionamiento de claxon';
                    break;
                  case 6:
                    preText = 'Verificar funcionamiento de alarma de retroceso';
                    break;
                  case 7:
                    preText = 'Apagar Switch Master en caso el equipo no opere';
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
                        style: 
                        const TextStyle(
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
                              _textoAdicional = newValue;
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
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 255, 186, 59)),
          ),
          child: const Text(
            'Siguiente',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
