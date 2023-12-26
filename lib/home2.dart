import 'package:abdo/commercial_page.dart';
import 'package:abdo/resdintiall_page.dart';
import 'package:flutter/material.dart';

class AfterHome extends StatefulWidget {
  const AfterHome({super.key});

  @override
  State<AfterHome> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<AfterHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color.fromARGB(0, 206, 25, 25),
        title: Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Text(
            ' Add Property',
            style: TextStyle(
              color: Color.fromARGB(255, 247, 247, 247),
              fontSize: 30,
              fontFamily: 'AlexBrush',
            ),
          ),
        ),
      ),
      backgroundColor: Color.fromARGB(255, 246, 117, 4),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          
            // Divider(
            //   thickness: 3,
            //   height: 5.0,
            //   color: Colors.black12,
            // ),

          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            width: 250,
            height: 100,
            child: OutlinedButton.icon(
                style: ElevatedButton.styleFrom(
                  textStyle:
                      TextStyle(fontSize: 20, fontFamily: 'Merriweather'),
                  onPrimary: Colors.black,
                  side: BorderSide(width: 0, color: Colors.white),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResdintiallPage(),
                      
                      ));
                      setState(() {
                        
                      });
                },
                icon: Icon(
                  Icons.house_rounded,
                  color: Color.fromRGBO(250, 129, 40, 1),
                  size: 70,
                ),
                label: Text(
                  "Residential",
                )),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                width: 250,
                height: 100,
                child: OutlinedButton.icon(
                    style: ElevatedButton.styleFrom(
                      textStyle:
                          TextStyle(fontSize: 20, fontFamily: 'Merriweather'),
                      onPrimary: Colors.black,
                      side: BorderSide(width: 0, color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CommercialPage(),
                          ));
                    },
                    icon: Icon(
                      Icons.add_business_rounded,
                      color: Color.fromRGBO(250, 129, 40, 1),
                      size: 70,
                    ),
                    label: Text(
                      "Commercial",
                    )),
              ),
            ],
          )
        ],
      ),
    );
  }
}
