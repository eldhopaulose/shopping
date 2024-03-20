import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping/app/modules/cart/views/cart_view.dart';
import 'package:shopping/app/modules/favorite/views/favorite_view.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(ProfileController());
    controller.onInit();
    controller.getAdress();
    return Scaffold(
      //backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Center(
          child: Text(
            'My Profile',
            style: GoogleFonts.grenze(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              // You can set the color of the text
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(width: 20),
                FutureBuilder(
                  future: controller.featchName(),
                  builder: (context, snapshot) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          snapshot.data!.name!,
                          style: GoogleFonts.lindenHill(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.green),
                        ),
                        Text(
                          snapshot.data!.email!,
                          style: GoogleFonts.lindenHill(
                              fontSize: 16, color: Colors.black87),
                        ),
                      ],
                    );
                  },
                )
              ],
            ),
            SizedBox(height: 20),
            ListTile(
              leading: Icon(Icons.shopping_cart_checkout),
              title: Text('My Cart',
                  style: GoogleFonts.istokWeb(
                      fontSize: 18, fontWeight: FontWeight.w800)),
              onTap: () {
                Get.to(() => CartView());
              }, // Implement navigation
            ),
            ListTile(
              leading: Icon(Icons.favorite),
              title: Text('My Wishlist',
                  style: GoogleFonts.istokWeb(
                      fontSize: 18, fontWeight: FontWeight.w800)),
              onTap: () {
                Get.to(() => FavoriteView());
              }, // Implement navigation
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Shipping Address',
                  style: GoogleFonts.istokWeb(
                      fontSize: 18, fontWeight: FontWeight.w800)),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Shipping Address',
                          style: GoogleFonts.istokWeb(
                              fontSize: 18, fontWeight: FontWeight.w800)),
                      content: SingleChildScrollView(
                        child: ListBody(
                          children: <Widget>[
                            TextFormField(
                              controller: controller.nameController,
                              decoration: InputDecoration(
                                labelText: 'Name',
                              ),
                            ),
                            TextFormField(
                              controller: controller.addressController,
                              decoration: InputDecoration(
                                labelText: 'Address',
                              ),
                            ),
                            TextFormField(
                              controller: controller.mobileController,
                              decoration: InputDecoration(
                                labelText: 'Mobile Number',
                              ),
                            ),
                            TextFormField(
                              controller: controller.pincodeController,
                              decoration: InputDecoration(
                                labelText: 'Pin Code',
                              ),
                            ),
                            TextFormField(
                              controller: controller.districtController,
                              decoration: InputDecoration(
                                labelText: 'District',
                              ),
                            ),
                            TextFormField(
                              controller: controller.stateController,
                              decoration: InputDecoration(
                                labelText: 'State',
                              ),
                            ),
                            TextFormField(
                              controller: controller.countryController,
                              decoration: InputDecoration(
                                labelText: 'Country',
                              ),
                            ),
                          ],
                        ),
                      ),
                      actions: <Widget>[
                        TextButton(
                          child: Text(
                            'Featch Adress',
                            style: GoogleFonts.grenze(color: Colors.green),
                          ),
                          onPressed: () {
                            controller.getAdress();
                            controller.getAdress();

                            controller.onInit();

                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: Text('Submit',
                              style: GoogleFonts.grenze(
                                  fontSize: 18, color: Colors.green)),
                          onPressed: () {
                            controller.onAdressClick();
                            controller.getAdress();
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: Text('Update',
                              style: GoogleFonts.grenze(color: Colors.green)),
                          onPressed: () {
                            controller.onClickUpdateAdress(
                                controller.adrressId.value);
                            controller.getAdress();
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              }, // Implement navigation
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text('Help',
                  style: GoogleFonts.istokWeb(
                      fontSize: 18, fontWeight: FontWeight.bold)),
              onTap: () {}, // Implement navigation
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings',
                  style: GoogleFonts.istokWeb(
                      fontSize: 18, fontWeight: FontWeight.bold)),
              onTap: () {}, // Implement navigation
            ),
            StreamBuilder(
              stream: controller.fetchAdress,
              builder: (context, snapshot) {
                if (snapshot.hasData && snapshot.data!.address!.isNotEmpty) {
                  controller.name.value = snapshot.data!.address!.first.name!;
                  controller.mobile.value =
                      snapshot.data!.address!.first.mobileNumber!;
                  controller.address.value =
                      snapshot.data!.address!.first.address!;
                  controller.district.value =
                      snapshot.data!.address!.first.district!;
                  controller.state.value = snapshot.data!.address!.first.state!;
                  controller.pincode.value =
                      snapshot.data!.address!.first.pinCode!;
                  controller.country.value =
                      snapshot.data!.address!.first.country!;
                  controller.adrressId.value =
                      snapshot.data!.address!.first.sId!;
                  controller.onReady();

                  return Visibility(
                    child: Obx(() => Column(
                          children: [
                            Text('Name: ${controller.name.value}'),
                            Text('Mobile: ${controller.mobile.value}'),
                            Text('Address: ${controller.address.value}'),
                            Text('District: ${controller.district.value}'),
                            Text('State: ${controller.state.value}'),
                            Text('Pincode: ${controller.pincode.value}'),
                            Text('Country: ${controller.country.value}'),
                          ],
                        )),
                    visible: false,
                  );
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else {
                  return Text('No Adress added');
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
