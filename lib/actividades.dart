import 'package:flutter/material.dart';
import 'tareas.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flamingo/login.dart';

class DetallesTareaPage extends StatelessWidget {
  final Tarea tarea;

  DetallesTareaPage({required this.tarea});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${tarea.actividad}',
          style: TextStyle(fontWeight: FontWeight.bold, color: Color.fromARGB(255, 252, 252, 252), // Color del borde
),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF4B9EDE),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildInfoRow('Usuario creador: ${tarea.creador}'),
              _buildInfoRow('Usuario encargado: ${tarea.encargado}'),
              _buildInfoRow('Fecha de Solicitud: ${tarea.fechaSolicitud}'),
              _buildInfoRow('Fecha de Entrega: ${tarea.fechaEntrega}'),
              _buildInfoRow('Actividad: ${tarea.actividad}'),
              _buildInfoRow('Cliente: ${tarea.cliente}'),
              _buildInfoRow('Estatus: ${tarea.estatus}'),
            ],
          ),
        ),
      ),
    );
  }

 Widget _buildInfoRow(String label, String value) {
  return Container(
    margin: EdgeInsets.only(bottom: 16.0),
    child: Row(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.all(16.0),
             decoration: BoxDecoration(
  borderRadius: BorderRadius.circular(8.0),
  border: Border.all(
    color: Color.fromARGB(255, 255, 255, 255), // Color del borde
    width: 2.0,               // Ancho del borde
  ),
  color: Colors.white,        // Color de fondo del contenedor
  boxShadow: [
    BoxShadow(
      color: Colors.grey.withOpacity(0.3), // Sombra suave para resaltar el contador
      spreadRadius: 2.0,
      blurRadius: 4.0,
      offset: Offset(0, 2),
    ),
  ],
),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 8.0),
                _getStatusWidget(value), // Cambiado para manejar el color del estatus
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _getStatusWidget(String status) {
  Color statusColor;

  switch (status.toLowerCase()) {
    case 'en progreso':
      statusColor = Colors.orange;
      break;
      case 'pendiente':
      statusColor = Colors.blue;
      break;
    case 'completada':
      statusColor = Colors.green;
      break;
    
    default:
      statusColor = Colors.black;
  }

  return Text(
    status,
    style: TextStyle(
      color: statusColor,
    ),
  );
}



  Widget _buildDateRow(String label, String value) {
    return _buildInfoRow(label, _formatDate(value));
  }

  String _formatDate(String date) {
    // Implement your date formatting logic here
    return date;
  }

  Widget _buildDescriptionSection(String label, String value) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
  borderRadius: BorderRadius.circular(8.0),
  border: Border.all(
    color: Color.fromARGB(255, 255, 255, 255), // Color del borde
    width: 2.0,               // Ancho del borde
  ),
  color: Colors.white,        // Color de fondo del contenedor
  boxShadow: [
    BoxShadow(
      color: Colors.grey.withOpacity(0.3), // Sombra suave para resaltar el contador
      spreadRadius: 2.0,
      blurRadius: 4.0,
      offset: Offset(0, 2),
    ),
  ],
),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    value,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
