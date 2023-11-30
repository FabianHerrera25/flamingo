import 'package:flamingo/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:fl_chart/fl_chart.dart'; // Asegúrate de agregar la dependencia fl_chart en tu archivo pubspec.yaml

import 'empleados.dart';
import 'clientes.dart';
import 'tareas.dart';
import 'profile.dart';

void main() {
  runApp(MyApp());
}

/*class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(), // Inicia con la página de inicio de sesión
    );
  }
} */
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    _checkAndRequestStoragePermission();
  }

  Future<void> _checkAndRequestStoragePermission() async {
    var status = await Permission.storage.status;

    if (status.isGranted) {
      // El permiso ya está concedido, continuar abriendo la aplicación
      _openApp();
    } else {
      // Solicitar el permiso y mostrar el diálogo después de solicitarlo
      await _requestStoragePermission();
    }
  }

  Future<void> _requestStoragePermission() async {
    var status = await Permission.storage.request();
    if (status == PermissionStatus.denied) {
      // Si el usuario vuelve a denegar el permiso, mostrar el diálogo solicitando permisos
      _showPermissionDeniedDialog();
    } else if (status != PermissionStatus.granted) {
      // Puedes mostrar un diálogo o mensaje al usuario para informar que se requieren permisos.
      print("Permiso de almacenamiento no otorgado");
    } else {
      // El permiso fue concedido, continuar abriendo la aplicación
      _openApp();
    }
  }

  void _openApp() {
    // Aquí abres tu aplicación o realizas cualquier otra acción necesaria
  }

  // Función para mostrar un diálogo si el usuario ha denegado permanentemente el permiso
  Future<void> _showPermissionDeniedDialog() async {
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Permisos necesarios"),
        content: Text("Esta aplicación necesita permisos de almacenamiento para funcionar."),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              _requestStoragePermission(); // Vuelve a solicitar permisos después de cerrar el diálogo
            },
            child: Text("Reintentar"),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              // Cierra la aplicación si el usuario no acepta los permisos
              SystemNavigator.pop();
            },
            child: Text("Salir"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
        title: Text(
          'FLAMINGO SOFT',
          style: TextStyle(fontWeight: FontWeight.bold, color: Color.fromARGB(255, 252, 252, 252), // Color del borde
),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF4B9EDE),
      ),
      drawer: Drawer(
  child: Container(
    color: Color.fromARGB(255, 38, 78, 193),
    child: ListView(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 28, 58, 143),
          ),
          child: UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Colors.transparent),
            accountName: Text(
              'Fabian Ismael Herrera Koh',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            accountEmail: Text(
              'splitter33@gmail.com',
              style: TextStyle(fontSize: 14.0),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(
                Icons.person,
                size: 50,
                color: Colors.blue,
              ),
            ),
          ),
        ),
        ListTile(
          leading: Icon(Icons.people, color: Colors.white),
          title: Text('Perfil', style: TextStyle(color: Colors.white, fontSize: 16.0)),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProfileScreen(),
              ),
            );
          },
        ),
        ListTile(
          leading: Icon(Icons.assignment, color: Colors.white),
          title: Text('Tareas', style: TextStyle(color: Colors.white, fontSize: 16.0)),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => TareasPage(),
              ),
            );
          },
        ),
        ListTile(
          leading: Icon(Icons.group, color: Colors.white),
          title: Text('Empleados', style: TextStyle(color: Colors.white, fontSize: 16.0)),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => EmpleadosPage(),
              ),
            );
          },
        ),
        ListTile(
          leading: Icon(Icons.group, color: Colors.white),
          title: Text('Clientes', style: TextStyle(color: Colors.white, fontSize: 16.0)),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ClientesPage(),
              ),
            );
          },
        ),
        ListTile(
          leading: Icon(Icons.group, color: Colors.white),
          title: Text('Login', style: TextStyle(color: Colors.white, fontSize: 16.0)),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => LoginPage(),
              ),
            );
          },
        ),
      ],
    ),
  ),
),

      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 100,
                backgroundImage: AssetImage('assets/logo2.png'), // Reemplaza con la ruta correcta del icono
              ),
              SizedBox(height: 20),
              Text(
                '¡Bienvenido a Flamingo Soft!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue),
              ),
              SizedBox(height: 10),
              Text(
                'Tu amigo contable',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              SizedBox(height: 20),
              
            ],
          ),
        ),
      
    );
  }
}
