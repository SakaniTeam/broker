import 'dart:io';

import 'package:abdo/location_page.dart';
import 'package:abdo/home_two.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class CommercialPage extends StatefulWidget {
  const CommercialPage({super.key});

  @override
  State<CommercialPage> createState() => _ResdintiallPageState();
}

final GlobalKey<FormState> _ss88 = GlobalKey<FormState>();
final propertyCAdressController = TextEditingController();
final priceCController = TextEditingController();
final phoneCController = TextEditingController();
final detailsCController = TextEditingController();

String typeC = "";
String statusC = "";
String rentDurationC = "";
double price = 0;
  void dispose() {
    _ss88.currentState?.dispose();
    propertyCAdressController.clear();
    priceCController.clear();
    phoneCController.clear();
    detailsCController.clear();
   
  }


class _ResdintiallPageState extends State<CommercialPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        elevation: 0,
        backgroundColor: const Color.fromARGB(0, 206, 25, 25),
        title: const Text(
          'Add Residential Property ',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Form(
            key: _ss88,
            child: Column(
              children: <Widget>[
                const Row(
                  children: [
                    Text(
                      "Type",
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                DropdownButtonFormField(
                  validator: (value) {
                    if (value == null) return 'You must choose one';
                    return null;
                  },
                  items: const [
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
                      borderSide: const BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                const Row(
                  children: [
                    Text(
                      "Status",
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                DropdownButtonFormField(
                  validator: (value) {
                    if (value == null) return 'You must choose one';
                    return null;
                  },
                  onSaved: (newValue) {
                    if (newValue != null) {
                      statusC = newValue;
                      print('This is the Second one +++++++ $newValue');
                    }
                  },
                  items: const [
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
                      borderSide: const BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                const Row(
                  children: [
                    Text(
                      "Property address",
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) return 'You must choose one';
                    return null;
                  },
                  controller: propertyCAdressController,
                  decoration: InputDecoration(
                    fillColor: Colors.grey,
                    labelText: 'Property Address',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                const Row(
                  children: [
                    Text(
                      "Price",
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                TextFormField(
                  validator: (value) {
                    if (!RegExp(r'^\d+$').hasMatch(value!)) {
                      return 'Enter a Valid Number';
                    }
                    if (value.isEmpty) return 'You must choose one';
                    return null;
                  },
                  controller: priceCController,
                  decoration: InputDecoration(
                    fillColor: Colors.grey,
                    labelText: 'Price',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                const Row(
                  children: [
                    Text(
                      "Phone number",
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) return 'You must choose one';
                    return null;
                  },
                  controller: phoneCController,
                  decoration: InputDecoration(
                    fillColor: Colors.grey,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                const Row(
                  children: [
                    Text(
                      "More details",
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) return 'You must choose one';
                    return null;
                  },
                  controller: detailsCController,
                  decoration: InputDecoration(
                    fillColor: Colors.grey,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                const Row(
                  children: [
                    Text(
                      "Rent duration",
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                DropdownButtonFormField(
                  validator: (value) {
                    if (value == null) return 'You must choose one';
                    return null;
                  },
                  onSaved: (newValue) {
                    if (newValue != null) {
                      rentDurationC = newValue;
                    }
                  },
                  items: const [
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
                      borderSide: const BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(
                          context,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(250, 129, 40, 1),
                        foregroundColor: Colors.white,
                      ),
                      child: const Text('Back'),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        setState(() {});
                        if (_ss88.currentState!.validate()) {
                          _ss88.currentState!.save();
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LOcationPage(
                                isResd: false,
                              ),
                            ),
                          );
                          setState(() {});
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(250, 129, 40, 1),
                        foregroundColor: Colors.white,
                      ),
                      child: const Text('Next'),
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

  final imagename = basename(image!.path);

  final refStorage = FirebaseStorage.instance.ref('images');
  await refStorage.putFile(file!);
  imgUrl = await refStorage.getDownloadURL();

  return imgUrl;
}
