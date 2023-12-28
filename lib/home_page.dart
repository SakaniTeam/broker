import 'package:abdo/Widgets/contact_us.dart';
import 'package:abdo/home_two.dart';
import 'package:abdo/show_offers.dart';
import 'package:abdo/show_property.dart';
import 'package:abdo/show_requests.dart';
import 'package:abdo/update_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List users = [];
  User? currentUser = FirebaseAuth.instance.currentUser;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String? userName; // Added variable to store userName

  void UserAccount() async {
    CollectionReference tblProduct =
        FirebaseFirestore.instance.collection('userAccount');
    await Future.delayed(Duration(seconds: 2));
    await tblProduct.get().then((querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        Map<String, dynamic> store = doc.data() as Map<String, dynamic>;
        store['documentId'] = doc.id;
        users.add(store);
      });

      if (users.isNotEmpty) {
        userName = users.isNotEmpty ? users[0]['userName'] as String? : null;
      }
      setState(() {});
    });
  }

  @override
  void initState() {
    UserAccount(); // Fetch user data
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        iconTheme: const IconThemeData(color: Color.fromRGBO(246, 117, 4, 1)),
        elevation: 0.0,
      ),
      drawerEnableOpenDragGesture: false,
      drawerEdgeDragWidth: 0,
      drawer: Drawer(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(userName ?? 'N/A'),
              accountEmail: Text(currentUser?.email ?? 'N/A'),
              currentAccountPicture: const CircleAvatar(
                backgroundColor: Color.fromARGB(255, 255, 255, 255),
              ),
              decoration: BoxDecoration(
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 20),
            // ListTile(
            //   title: const Text('Edit your profile'),
            //   leading: const Icon(Icons.edit),
            //   onTap: () {
            //     Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //           builder: (context) => EditPage(),
            //         ));
            //   },
            // ),
            ListTile(
              title: const Text('Notifications'),
              leading: const Icon(Icons.notifications),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Contact Us'),
              leading: const Icon(Icons.contact_support),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ContactUs(),
                    ));
              },
            ),
            ListTile(
              title: const Text('Log Out'),
              leading: const Icon(Icons.logout),
              onTap: () async {
                final GoogleSignIn googleSignIn = GoogleSignIn();
                googleSignIn.disconnect();
                await FirebaseAuth.instance.signOut();

                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            color: const Color.fromARGB(255, 255, 255, 255),
            child: Text(
              "   Welcome \n $userName",
              style: TextStyle(
                color: Color.fromARGB(255, 251, 175, 109),
                fontSize: 40,
                fontFamily: 'Lora',
              ),
            ),
          ),
          Positioned(
            top: screenHeight / 4,
            child: Container(
              height: screenHeight / 1,
              width: 400,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 246, 117, 4),
                borderRadius: BorderRadius.circular(55.0),
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 55,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      OutlinedButton.icon(
                        style: ElevatedButton.styleFrom(
                          foregroundColor:
                              const Color.fromARGB(255, 255, 255, 255),
                          textStyle: const TextStyle(fontSize: 25),
                          side: const BorderSide(
                            width: 0,
                            color: Color.fromARGB(
                              255,
                              246,
                              117,
                              4,
                            ),
                          ), // Border color
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const AfterHome()));
                        },
                        icon: const Icon(
                          Icons.add_home_outlined,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                        label: const Text("  Add Property  "),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const AfterHome()));
                        },
                        icon: const Icon(Icons.arrow_forward_ios),
                        color: const Color.fromARGB(255, 255, 255, 255),
                      ),
                    ],
                  ),
                  const SizedBox(height: 60),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      OutlinedButton.icon(
                        style: ElevatedButton.styleFrom(
                          foregroundColor:
                              const Color.fromARGB(255, 255, 255, 255),
                          textStyle: const TextStyle(fontSize: 25),
                          side: const BorderSide(
                            width: 0,
                            color: Color.fromARGB(
                              255,
                              246,
                              117,
                              4,
                            ),
                          ), // Border color
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => showProperty(),
                              ));
                        },
                        icon: const Icon(
                          Icons.remove_red_eye_outlined,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                        label: const Text("  Show Property "),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ShowOffers(),
                              ));
                        },
                        icon: const Icon(Icons.arrow_forward_ios),
                        color: const Color.fromARGB(255, 255, 255, 255),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      OutlinedButton.icon(
                        style: ElevatedButton.styleFrom(
                          foregroundColor:
                              const Color.fromARGB(255, 255, 255, 255),
                          textStyle: const TextStyle(fontSize: 25),
                          side: const BorderSide(
                            width: 0,
                            color: Color.fromARGB(
                              255,
                              246,
                              117,
                              4,
                            ),
                          ), // Border color
                        ),
                        onPressed: () {
                          // Handle button press
                        },
                        icon: const Icon(
                          Icons.local_offer_outlined,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                        label: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ShowOffers(),
                                  ));
                            },
                            child: const Text(" show Offers ")),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ShowOffers(),
                              ));
                        },
                        icon: const Icon(Icons.arrow_forward_ios),
                        color: const Color.fromARGB(255, 255, 255, 255),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      OutlinedButton.icon(
                        style: ElevatedButton.styleFrom(
                          foregroundColor:
                              const Color.fromARGB(255, 255, 255, 255),
                          textStyle: const TextStyle(fontSize: 25),
                          side: const BorderSide(
                            width: 0,
                            color: Color.fromARGB(
                              255,
                              246,
                              117,
                              4,
                            ),
                          ), // Border color
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ShowRequest(),
                              ));
                        },
                        icon: const Icon(
                          Icons.today_rounded,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                        label: const Text("  Tour Request  "),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ShowRequest(),
                              ));
                        },
                        icon: const Icon(Icons.arrow_forward_ios),
                        color: const Color.fromARGB(255, 255, 255, 255),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
