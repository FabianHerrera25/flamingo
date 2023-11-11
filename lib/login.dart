import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inicio de Sesión'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: 'Correo Electrónico'),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Contraseña'),
                obscureText: true,
              ),
              SizedBox(height: 16),
              TextButton(
                onPressed: () {
                  // Lógica para iniciar sesión aquí
                },
                child: Text('Iniciar Sesión'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
