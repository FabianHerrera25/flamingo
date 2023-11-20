import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inicio de Sesión'),
      ),
      body: Stack(
        fit: StackFit.expand, // La imagen de fondo ocupa toda la pantalla
        children: [
          // Fondo con imagen
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/fondo_back.jpg'),
                fit: BoxFit.fill, // La imagen de fondo ocupa toda la pantalla
              ),
            ),
          ),
          // Contenedor con elementos de la interfaz de usuario
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    // Imagen encima de los elementos
                    Image.asset(
                      'assets/logo2.png',
                      width: 150, // ajusta el ancho según sea necesario
                      height: 150, // ajusta la altura según sea necesario
                    ),
                    SizedBox(height: 24), // Separación entre la imagen y el TextField
                    // Input para Correo Electrónico
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Ingrese su correo electrónico',
                        fillColor: Colors.white,
                        filled: true,
                        contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                      ),
                    ),
                    SizedBox(height: 24), // Separación entre TextField
                    // Input para Contraseña
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Ingrese su contraseña',
                        fillColor: Colors.white,
                        filled: true,
                        contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                      ),
                      obscureText: true,
                    ),
                    SizedBox(height: 24), // Separación entre TextField y el botón
                    // Botón para Iniciar Sesión con esquinas redondeadas
                    ElevatedButton(
                      onPressed: () {
                        // Lógica para iniciar sesión aquí
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(9.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          'Iniciar Sesión',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
