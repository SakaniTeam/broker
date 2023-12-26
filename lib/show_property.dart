import 'package:abdo/home_page.dart';
import 'package:abdo/update_page.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';

class showProperty extends StatefulWidget {
  @override
  State<showProperty> createState() => _showPropertyState();
}

class _showPropertyState extends State<showProperty> {
  List comerrical = [];
  List resdintial = [];
  bool isloading = false;
  bool isResd = true;
  @override
  void initState() {
    getCommercial();
    getResidential();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                setState(() {});
                print('refresh');
              },
              icon: Icon(Icons.refresh))
        ],
        shape: UnderlineInputBorder(borderSide: BorderSide(width: 2)),
        title: Text(
          'Show Property',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
        ),
        centerTitle: true,
      ),
      body: isloading == false
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    alignment: Alignment.center,
                    child: Text(
                      'Show Result',
                      style:
                          TextStyle(fontSize: 25, fontStyle: FontStyle.italic),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: isResd ? resdintial.length : comerrical.length,
                      itemBuilder: (context, index) {
                        return Container(
                          child: Stack(
                            children: [
                              Card(
                                color: Colors.orangeAccent,
                                child: ListTile(
                                  onLongPress: () {
                                    AwesomeDialog(
                                      context: context,
                                      dialogType: DialogType.warning,
                                      animType: AnimType.rightSlide,
                                      title: 'Warning',
                                      desc:
                                          'Are you sure you want to delete this',
                                      btnCancelOnPress: () {
                                        print("cancel");
                                      },
                                      btnOkOnPress: () async {
                                        print("ok");
                                        //   Navigator.pop(context);
                                        await isResd
                                            ? deleteResidintial(
                                                "${resdintial[index]['documentId']}",
                                                index)
                                            : deleteCommercial(
                                                "${comerrical[index]['documentId']}",
                                                index);
                                        setState(() {});
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  showProperty(),
                                            ));
                                      },
                                    )..show();
                                  },
                                  leading: Image.network(isResd
                                      ? '${resdintial[index]['image']}'
                                      : '${comerrical[index]['image']}'),
                                  ///////////////////////////////////////
                                  title: Text(isResd
                                      ? '${resdintial[index]['propertyType']}'
                                      : '${comerrical[index]['propertyType']}'),
                                  subtitle: Text(
                                    isResd
                                        ? '${resdintial[index]['propertyStatus']} \n ${resdintial[index]['propertyAdress']} \n ${resdintial[index]['propertyDetails']} \n${resdintial[index]['propertyRentDuration']}'
                                        : '${comerrical[index]['propertyStatus']} \n ${comerrical[index]['propertyAdress']} \n ${comerrical[index]['propertyDetails']} \n ${comerrical[index]['propertyRentDuration']}',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 10,
                                bottom: 10,
                                child: Row(
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => editpage(
                                                    docID: isResd
                                                        ? "${resdintial[index]['documentId']}"
                                                        : "${comerrical[index]['documentId']}"),
                                              ));
                                        },
                                        icon: Icon(
                                          Icons.edit,
                                          size: 30,
                                        )),
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.expand_circle_down,
                                        size: 30,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          color: Colors.orangeAccent,
                          onPressed: () {
                            isResd = false;
                            getCommercial();
                            comerrical.clear();

                            setState(() {});
                          },
                          child: Text('Commercial'),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          color: Colors.orangeAccent,
                          onPressed: () {
                            isResd = true;
                            getResidential();
                            resdintial.clear();
                            setState(() {});
                          },
                          child: Text('Residential'),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      color: Colors.orangeAccent,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomePage(),
                            ));
                      },
                      child: Text('Back'),
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  void getCommercial() async {
    CollectionReference tblProduct =
        FirebaseFirestore.instance.collection('commercialProperty');
    await tblProduct.get().then((querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        Map<String, dynamic> store = doc.data() as Map<String, dynamic>;
        store['documentId'] = doc.id;

        comerrical.add(store);
      });
    });
    setState(() {});
  }

  void getResidential() async {
    CollectionReference tblProduct =
        FirebaseFirestore.instance.collection('ResidentialProperty');

    try {
      QuerySnapshot querySnapshot = await tblProduct
          .where("id", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .get();

      querySnapshot.docs.forEach((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        data['documentId'] = doc.id;
        resdintial.add(data);
        print(data);
      });
      isloading = true;
      setState(() {});
    } catch (e) {
      print("Error retrieving residential data: $e");
    }
  }

  void deleteResidintial(String docID, int index) {
    FirebaseFirestore.instance
        .collection('ResidentialProperty')
        .doc(docID)
        .delete();
    resdintial.removeAt(index);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Deleted Successfuly'),
      backgroundColor: Colors.green,
    ));
    setState(() {});
  }

  void deleteCommercial(String docID, int index) {
    FirebaseFirestore.instance
        .collection('commercialProperty')
        .doc(docID)
        .delete();
    comerrical.removeAt(index);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Deleted Successfuly'),
      backgroundColor: Colors.green,
    ));
    isloading = true;
    setState(() {});
  }
}
