// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'actividades.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flamingo/login.dart';

class TareasPage extends StatelessWidget {
  final ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Lista de Tareas',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 252, 252, 252), // Color del borde
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF4B9EDE),
      ),
      body: FutureBuilder<List<Tarea>>(
        future: apiService.fetchTareas(),
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
            return TareasListView(tareas: snapshot.data!);
          }
        },
      ),
    );
  }
}


class TareasListView extends StatelessWidget {
  final List<Tarea> tareas;

  TareasListView({required this.tareas});
  
  @override
  Widget build(BuildContext context){
    return ListView.builder(
      itemCount: tareas.length,
      itemBuilder: (context, index) {
        final tarea = tareas [index];
        return Card(
          margin: EdgeInsets.all(8.0),
          color: Color(0xFF4B9EDE),
          child: ListTile(
            contentPadding: EdgeInsets.all(10.0),
            leading: Icon(Icons.assignment, color: Colors.white, size: 40,),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${tarea.actividad}', style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              ),
              Text(
                '${tarea.encargado}', style: TextStyle(
                color: Colors.white,
              ),
              )
              ],
            ),
            onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DetallesTareaPage(tarea: tarea),
              ),
            );
            },
          ),
        );
      },
    );
  }
}

class Tarea {
  final String creador;
  final String encargado;
  final String fechaSolicitud;
  final String fechaEntrega;
  final String actividad;
  final String cliente;
  final String estatus;

  Tarea({
    required this.creador,
    required this.encargado,
    required this.fechaSolicitud,
    required this.fechaEntrega,
    required this.actividad,
    required this.cliente,
    required this.estatus,
  });

  factory Tarea.fromJson(Map<String, dynamic> json) {
    return Tarea(
      creador: json['creador'] ?? '',
      encargado: json['encargado'] ?? '',
      fechaSolicitud: json['fechaSolicitud'] ?? '',
      fechaEntrega: json['fechaEntrega'] ?? '',
      actividad: json['actividad'] ?? '',
      cliente: json['cliente'] ?? '',
      estatus: json['estatus'] ?? '',
    );
  }
}

class ApiService {
  Map<String, String> get headers => {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "Authorization": "Bearer ${AuthService.token}",
      };

  Future<List<Tarea>> fetchTareas() async {
    var url = "http://flamingosoftapi.somee.com/api/Tareas?status=T";
    var response = await http.get(Uri.parse(url), headers: headers);

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      List<Tarea> tareas = data.map((json) => Tarea.fromJson(json)).toList();
      return tareas;
    } else {
      throw Exception(
          "Request to $url failed with status ${response.statusCode}: ${response.body}");
    }
  }
}
