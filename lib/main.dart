import 'package:flamingo/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
import 'empleados.dart';
import 'clientes.dart';
import 'tareas.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
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
        title: Text('FLAMINGOSOFT'),
      ),
      drawer: Drawer(
        child: Container(
          alignment: Alignment.center,
          color: Color.fromARGB(255, 38, 78, 193),
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.transparent),
                accountName: Text('fabian ismael herrera koh'),
                accountEmail: Text('splitter33@gmail.com'),
                currentAccountPicture: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50)
                  ),
                child: Icon(Icons.person, size: 50, color: Colors.blue),
                  ),
                  ),
              ListTile(
                leading: Icon(Icons.people, color: Colors.white),
                title: Text('Perfil', style: TextStyle(color: Colors.white)),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.assignment, color: Colors.white),
                title: Text('Tareas', style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.of(context).pop(); // Cerrar el menú
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => TareasPage(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.group, color: Colors.white),
                title: Text('Empleados', style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.of(context).pop(); // Cerrar el menú
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => EmpleadosPage(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.group, color: Colors.white),
                title: Text('Clientes', style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.of(context).pop(); // Cerrar el menú
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ClientesPage(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.group, color: Colors.white),
                title: Text('Login', style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.of(context).pop(); // Cerrar el menú
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
      body: Center(),
    );
  }
}
