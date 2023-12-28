import 'package:abdo/show_property.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class EditPage extends StatefulWidget {
  final String? docID;

  const EditPage({super.key, this.docID});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  TextEditingController status = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController details = TextEditingController();
  bool isResd = true;

  void updateData() {
    print('Updated');
    FirebaseFirestore.instance
        .collection(isResd ? 'ResidentialProperty' : 'commercialProperty')
        .doc(widget.docID)
        .update({
      "phoneNumber": phone.text,
      "propertyAdress": address.text,
      "propertyDetails": details.text,
      "propertyPrice": price.text,
      "propertyRentDuration": "Dont hle",
      " propertyStatus": status.text,
      "propertyType": 'Type',
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Data Updated Successfuly'),
        backgroundColor: Colors.green,
      ),
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(
            height: 1.0,
            color: Colors.grey.withOpacity(0.5),
          ),
        ),
        title: const Text('Edit property'),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyEditableDropdownFormField(
                  labelText: 'Type ',
                  fetchDataFromDatabase: () async {
                    return await fetchDataFromDatabase('propertyType');
                  },
                  // ignore: prefer_const_literals_to_create_immutables
                  choices: ['Residential', 'Commercial'],
                ),
                SizedBox(height: 16),
                MyEditableTextField(
                  controller: status,
                  labelText: 'Status',
                  fetchDataFromDatabase: () async {
                    return await fetchDataFromDatabase('propertyStatus');
                  },
                ),
                SizedBox(height: 16),
                MyEditableTextField(
                  controller: address,
                  labelText: 'Address',
                  fetchDataFromDatabase: () async {
                    return await fetchDataFromDatabase('propertyAdress');
                  },
                ),
                SizedBox(height: 16),
                MyEditableTextField(
                  controller: price,
                  labelText: 'Price',
                  isNumeric: true,
                  fetchDataFromDatabase: () async {
                    return await fetchDataFromDatabase('propertyPrice');
                  },
                ),
                SizedBox(height: 16),
                MyEditableTextField(
                  controller: phone,
                  labelText: 'Phone number',
                  fetchDataFromDatabase: () async {
                    return await fetchDataFromDatabase('phoneNumber');
                  },
                ),
                SizedBox(height: 16),
                MyEditableTextField(
                  controller: details,
                  labelText: 'More details',
                  fetchDataFromDatabase: () async {
                    return await fetchDataFromDatabase('propertyDetails');
                  },
                ),
                SizedBox(height: 16),
                MyEditableDropdownFormField(
                  labelText: 'Rent duration',
                  fetchDataFromDatabase: () async {
                    return await fetchDataFromDatabase('propertyRentDuration');
                  },
                  choices: ['1 month', '3 months', '6 months', '1 year'],
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => showProperty(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 255, 152, 0),
                        foregroundColor: Colors.white,
                      ),
                      child: Text('Back'),
                    ),
                    SizedBox(width: 16),
                    ElevatedButton(
                      onPressed: () {
                        updateData();
                        setState(() {});
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 255, 152, 0),
                        foregroundColor: Colors.white,
                      ),
                      child: Text('Save change'),
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

  Future<String> fetchDataFromDatabase(fieldName) async {
    try {
      // Fetch the document from Firestore
      final DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection(isResd ? 'ResidentialProperty' : 'commercialProperty')
          .doc(widget.docID)
          .get();

      // Check if the document exists
      if (documentSnapshot.exists) {
        // Get the data map from the document
        final Map<String, dynamic> data =
            documentSnapshot.data()! as Map<String, dynamic>;

        // Check if the field exists in the data map
        if (data.containsKey(fieldName)) {
          // Retrieve the data for the specified field
          final dynamic fieldValue = data[fieldName];

          // Convert fieldValue to String (or handle accordingly based on its type)
          final String fieldData = fieldValue.toString();

          return fieldData;
        } else {
          return 'Field $fieldName does not exist in the document';
        }
      } else {
        return 'Document with ID ${widget.docID} does not exist';
      }
    } catch (e) {
      // Handle any potential errors during data retrieval
      return 'Error fetching data: $e';
    }
  }
}

class MyEditableTextField extends StatefulWidget {
  final String labelText;
  final bool isNumeric;
  final Future<String> Function() fetchDataFromDatabase;
  TextEditingController controller = TextEditingController();

  MyEditableTextField({
    required this.labelText,
    this.isNumeric = false,
    required this.controller,
    required this.fetchDataFromDatabase,
  });

  @override
  _MyEditableTextFieldState createState() => _MyEditableTextFieldState();
}

class _MyEditableTextFieldState extends State<MyEditableTextField> {
  late Future<String> _dataFromDatabase;

  @override
  void initState() {
    super.initState();
    _dataFromDatabase = widget.fetchDataFromDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.labelText,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        SizedBox(height: 16),
        FutureBuilder<String>(
          future: _dataFromDatabase,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              widget.controller.text = snapshot.data ?? '';
              return TextField(
                controller: widget.controller,
                enabled: true,
                keyboardType: widget.isNumeric ? TextInputType.number : null,
                inputFormatters: widget.isNumeric
                    ? <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly,
                      ]
                    : null,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
              );
            }
          },
        ),
      ],
    );
  }
}

class MyEditableDropdownFormField extends StatefulWidget {
  final String labelText;
  final Future<String> Function() fetchDataFromDatabase;
  final List<String> choices;

  MyEditableDropdownFormField({
    required this.labelText,
    required this.fetchDataFromDatabase,
    required this.choices,
  });

  @override
  _MyEditableDropdownFormFieldState createState() =>
      _MyEditableDropdownFormFieldState();
}

class _MyEditableDropdownFormFieldState
    extends State<MyEditableDropdownFormField> {
  String? _selectedValue;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  _loadData() async {
    final String data = await widget.fetchDataFromDatabase();
    setState(() {
      _selectedValue = widget.choices.contains(data)
          ? data
          : (widget.choices.isNotEmpty ? widget.choices[0] : null);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.labelText,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        SizedBox(height: 16),
        DropdownButtonFormField<String>(
          value: _selectedValue,
          items: widget.choices.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              _selectedValue = newValue;
            });
          },
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[200],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.grey),
            ),
          ),
        ),
      ],
    );
  }
}
