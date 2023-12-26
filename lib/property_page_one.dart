// import 'package:abdo/Property_page_two.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// class AddProOne extends StatefulWidget {
//   AddProOne({super.key});
//   final propertyController = TextEditingController();
//   final priceController = TextEditingController();
//   final phoneController = TextEditingController();
//   final detailsController = TextEditingController();

//   @override
//   State<AddProOne> createState() => _MyWidgetState();
// }

// String type = "";

// class _MyWidgetState extends State<AddProOne> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         elevation: 0,
//         backgroundColor: const Color.fromARGB(0, 206, 25, 25),
//         title: const Text(
//           ' Property',
//           style: TextStyle(color: Colors.black, fontSize: 30),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(10),
//         child: SingleChildScrollView(
//           child: Form(
//             child: Column(
//               children: <Widget>[
//                 const Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Text(
//                       "Property ",
//                       style: TextStyle(fontSize: 20),
//                     )
//                   ],
//                 ),
//                 DropdownButtonFormField(
//                   onSaved: (newValue) {
//                     if (newValue != null) {
//                       type = newValue;
//                     }
//                   },
//                   items: const [
//                     DropdownMenuItem(
//                       value: 'Commercial',
//                       child: Text('Commercial'),
//                     ),
//                     DropdownMenuItem(
//                       value: 'Houses',
//                       child: Text('Houses'),
//                     ),
//                   ],
//                   onChanged: (value) {
//                     // handle onChanged
//                   },
//                   decoration: InputDecoration(
//                     fillColor: Colors.grey,
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(6),
//                       borderSide: const BorderSide(
//                         color: Colors.grey,
//                         width: 1,
//                       ),
//                     ),
//                   ),
//                 ),
//                 const Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Text(
//                       "Status",
//                       style: TextStyle(fontSize: 20),
//                     )
//                   ],
//                 ),
//                 DropdownButtonFormField(
//                   items: const [
//                     DropdownMenuItem(
//                       value: 'Rent',
//                       child: Text('Rent'),
//                     ),
//                     DropdownMenuItem(
//                       value: 'Sale',
//                       child: Text('Sale'),
//                     ),
//                   ],
//                   onChanged: (value) {
//                     // handle onChanged
//                   },
//                   decoration: InputDecoration(
//                     fillColor: Colors.grey,
//                     labelText: 'States',
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(6),
//                       borderSide: const BorderSide(
//                         color: Colors.grey,
//                         width: 1,
//                       ),
//                     ),
//                   ),
//                 ),
//                 const Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Text(
//                       "Property address",
//                       style: TextStyle(fontSize: 20),
//                     )
//                   ],
//                 ),
//                 TextFormField(
//                   decoration: InputDecoration(
//                     fillColor: Colors.grey,
//                     labelText: 'Property Address',
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(6),
//                       borderSide: const BorderSide(
//                         color: Colors.grey,
//                         width: 1,
//                       ),
//                     ),
//                   ),
//                 ),
//                 const Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Text(
//                       "Price",
//                       style: TextStyle(fontSize: 20),
//                     )
//                   ],
//                 ),
//                 /////////////////////
//                 TextFormField(
//                   controller: widget.priceController,
//                   decoration: InputDecoration(
//                     fillColor: Colors.grey,
//                     labelText: 'Price',
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(6),
//                       borderSide: const BorderSide(
//                         color: Colors.grey,
//                         width: 1,
//                       ),
//                     ),
//                   ),
//                 ),
//                 const Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Text(
//                       "Phone number",
//                       style: TextStyle(fontSize: 20),
//                     )
//                   ],
//                 ),
//                 TextFormField(
//                   controller: widget.phoneController,
//                   decoration: InputDecoration(
//                     fillColor: Colors.grey,
//                     border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(6),
//                         borderSide: const BorderSide(
//                           color: Colors.grey,
//                           width: 1,
//                         )),
//                   ),
//                 ),
//                 const Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Text(
//                       "More details",
//                       style: TextStyle(fontSize: 20),
//                     )
//                   ],
//                 ),
//                 TextFormField(
//                   controller: widget.detailsController,
//                   decoration: InputDecoration(
//                     fillColor: Colors.grey,
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(6),
//                       borderSide: const BorderSide(
//                         color: Colors.grey,
//                         width: 1,
//                       ),
//                     ),
//                   ),
//                 ),
//                 const Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Text(
//                       "Rent duration",
//                       style: TextStyle(fontSize: 20),
//                     )
//                   ],
//                 ),
//                 DropdownButtonFormField(
//                   items: const [
//                     DropdownMenuItem(
//                       value: '1',
//                       child: Text('1 Month'),
//                     ),
//                     DropdownMenuItem(
//                       value: '2',
//                       child: Text('2 Months'),
//                     ),
//                     DropdownMenuItem(
//                       value: '3',
//                       child: Text('3 Months'),
//                     ),
//                     DropdownMenuItem(
//                       value: '4',
//                       child: Text('4 Months'),
//                     ),
//                     // Add more options as needed
//                   ],
//                   onChanged: (value) {
//                     // handle onChanged
//                   },
//                   decoration: InputDecoration(
//                     fillColor: Colors.grey,
//                     labelText: 'Type',
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(6),
//                       borderSide: const BorderSide(
//                         color: Colors.grey,
//                         width: 1,
//                       ),
//                     ),
//                   ),
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     ElevatedButton(
//                       onPressed: () {
//                         CollectionReference collRef =
//                             FirebaseFirestore.instance.collection('property');
//                         collRef.add({
//                           'propertyType': type,
//                           'propertyName': widget.propertyController.text,
//                           'price': widget.priceController.text,
//                           'phoneNumber': widget.phoneController.text,
//                           'details': widget.detailsController.text,
//                         });
//                         // Navigator.push(
//                         //     context,
//                         //     MaterialPageRoute(
//                         //       builder: (context) => HomePage(),
//                         //     ),
//                         //     );
//                       },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: const Color.fromRGBO(250, 129, 40, 1),
//                         foregroundColor: Colors.white,
//                       ),
//                       child: const Text('Back'),
//                     ),
//                     ElevatedButton(
//                       onPressed: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => const AddProTwo(),
//                             ));
//                       },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: const Color.fromRGBO(250, 129, 40, 1),
//                         foregroundColor: Colors.white,
//                       ),
//                       child: const Text('Next'),
//                     ),
//                   ],
//                 ),
//               ], 
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
