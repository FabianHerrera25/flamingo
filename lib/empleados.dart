import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class EmpleadosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Empleados'),
      ),
      body: EmpleadosListView(),
    );
  }
}

class EmpleadosListView extends StatelessWidget {
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
    // Mostrar detalles del empleado en un modal
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Align(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Container(
              height: 200,
              width: 300,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  const Text('Hola'),
                  Text('Nombre: ${empleado.nombre}'),
                  Text('Apellido Paterno: ${empleado.apellidoPaterno}'),
                  Text('Apellido Materno: ${empleado.apellidoMaterno}'),
                  Text('Cargo: ${empleado.cargo}'),
                ],
              ),
            ),
          ),
        );
      },
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
}

final List<Empleado> empleados = [
  Empleado(
    nombre: 'Juan',
    apellidoPaterno: 'Perez',
    apellidoMaterno: 'Lopez',
    cargo: 'Gerente',
  ),
  Empleado(
    nombre: 'Maria',
    apellidoPaterno: 'Gonzalez',
    apellidoMaterno: 'Lopez',
    cargo: 'Desarrollador',
  ),
  // Agregar más empleados aquí
];
