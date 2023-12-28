import 'package:abdo/location_page.dart';
import 'package:flutter/material.dart';

class ResdintiallPage extends StatefulWidget {
  const ResdintiallPage({super.key});

  @override
  State<ResdintiallPage> createState() => _ResdintiallPageState();
}

final GlobalKey<FormState> _formKey = GlobalKey();

final propertyAdressController = TextEditingController();
final priceController = TextEditingController();
final phoneController = TextEditingController();
final detailsController = TextEditingController();
String typeR = "";
String status = "";
String rentduration = "";

class _ResdintiallPageState extends State<ResdintiallPage> {
  @override
  void dispose() {
    _formKey.currentState?.dispose();
    priceController.clear();
    phoneController.clear();
    detailsController.clear();
    propertyAdressController.clear();
    super.dispose();
  }

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
            key: _formKey,
            child: Column(
              children: <Widget>[
                const Row(
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
                    typeR = value.toString();
                  },
                  decoration: InputDecoration(
                    fillColor: Colors.grey,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                  ),
                ),
                const Row(
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
                        width: 1,
                      ),
                    ),
                  ),
                ),
                const Row(
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
                      borderSide: const BorderSide(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                  ),
                ),
                const Row(
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
                      borderSide: const BorderSide(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                  ),
                ),
                const Row(
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
                    if (value!.isEmpty && value!.length != 11) 
                     return 'field can not be empty and must be eleven numbers';
                      // if (value!.length != 11) {
                      //   return 'must be eleven 11 numbersssss';
                      // }
                      
                    
                   
                  },
                  keyboardType: TextInputType.number,
                  controller: phoneController,
                  decoration: InputDecoration(
                    fillColor: Colors.grey,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                  ),
                ),
                const Row(
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
                      borderSide: const BorderSide(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                  ),
                ),
                const Row(
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
                  items: const [
                    DropdownMenuItem(
                      value: '1',
                      child: Text('1 Month'),
                    ),
                    DropdownMenuItem(
                      value: '2',
                      child: Text('2 Months'),
                    ),
                    DropdownMenuItem(
                      value: '3',
                      child: Text('3 Months'),
                    ),
                    DropdownMenuItem(
                      value: '4',
                      child: Text('4 Months'),
                    ),
                    // Add more options as needed
                  ],
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
                  onChanged: (String? value) {},
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
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LOcationPage(
                                  isResd: true,
                                ),
                              ));
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
