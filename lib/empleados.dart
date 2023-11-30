import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class EmpleadosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Text(
          'Lista de Empleados',
          style: TextStyle(fontWeight: FontWeight.bold, color: Color.fromARGB(255, 252, 252, 252), // Color del borde
),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF4B9EDE),
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
            _buildDetailRow('Nombre', empleado.nombre),
            _buildDetailRow('Apellido Paterno', empleado.apellidoPaterno),
            _buildDetailRow('Apellido Materno', empleado.apellidoMaterno),
            _buildDetailRow('Cargo', empleado.cargo),
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
