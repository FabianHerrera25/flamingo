import 'package:flamingo/login.dart';
import 'package:flutter/material.dart';
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
      home: LoginPage(), // Inicia con la página de inicio de sesión
    );
  }
}
/*class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}*/

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    _requestStoragePermission();
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
                accountName: Text('fabian ismael herrera koh'),
                accountEmail: Text('splitter33@gmail.com'),
                currentAccountPicture: Container(
                child: Align(
                  alignment: Alignment.center,
                  child: CircleAvatar (
                    backgroundColor: Colors.white,
                    radius: 50.0, // Ajusta el radio según sea necesario
                    child: Icon(Icons.person, size: 50, color: Colors.blue),
                  ),
                  ),
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

  Future<void> _requestStoragePermission() async {
    var status = await Permission.storage.request();
    if (status != PermissionStatus.granted) {
      // Puedes mostrar un diálogo o mensaje al usuario para informar que se requieren permisos.
      print("Permiso de almacenamiento no otorgado");
    }
  }
}
