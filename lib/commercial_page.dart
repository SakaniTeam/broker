import 'dart:io';

import 'package:abdo/LLocation.dart';
import 'package:abdo/home2.dart';
import 'package:abdo/location.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class CommercialPage extends StatefulWidget {
  CommercialPage({super.key});

  @override
  State<CommercialPage> createState() => _ResdintiallPageState();
}

final GlobalKey<FormState> _ss88 = GlobalKey<FormState>();
final typeCController = TextEditingController();
final statusCController = TextEditingController();
final propertyCAdressController = TextEditingController();
final priceCController = TextEditingController();
final phoneCController = TextEditingController();
final detailsCController = TextEditingController();
final rentDurationCController = TextEditingController();
String typeC = "";
String statusC = "";
String rentDurationC = "";
double price = 0;

class _ResdintiallPageState extends State<CommercialPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color.fromARGB(0, 206, 25, 25),
        title: Text(
          'Add Residential Property ',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Form(
            key: _ss88,
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Type",
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
                DropdownButtonFormField(
                  validator: (value) {
                    if (value == null) return 'You must choose one';
                  },
                  items: [
                    DropdownMenuItem(
                      value: 'Apartment ',
                      child: Text('Apartment'),
                    ),
                    DropdownMenuItem(
                      value: 'Floor',
                      child: Text('Floor'),
                    ),
                    DropdownMenuItem(
                      value: 'House',
                      child: Text('House'),
                    ),
                    DropdownMenuItem(
                      value: 'Building',
                      child: Text('Building'),
                    ),
                    DropdownMenuItem(
                      value: 'Land',
                      child: Text('Land'),
                    ),
                  ],
                  onChanged: (value) {
                    typeC = value.toString();
                  },
                  decoration: InputDecoration(
                    fillColor: Colors.grey,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Status",
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
                DropdownButtonFormField(
                  validator: (value) {
                    if (value == null) return 'You must choose one';
                  },
                  onSaved: (newValue) {
                    if (newValue != null) {
                      statusC = newValue;
                      print('This is the Second one +++++++ $newValue');
                    }
                  },
                  items: [
                    DropdownMenuItem(
                      value: 'Rent',
                      child: Text('Rent'),
                    ),
                    DropdownMenuItem(
                      value: 'Sale',
                      child: Text('Sale'),
                    ),
                  ],
                  onChanged: (value) {
                    // handle onChanged
                  },
                  decoration: InputDecoration(
                    fillColor: Colors.grey,
                    labelText: 'States',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Property address",
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) return 'You must choose one';
                  },
                  controller: propertyCAdressController,
                  decoration: InputDecoration(
                    fillColor: Colors.grey,
                    labelText: 'Property Address',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Price",
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
                TextFormField(
                  validator: (value) {
                    if (!RegExp(r'^\d+$').hasMatch(value!))
                      return 'Enter a Valid Number';
                    if (value!.isEmpty) return 'You must choose one';
                  },
                  controller: priceCController,
                  decoration: InputDecoration(
                    fillColor: Colors.grey,
                    labelText: 'Price',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Phone number",
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) return 'You must choose one';
                  },
                  controller: phoneCController,
                  decoration: InputDecoration(
                    fillColor: Colors.grey,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "More details",
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) return 'You must choose one';
                  },
                  controller: detailsCController,
                  decoration: InputDecoration(
                    fillColor: Colors.grey,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Rent duration",
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
                DropdownButtonFormField(
                  validator: (value) {
                    if (value == null) return 'You must choose one';
                  },
                  onSaved: (newValue) {
                    if (newValue != null) {
                      rentDurationC = newValue;
                    }
                  },
                  items: [
                    DropdownMenuItem(
                      value: '1',
                      child: Text('1 Month'),
                    ),
                    DropdownMenuItem(
                      value: '2',
                      child: Text('2 Months'),
                    ),
                    // Add more options as needed
                  ],
                  onChanged: (value) {
                    // handle onChanged
                  },
                  decoration: InputDecoration(
                    fillColor: Colors.grey,
                    labelText: 'Type',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AfterHome(),
                            ));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(250, 129, 40, 1),
                        foregroundColor: Colors.white,
                      ),
                      child: Text('Back'),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                         setState(() {
                                
                              });
                       if (_ss88.currentState!.validate()) {
                          _ss88.currentState!.save();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => location(),
                                
                              ));
                              setState(() {
                                
                              });
                       }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(250, 129, 40, 1),
                        foregroundColor: Colors.white,
                      ),
                      child: Text('Next'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Future<String> getImage() async {
  String imgUrl;
  File? file;
  final ImagePicker picker = ImagePicker();
  final XFile? image = await picker.pickImage(source: ImageSource.gallery);
  if (image != null) file = File(image.path);

  var imagename = basename(image!.path);

  var refStorage = FirebaseStorage.instance.ref('images');
  await refStorage.putFile(file!);
  imgUrl = await refStorage.getDownloadURL();

  return imgUrl;
}
