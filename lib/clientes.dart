import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flamingo/login.dart';

class ClientesPage extends StatelessWidget {
  final ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Lista de Clientes',
          style: TextStyle(fontWeight: FontWeight.bold, color: Color.fromARGB(255, 252, 252, 252)),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF4B9EDE),
      ),
      body: FutureBuilder<List<Cliente>>(
        future: apiService.fetchClientes(),
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
            return ClientesListView(clientes: snapshot.data!);
          }
        },
      ),
    );
  }
}

class ClientesListView extends StatelessWidget {
  final List<Cliente> clientes;

  ClientesListView({required this.clientes});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: clientes.length,
      itemBuilder: (context, index) {
        final cliente = clientes[index];
        return Card(
          margin: EdgeInsets.all(8.0),
          color: Color(0xFF4B9EDE),
          child: ListTile(
            contentPadding: EdgeInsets.all(10.0),
            leading: Icon(CupertinoIcons.person_solid,  color: Colors.white, size: 50,),
            title: Text(cliente.nombre, style: TextStyle(
              color: Colors.white,
            ),
            ),
            trailing: ElevatedButton(
              onPressed: (){
                _mostrarDetallesCliente(context, cliente);
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

  void _mostrarDetallesCliente(BuildContext context, Cliente cliente) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          'Detalles de Cliente',
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
              _buildDetailRow('Nombre: ${cliente.nombre}'),
              _buildDetailRow('Apellido Paterno: ${cliente.apellidoPaterno}'),
              _buildDetailRow('Apellido Materno: ${cliente.apellidoMaterno}'),
              _buildDetailRow('Correo: ${cliente.correo}'),
              _buildDetailRow('Teléfono: ${cliente.telefono}'),
              _buildDetailRow('Celular: ${cliente.celular}'),
              _buildDetailRow('Dirección: ${cliente.direccion}'),
              _buildDetailRow('Estatus: ${cliente.estatus}'),
          ],
        ),
        actions: <Widget>[
          _buildCloseButton(context),
          ],
        );
      },
    );
  }
}

// Funciones adicionales

Widget _buildDetailRow(String label, String value) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 8.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 120,
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
      Navigator.of(context).pop(); // Cerrar el diálogo
    },
    child: Text(
      'Cerrar',
      style: TextStyle(
        color: Colors.red, // Personalizar el color según sea necesario
      ),
    ),
  );
}


}

class Cliente {
  final String nombre;
  final String apellidoPaterno;
  final String apellidoMaterno;
  final String correo;
  final String telefono;
  final String celular;
  final String direccion;
  final String estatus;

  Cliente({
    required this.nombre,
    required this.apellidoPaterno,
    required this.apellidoMaterno,
    required this.correo,
    required this.telefono,
    required this.celular,
    required this.direccion,
    required this.estatus,
  });

  factory Cliente.fromJson(Map<String, dynamic> json) {
    return Cliente(
      nombre: json['nombre'],
      apellidoPaterno: json['apellidoPaterno'],
      apellidoMaterno: json['apellidoMaterno'],
      correo: json['correo'],
      telefono: json['telefono'],
      celular: json['celular'],
      direccion: json['direccion'],
      estatus: json['estatus'],
    );
  }
}

class ApiService {
  Map<String, String> get headers => {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "Authorization": "Bearer ${AuthService.token}",
      };

  Future<List<Cliente>> fetchClientes() async {
    var url = "http://flamingosoftapi.somee.com/api/Clientes?estatus=A";
    var response = await http.get(Uri.parse(url), headers: headers);

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      List<Cliente> clientes =
          data.map((json) => Cliente.fromJson(json)).toList();
      return clientes;
    } else {
      throw Exception(
          "Request to $url failed with status ${response.statusCode}: ${response.body}");
    }
  }
}
