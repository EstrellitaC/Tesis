import 'package:flutter/material.dart';
import 'formSecundario.dart';

class formPrincipal extends StatelessWidget {
  const formPrincipal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _dateController = TextEditingController(); 
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        foregroundColor: Colors.black,
        backgroundColor: Color.fromARGB(255, 255, 186, 59),
        label: const Text('Siguiente'),
        icon: const Icon(Icons.arrow_forward),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SegundaPantalla()),
          );
        },
      ),
      appBar: AppBar(title: const Text("REPORTE DIARIO"),
      backgroundColor: const Color.fromARGB(255, 255, 186, 59),
      toolbarHeight: 70,
      ),
      body: Column( 
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Datos de la maquinaria', 
              style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        const Padding(
            padding: EdgeInsets.all(10.0),
            child: TextField(
              decoration: 
              InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Equipo / Código",
              ),
            ),
          ),
        const Padding(
          padding: EdgeInsets.all(10.0),
          child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Operador",
                  ),
                ),
        ),
        Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: _dateController,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: "Fecha",
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.calendar_today),
                    onPressed: () {
                      showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                      ).then((pickedDate) {
                        if (pickedDate != null) {
                          _dateController.text = pickedDate.toString();
                        }
                      });
                    },
                  ),
                ),
              ),
            ),
        const Padding(
          padding: EdgeInsets.all(10.0),
          child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Hora inicio de jornada",
              ),
            ),
        ),
        const Padding(
          padding: EdgeInsets.all(10.0),
          child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Hora final de jornada",
                  ),
                ),
        ),
        const Padding(
          padding: EdgeInsets.all(10.0),
          child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Turno",
                ),
              ),
        ),
        const Padding(
          padding: EdgeInsets.all(10.0),
          child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Horómetro",
                ),
              ),
        ),
        const Padding(
          padding: EdgeInsets.all(10.0),
          child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Kilometraje",
                ),
              ),
        ),
        const Padding(
          padding: EdgeInsets.all(10.0),
          child: TextField(
                  minLines: 1,
                  maxLines: 2,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Otros",
                )
              )
        ),
      ])
    );
  }
}