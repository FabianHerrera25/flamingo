import 'package:flutter/material.dart';
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FLAMINGOSOFT'),
      ),
      drawer: Drawer(
        child: Container(
          color: Color.fromARGB(255, 38, 78, 193),
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text('fabian ismael herrera koh'),
                accountEmail: Text('splitter33@gmail.com'),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Color.fromRGBO(241, 72, 6, 1),
                  child: Icon(Icons.person),
                ),
              ),
              ListTile(
                leading: Icon(Icons.people, color: Colors.white),
                title: Text('perfil', style: TextStyle(color: Colors.white)),
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
                  leading:
                      Icon(Icons.group, color: Colors.white), // Icono empleados
                  title:
                      Text('Empleados', style: TextStyle(color: Colors.white)),
                  onTap: () {
                    Navigator.of(context).pop(); // Cerrar el menú
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => EmpleadosPage(),
                      ),
                    );
                  }),
              ListTile(
                  leading:
                      Icon(Icons.group, color: Colors.white), // Icono empleados
                  title:
                      Text('clientes', style: TextStyle(color: Colors.white)),
                  onTap: () {
                    Navigator.of(context).pop(); // Cerrar el menú
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ClientesPage(),
                      ),
                    );
                  }),
              ListTile(
                leading: Icon(Icons.people, color: Colors.white),
                title: Text('cartera clientes',
                    style: TextStyle(color: Colors.white)),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
      body: Center(),
    );
  }
}
