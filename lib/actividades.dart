import 'package:flutter/material.dart';
import 'tareas.dart';

class DetallesTareaPage extends StatelessWidget {
  final Tarea tarea;

  DetallesTareaPage({required this.tarea});

 @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text(
        '${tarea.nombreActividad}',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
    ),
    body: Card(
      margin: EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
            children: [
              Row(
                children: [
                  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                    padding: EdgeInsets.all(8.0),
                    margin: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: _buildInfoRow('Creador', tarea.usuarioCreador),
                  ),
                  Container(
                    padding: EdgeInsets.all(8.0),
                    margin: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: _buildInfoRow('Fecha de Solicitud', tarea.fechaSolicitud),
                  ),
                  Container(
                    padding: EdgeInsets.all(8.0),
                    margin: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: _buildInfoRow('Actividad Asignada', tarea.actividadAsignada),
                  ),
                  ],
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                    padding: EdgeInsets.all(8.0),
                    margin: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: _buildInfoRow('Encargado', tarea.usuarioEncargado),
                  ),
                  Container(
                    padding: EdgeInsets.all(8.0),
                    margin: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: _buildInfoRow('Fecha de Entrega', tarea.fechaEntrega),
                  ),
                  Container(
                    padding: EdgeInsets.all(8.0),
                    margin: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: _buildInfoRow('Estatus', tarea.estatus),
                  ),
                  ],
                ),
              ],
              ),
              Row(
                children: [
                  Flexible(
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      margin: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: _buildInfoRow('Descripción', tarea.descripcion),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Flexible(
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      margin: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: _buildInfoRow('Comentarios', tarea.comentarios),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    constraints: BoxConstraints(
                      maxWidth: 300.0,
                      maxHeight: 100.0,
                    ),
                    padding: EdgeInsets.all(8.0),
                    margin: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: _buildInfoRow('Comentarios', tarea.comentarios),
                  ),
                ],
              ),
            ],
        ),
      ),
    ),
  );
}


  Widget _buildInfoRow(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$label:',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(value),
        SizedBox(height: 8), // Espaciado entre cada par de etiqueta y texto
      ],
    );
  }
}
