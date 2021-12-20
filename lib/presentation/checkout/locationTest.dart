import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:landryproject/controllers/ckeckoutController.dart';
import 'package:landryproject/presentation/checkout/SummaryScreen.dart';
import 'package:location/location.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckoutController>(
      init: Get.put(CheckoutController()),
      builder:(controller)=> Scaffold(
        body: SingleChildScrollView(


          child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Text("Billing adress is the same as delivary adress "),

                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "La Marsa, Av 14 Janvier",
                        labelText: "Adresse",
                      ),
                      onSaved: (value){
                        print(value);
                        controller.adresse=value!;
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20.0,),
                    Text("send your Current location "),
                    SizedBox(height: 20.0,),


                    ElevatedButton(
                      child: Icon(Icons.location_on_outlined),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.blueAccent,
                            fixedSize: const Size(300, 50),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50))),
                        onPressed: () async{
                          Location location = new Location();

                          bool _serviceEnabled;
                          PermissionStatus _permissionGranted;
                          LocationData _locationData;

                          _serviceEnabled = await location.serviceEnabled();
                          if (!_serviceEnabled) {
                            _serviceEnabled = await location.requestService();
                            if (!_serviceEnabled) {
                              return;
                            }
                          }

                          _permissionGranted = await location.hasPermission();
                          if (_permissionGranted == PermissionStatus.denied) {
                            _permissionGranted = await location.requestPermission();
                            if (_permissionGranted != PermissionStatus.granted) {
                              return;
                            }
                          }

                          _locationData = await location.getLocation();
                          print(_locationData.longitude);
                          print(_locationData.latitude);
                          controller.latitude = _locationData.latitude.toString();
                          controller.longitude = _locationData.longitude.toString();

                        }),
                    ElevatedButton(
                      onPressed: () {
                        // Validate returns true if the form is valid, or false otherwise.
                        if (_formKey.currentState!.validate()) {
                          // If the form is valid, display a snackbar. In the real world,
                          // you'd often call a server or save the information in a database.

                          _formKey.currentState!.save();

                          Get.to(SummaryScreen());

                      }
                      },
                      child: const Text('Next'),
                    ),

                  ],
                ),
              ),
            ),
          ),
      ),
    );

  }
}
