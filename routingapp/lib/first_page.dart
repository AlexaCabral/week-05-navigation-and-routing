import 'package:flutter/material.dart';
import 'package:routingapp/second_page.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer(),
      appBar: AppBar(
        title: Text("This is the first page"),
      ),
      body: Column(
        children: [
          TextField(
            controller: controller,
          ),
          ElevatedButton(
              onPressed: () async {
                // Navigator.push(context, MaterialPageRoute(builder: (context) => SecondPage())); // converts widget into a route to push
                final result = await Navigator.pushNamed(
                  context,
                  "/second",
                  arguments: controller.text,
                ); // define name of route in material app & receiver

                ScaffoldMessenger.of(context)
                  ..removeCurrentSnackBar()
                  ..showSnackBar(SnackBar(content: Text("$result")));
              },
              child: Text("Go to the second page"))
        ],
      ),
    );
  }

  Widget drawer() {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(child: Text("Menu, Routes, and Navigation")),
          ListTile(
            title: Text("First Page"),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, "/first");
            },
          ),
          ListTile(
            title: Text("Second Page"),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(
                context,
                "/second",
                arguments: controller.text,
              );
            },
          ),
        ],
      ),
    );
  }
}
