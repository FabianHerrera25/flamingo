import 'package:flutter/material.dart';
import 'actividades.dart'; // Importa el archivo de detalles de tarea (tarea_detalle.dart)

import 'package:flutter/material.dart';

class TareasPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Tareas'),
      ),
      body: TareasListView(),
    );
  }
}

class TareasListView extends StatelessWidget {
  final List<Tarea> tareas = [
    Tarea(
      nombreActividad: 'Actividad de prueba',
      usuarioCreador: 'Juan Pérez',
      usuarioEncargado: 'María Rodríguez',
      fechaSolicitud: '2023-10-15',
      fechaEntrega: '2023-10-20',
      comentarios: 'Realizar la actividad de prueba.',
      estatus: 'Pendiente',
      actividadAsignada: 'Actividad de prueba',
      descripcion: 'Esta es la descripción de la actividad de prueba.',
    ),
    Tarea(
      nombreActividad: 'Informe final',
      usuarioCreador: 'Carlos Sánchez',
      usuarioEncargado: 'Ana Gómez',
      fechaSolicitud: '2023-10-16',
      fechaEntrega: '2023-10-22',
      comentarios: 'Revisar el informe y realizar correcciones.',
      estatus: 'En progreso',
      actividadAsignada: 'Informe final',
      descripcion: 'Este es el informe final del proyecto.',
    ),
    Tarea(
      nombreActividad: 'Diseño de producto',
      usuarioCreador: 'Jorge López',
      usuarioEncargado: 'Isabel Torres',
      fechaSolicitud: '2023-10-18',
      fechaEntrega: '2023-10-25',
      comentarios: 'Revisar y aprobar el diseño del nuevo producto.',
      estatus: 'Completada',
      actividadAsignada: 'Diseño de producto',
      descripcion: 'Diseño del producto XYZ para el lanzamiento.',
    ),
    // Agrega más tareas aquí
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tareas.length,
      itemBuilder: (context, index) {
        final tarea = tareas[index];
        return ListTile(
          title: Text(tarea.nombreActividad),
          subtitle: Text('Usuario Encargado: ${tarea.usuarioEncargado}'),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DetallesTareaPage(tarea: tarea),
              ),
            );
          },
        );
      },
    );
  }
}

class Tarea {
  final String nombreActividad;
  final String usuarioCreador;
  final String usuarioEncargado;
  final String fechaSolicitud;
  final String fechaEntrega;
  final String comentarios;
  final String estatus;
  final String actividadAsignada;
  final String descripcion;

  Tarea({
    required this.nombreActividad,
    required this.usuarioCreador,
    required this.usuarioEncargado,
    required this.fechaSolicitud,
    required this.fechaEntrega,
    required this.comentarios,
    required this.estatus,
    required this.actividadAsignada,
    required this.descripcion,
  });
}
