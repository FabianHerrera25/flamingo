import 'package:flutter/material.dart';

class ClientesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Clientes'),
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
        return ListTile(
          title: Text(cliente.nombre),
          onTap: () {
            _mostrarDetallesCliente(context, cliente);
          },
        );
      },
    );
  }

  void _mostrarDetallesCliente(BuildContext context, Cliente cliente) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Detalles de Cliente'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Nombre: ${cliente.nombre}'),
              Text('Correo: ${cliente.correo}'),
              Text('Teléfono: ${cliente.telefono}'),
              Text('Celular: ${cliente.celular}'),
              Text('Dirección: ${cliente.direccion}'),
              Text('Persona: ${cliente.persona}'),
              Text('RFC: ${cliente.rfc}'),
              Text('Código Postal: ${cliente.codigoPostal}'),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cerrar'),
            ),
          ],
        );
      },
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
