import 'package:abdo/home2.dart';
import 'package:abdo/login_Page.dart';
//import 'package:abdo/offers_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:abdo/show_property.dart';

// void main() {
//   runApp(MaterialApp(
//     home: HomePage(),
//   ));
// }

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.orange,
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (Context) {
                      return Login();
                    },
                  ),
                );
              },
              icon: const Icon(Icons.exit_to_app),
            ),
          ] ,
          ),

        drawer: const Drawer(),
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: GridView.count(
          crossAxisCount: 1,
          crossAxisSpacing: 4.0,
          mainAxisSpacing: 8.0,
          children: List.generate(choices.length, (index) {
            return Center(
              child: SelectCard(
                key: ObjectKey(choices[index]),
                choice: choices[index],
                onPressed: () {
                  _handleCardPressed(context, index);
                },
              ),
            );
          }),
        ),
      ),
    );
  }

  void _handleCardPressed(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  AfterHome()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => showProperty()),
        );
        break;
      default:
        break;
    }
  }
}

class Choice {
  const Choice({required this.title, required this.icon});
  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  Choice(title: 'Add property', icon: Icons.display_settings),
  Choice(title: 'Show property', icon: Icons.contacts),
];

class SelectCard extends StatelessWidget {
  const SelectCard(
      {required Key? key, required this.choice, required this.onPressed})
      : super(key: key);
  final Choice choice;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final TextStyle? textStyle = Theme.of(context).textTheme.headline6;
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        color: Colors.orange,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                  child:
                      Icon(choice.icon, size: 90.0, color: textStyle?.color)),
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Text(choice.title, style: textStyle),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
