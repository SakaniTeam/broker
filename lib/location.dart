// import 'dart:async';
// import 'dart:io';
// //import 'package:abdo/commercial_page.dart';
// import 'package:abdo/home_page.dart';
// import 'package:abdo/resdintiall_page.dart';
// import 'package:abdo/show_property.dart';
// import 'package:awesome_dialog/awesome_dialog.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:path/path.dart';
// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:image_picker/image_picker.dart';

// void main() => runApp(MaterialApp(home: location()));

// class location extends StatefulWidget {
//   const location({super.key});
//   @override
//   State<location> createState() => _locationState();
// }

// class _locationState extends State<location> {


// getpermission(BuildContext context) async {
//   LocationPermission premission;
//   premission = await Geolocator.requestPermission();
//   if (premission == LocationPermission.denied) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Error'),
//           content: Text('Please open the Location'),
//           actions: [
//             TextButton(
//               onPressed: () async {
//                 premission = await Geolocator.requestPermission();
//                 Navigator.of(context).pop();
//               },
//               child: Text('Ok'),
//             ),
//             TextButton(
//               onPressed: () {
//                 Geolocator.openLocationSettings();
//                 Navigator.of(context).pop();
//               },
//               child: Text('Cancel'),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }


//   @override
//   void initState() {
//     super.initState();
//     getpermission(context);
//   }



//   List<Marker> markers = [];
//   LatLng? loc;
//   String? image;
//   Future<Position>? currentposition;

//   GoogleMapController? controllerMap;
//   CameraPosition currentCamera =
//       CameraPosition(target: LatLng(27.181935, 31.186007), zoom: 15);
//   bool isloading = false;



  
// /////////////////////////////
  
//   //----------------------------Methods-------------------------------------

//   void getcurrentlocation() async {
//     isloading = true;
//     setState(() {});
//     currentposition = await Geolocator.getCurrentPosition().then((value) {
//       markers.add(Marker(
//           markerId: MarkerId('1'),
//           position: loc = LatLng(value.latitude, value.longitude)));
//     });
//     controllerMap!.moveCamera(CameraUpdate.newLatLng(loc!));
//     isloading = false;
//     setState(() {});
//   }

//   //--------------------Page Content---------------------------------

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//             title: Center(
//                 child: Text(
//               "property",
//               style: TextStyle(fontSize: 30),
//             )),
//             backgroundColor: Colors.orangeAccent),
//         body: isloading
//             ? Center(
//                 child: CircularProgressIndicator(),
//               )
//             : SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     SizedBox(height: 20),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 35),
//                       child: Container(
//                         padding: EdgeInsets.all(35),
//                         decoration: BoxDecoration(
//                           border: Border.all(color: Colors.black12),
//                           borderRadius: BorderRadius.circular(2),
//                           color: Colors.black12,
//                         ),
//                         child: Column(
//                           children: [
//                             IconButton(
//                                 onPressed: () async {
//                                   image = await getImage();
//                                   //   FilePickerResult? image =
//                                   //       await FilePicker.platform.pickFiles();
//                                   //   await FilePicker.platform.pickFiles();
//                                   //   if (image != null) {
//                                   //     File file = File(image!.files.single.path!);
//                                   //   } else {
//                                   //     ScaffoldMessenger.of(context).showSnackBar(
//                                   //         SnackBar(
//                                   //             backgroundColor: Colors.red,
//                                   //             content:
//                                   //                 Text('Please Choose File')));
//                                   //    }
//                                 },
//                                 icon: Icon(
//                                   Icons.add_a_photo_outlined,
//                                   size: 50,
//                                 )),
//                             SizedBox(
//                               height: 23,
//                             ),

//                             Center(
//                               child: Container(
//                                 padding: EdgeInsets.all(1),
//                                 decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(3),
//                                     color: Colors.black12),
//                                 child: Text(
//                                   "Upload Photo",
//                                   style: TextStyle(
//                                       fontSize: 20,
//                                       color: Colors.black,
//                                       fontWeight: FontWeight.w500),
//                                 ),
//                               ),
//                             ),
//                             /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                           ],
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 100,
//                     ),
//                     Padding(
//                       padding: EdgeInsets.all(30),
//                       child: Container(
//                         height: 200,
//                         child: Stack(
//                           alignment: Alignment.bottomCenter,
//                           children: [
//                             GoogleMap(
//                               onTap: (LatLng latlang) {
//                                 markers.add(Marker(
//                                     icon: BitmapDescriptor.defaultMarker,
//                                     markerId: MarkerId("1"),
//                                     position: loc = LatLng(
//                                         latlang.latitude, latlang.longitude)));
//                                 setState(() {});
//                               },
//                               mapType: MapType.normal,
//                               markers: markers.toSet(),
//                               initialCameraPosition: currentCamera,
//                               onMapCreated: (GoogleMapController hello) {
//                                 controllerMap = hello;
//                               },
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     ElevatedButton(
//                       onPressed: () async {
//                         getcurrentlocation();
//                       },
//                       child: Row(
//                         children: [
//                           Icon(
//                             Icons.location_on_outlined,
//                             color: Colors.black45,
//                           ),
//                           SizedBox(width: 50),
//                           Text(
//                             'Choose the location',
//                             style: TextStyle(fontSize: 15, color: Colors.black),
//                           ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     ElevatedButton(
//                         onPressed: () async {
//                           try {
//                             if (isResd == true) {
//                               CollectionReference collRef = FirebaseFirestore
//                                   .instance
//                                   .collection('commercialProperty');
//                               await collRef.add({
//                                 "id": FirebaseAuth.instance.currentUser!.uid,
//                                 'propertyType': type,
//                                 'propertyStatus': status,
//                                 'propertyAdress': propertyAdressController.text,
//                                 'propertyPrice': priceController.text,
//                                 'phoneNumber': phoneController.text,
//                                 'propertyDetails': detailsController.text,
//                                 'propertyRentDuration': rentduration,
//                                 'image': image,
//                               });
//                             } else {
//                               CollectionReference collRef = FirebaseFirestore
//                                   .instance
//                                   .collection('ResidentialProperty');
//                               await collRef.add({
//                                 "id": FirebaseAuth.instance.currentUser!.uid,
//                                 'propertyType': type,
//                                 'propertyStatus': status,
//                                 'propertyAdress': propertyAdressController.text,
//                                 'propertyPrice': priceController.text,
//                                 'phoneNumber': phoneController.text,
//                                 'propertyDetails': detailsController.text,
//                                 'propertyRentDuration': rentduration,
//                                 'image': image,
//                               });
//                             }
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => HomePage(),
//                                 ));
//                             ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                                 backgroundColor: Colors.green,
//                                 content: Text('Data Added Successfuly')));
//                             // Add any further navigation logic or success messages here
//                           } catch (e) {
//                             print('Error adding data to Firestore: $e');
//                             // Handle the error (e.g., show an error message)
//                           }
//                         },
//                         child: Text("Add Property"))
//                   ],
//                 ),
//               ));
//   }
// }

// Future<String> getImage() async {
//   String imgUrl;
//   File? file;
//   final ImagePicker picker = ImagePicker();
//   final XFile? image = await picker.pickImage(source: ImageSource.gallery);
//   if (image != null) file = File(image.path);

//   var imagename = basename(image!.path);

//   var refStorage = FirebaseStorage.instance.ref('images');
//   await refStorage.putFile(file!);
//   imgUrl = await refStorage.getDownloadURL();

//   return imgUrl;
// }
