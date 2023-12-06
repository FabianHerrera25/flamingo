import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flamingo/login.dart';

class EmpleadosPage extends StatelessWidget {
  final ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Lista de Empleados',
          style: TextStyle(fontWeight: FontWeight.bold, color: Color.fromARGB(255, 252, 252, 252)),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF4B9EDE),
      ),
      body: FutureBuilder<List<Empleado>>(
        future: apiService.fetchEmpleados(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            return EmpleadosListView(empleados: snapshot.data!);
          }
        },
      ),
    );
  }
}

class EmpleadosListView extends StatelessWidget {
  final List<Empleado> empleados;

  EmpleadosListView({required this.empleados});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: empleados.length,
      itemBuilder: (context, index) {
        final empleado = empleados[index];
        return Card(
          margin: EdgeInsets.all(8.0),
          color: Color(0xFF4B9EDE),
          child: ListTile(
            contentPadding: EdgeInsets.all(10.0),
            leading: Icon(CupertinoIcons.person_solid, color: Colors.white, size: 50,),
            title: Text(
                '${empleado.nombre} ${empleado.apellidoPaterno} ${empleado.apellidoMaterno}', style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Cambia el color del texto
                ),
                ),
            subtitle: Text(empleado.cargo, style: TextStyle(
              color: Colors.white,
            ),
            ),
            trailing: ElevatedButton(
              onPressed: () {
                _mostrarDetallesEmpleado(context, empleado);
              },
              style: ElevatedButton.styleFrom(
              primary: Colors.white, // Cambia el color del botón aquí
              ),
              child: Text('Detalles',
              style: TextStyle(
                  color: Color(0xFF4B9EDE), // Cambia el color del texto del botón aquí
                ),
              ),
            ),
          ),
        );
      },
    );
  }

 void _mostrarDetallesEmpleado(BuildContext context, Empleado empleado) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          'Detalles de Empleado',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 12),
            _buildDetailRow('Nombre: ${empleado.nombre}'),
            _buildDetailRow('Apellido Paterno: ${empleado.apellidoPaterno}'),
            _buildDetailRow('Apellido Materno: ${empleado.apellidoMaterno}'),
            _buildDetailRow('cargo: ${empleado.cargo}'),
          ],
        ),
        actions: <Widget>[
          _buildCloseButton(context),
        ],
      );
    },
  );
}

Widget _buildDetailRow(String label, String value) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 8.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 100,
          child: Text(
            '$label:',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child: Text(value),
        ),
      ],
    ),
  );
}

Widget _buildCloseButton(BuildContext context) {
  return TextButton(
    onPressed: () {
      Navigator.of(context).pop(); // Close the dialog
    },
    child: Text(
      'Cerrar',
      style: TextStyle(
        color: Colors.red, // Customize the color as needed
      ),
    ),
  );
}



}

class Empleado {
  final String nombre;
  final String apellidoPaterno;
  final String apellidoMaterno;
  final String cargo;

  Empleado({
    required this.nombre,
    required this.apellidoPaterno,
    required this.apellidoMaterno,
    required this.cargo,
  });

  factory Empleado.fromJson(Map<String, dynamic> json) {
    return Empleado(
      nombre: json['nombre'],
      apellidoPaterno: json['apellidoPaterno'],
      apellidoMaterno: json['apellidoMaterno'],
      cargo: json['cargo'],
    );
  }
}


final List<Empleado> empleados = [
  Empleado(
    nombre: 'Juan',
    apellidoPaterno: 'Perez',
    apellidoMaterno: 'Lopez',
    cargo: 'Gerente',
  ),
  
  // Agregar más empleados aquí
];

class ApiService {
  Map<String, String> get headers => {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "Authorization": "Bearer ${AuthService.token}",
      };

  Future<List<Empleado>> fetchEmpleados() async {
    var url = "http://flamingosoftapi.somee.com/api/Empleados?estatus=A";
    var response = await http.get(Uri.parse(url), headers: headers);

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      List<Empleado> empleados =
          data.map((json) => Empleado.fromJson(json)).toList();
      return empleados;
    } else {
      throw Exception(
          "Request to $url failed with status ${response.statusCode}: ${response.body}");
    }
  }
}

