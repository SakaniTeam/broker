import 'package:abdo/home_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ShowOffers extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<ShowOffers> {
  List Offers = [];
  bool isloading = true;

  int currentIndex = 0; // Add a default value

  void getoffers() async {
    CollectionReference tblProduct =
        FirebaseFirestore.instance.collection('offers');
    await Future.delayed(Duration(seconds: 2));
    await tblProduct.get().then((querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        Map<String, dynamic> store = doc.data() as Map<String, dynamic>;
        store['documentId'] = doc.id;
        Offers.add(store);
      });
      isloading = false;
      setState(() {});
    });
  }

  @override
  void initState() {
    getoffers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isloading == true
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.only(top: 20.0, left: 8.0),
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      size: 30.0,
                      color: Color.fromRGBO(118, 165, 209, 1),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(),
                          ));
                    },
                  ),
                ),
                SizedBox(height: 10.0),
                Expanded(
                  child: ListView.builder(
                    itemCount: Offers.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) => SingleProperty(
                          //         data: CCommercial[index],
                          //       ),
                          //     ));
                        },
                        child: Container(
                          padding: EdgeInsets.all(2),
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(2),
                                width: double.infinity,
                                color: Colors.grey[200],
                                child: Image.network(
                                  '${Offers[index]['image']}',
                                  height: 200,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: Container(
                                  height: 180,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10),
                                          child: Text(
                                            '${Offers[index]['address']}',
                                            style: TextStyle(fontSize: 18 , fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Text(
                                          ' Name : ${Offers[index]['name']}',
                                          style: TextStyle(
                                              fontSize: 14,
                                           ),
                                        ),
                                        Text(
                                          'Gmail : ${Offers[index]['mail']}',
                                          style: TextStyle(fontSize: 14),
                                        ),
                                        Text(
                                          ' Newnumber : ${Offers[index]['new phoneNumber']}     Oldnumber ${Offers[index]['oldphoneNumber']} ',
                                          style: TextStyle(fontSize: 13),
                                        ),
                                        Text(
                                          'Details : ${Offers[index]['propertyDetails']}',
                                          style: TextStyle(fontSize: 13),
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text("property price : " ,style: TextStyle(fontSize: 16),),
                                            Text(
                                              ' ${Offers[index]['propertyPrice']} \$',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromARGB(
                                                      255, 13, 71, 119)),
                                            ),
                                          ],
                                        ),
                                         Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text("Offer price : " ,style: TextStyle(fontSize: 16),),
                                            Text(
                                              ' ${Offers[index]['rent']} \$',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromARGB(
                                                      255, 13, 71, 119)),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
