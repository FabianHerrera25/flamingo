import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ClientesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Lista de Clientes',
          style: TextStyle(fontWeight: FontWeight.bold, color: Color.fromARGB(255, 252, 252, 252), // Color del borde
),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF4B9EDE),
      ),
      body: ClientesListView(),
    );
  }
}

class ClientesListView extends StatelessWidget {
  final List<Cliente> clientes = [
    Cliente(
      nombre: 'fabian ismael',
      correo: 'correo1@example.com',
      telefono: '1234567890',
      celular: '9876543210',
      direccion: 'calle 113 x 115 cinco colonias',
      persona: 'fisica',
      rfc: 'RFC123456',
      codigoPostal: '12345',
    ),
    Cliente(
      nombre: 'Juan Pérez',
      correo: 'juanperez@example.com',
      telefono: '1234567890',
      celular: '9876543210',
      direccion: 'Av. Principal #123',
      persona: 'fisica',
      rfc: 'RFC654321',
      codigoPostal: '12345',
    ),

    Cliente(
      nombre: 'Carlos Sánchez',
      correo: 'carlossanchez@example.com',
      telefono: '1234567890',
      celular: '9876543210',
      direccion: 'Av. Principal #123',
      persona: 'fisica',
      rfc: 'RFC234567',
      codigoPostal: '12345',
    ),
    Cliente(
      nombre: 'María Rodríguez',
      correo: 'mariarodriguez@example.com',
      telefono: '1234567890',
      celular: '9876543210',
      direccion: 'Av. Principal #123',
      persona: 'fisica',
      rfc: 'RFC654321',
      codigoPostal: '12345',
    ),

    Cliente(
      nombre: 'Ana Gómez',
      correo: 'anagomez@example.com',
      telefono: '1234567890',
      celular: '9876543210',
      direccion: 'Av. Principal #123',
      persona: 'fisica',
      rfc: 'RFC567890',
      codigoPostal: '12345',
    ),

    Cliente(
      nombre: 'Jorge López',
      correo: 'jorgelopez@example.com',
      telefono: '1234567890',
      celular: '9876543210',
      direccion: 'Av. Principal #901',
      persona: 'fisica',
      rfc: 'RFC123890',
      codigoPostal: '12345',
    ),
    // Agrega más clientes aquí
  ];

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
            _buildDetailRow('Nombre', cliente.nombre),
            _buildDetailRow('Correo', cliente.correo),
            _buildDetailRow('Teléfono', cliente.telefono),
            _buildDetailRow('Celular', cliente.celular),
            _buildDetailRow('Dirección', cliente.direccion),
            _buildDetailRow('Persona', cliente.persona),
            _buildDetailRow('RFC', cliente.rfc),
            _buildDetailRow('Código Postal', cliente.codigoPostal),
          ],
        ),
        actions: <Widget>[
          _buildCloseButton(context),
        ],
      );
    },
  );
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
  final String correo;
  final String telefono;
  final String celular;
  final String direccion;
  final String persona;
  final String rfc;
  final String codigoPostal;

  Cliente({
    required this.nombre,
    required this.correo,
    required this.telefono,
    required this.celular,
    required this.direccion,
    required this.persona,
    required this.rfc,
    required this.codigoPostal,
  });
}
