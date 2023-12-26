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

class ResdintiallPage extends StatefulWidget {
  ResdintiallPage({super.key});

  @override
  State<ResdintiallPage> createState() => _ResdintiallPageState();
}

final GlobalKey<FormState> _formKey = GlobalKey();

final typeRController = TextEditingController();
final statusController = TextEditingController();
final propertyAdressController = TextEditingController();
final priceController = TextEditingController();
final phoneController = TextEditingController();
final detailsController = TextEditingController();
final rentDurationController = TextEditingController();
String typeR = "";
String status = "";
String rentduration = "";
double price = 0;


class _ResdintiallPageState extends State<ResdintiallPage> {
  @override
  void dispose() {
  _formKey.currentState?.dispose() ;
    super.dispose();
  }
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
            key: _formKey,
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
                    typeR = value.toString();
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
                      status = newValue;
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
                  controller: propertyAdressController,
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
                  controller: priceController,
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
                  controller: phoneController,
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
                  controller: detailsController,
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
                      rentduration = newValue;
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
                       if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
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

