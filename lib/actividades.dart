import 'package:flutter/material.dart';
import 'tareas.dart';

import 'package:flutter/material.dart';

class DetallesTareaPage extends StatelessWidget {
  final Tarea tarea;

  DetallesTareaPage({required this.tarea});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles de Tarea'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nombre de la Actividad: ${tarea.nombreActividad}'),
            Text('Usuario Creador: ${tarea.usuarioCreador}'),
            Text('Usuario Encargado: ${tarea.usuarioEncargado}'),
            Text('Fecha de Solicitud: ${tarea.fechaSolicitud}'),
            Text('Fecha de Entrega: ${tarea.fechaEntrega}'),
            Text('Comentarios: ${tarea.comentarios}'),
            Text('Estatus: ${tarea.estatus}'),
            Text('Actividad Asignada: ${tarea.actividadAsignada}'),
            Text('Descripción: ${tarea.descripcion}'),
            // Agregar más detalles de la tarea si es necesario
          ],
        ),
      ),
    );
  }
}
