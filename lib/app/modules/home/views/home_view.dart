import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping/app/widgets/categories.dart';
import 'package:shopping/app/widgets/product_card.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width > 1200
                ? MediaQuery.of(context).size.width * 0.3
                : double.infinity,
            height: MediaQuery.of(context).size.height,
            child: Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Container(
                        height: 60,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Hello Ashwini',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            Text(
                              "Let's get something...!",
                              style: GoogleFonts.lobster(
                                fontSize: 15,
                                color: Color.fromARGB(255, 107, 113, 119),
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 150, // Set the height of the container
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.6,
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color.fromARGB(255, 247, 100, 2),
                              ),
                              child: Text(
                                "30% OFF DURING \nRamadan",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ),
                        
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                             
                              width: MediaQuery.of(context).size.width * 0.7,
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.blue,
                              ),
                              child: Text(
                                "50% OFF DURING \nVishu",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Top categories",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              // Handle your onTap here.
                            },
                            child: Text(
                                     "SEE ALL",
                                      style: TextStyle(
                                        color: Colors.green),
                                      ),
                          ),
                        ],
                      ),
                    ),
             SizedBox(
            
              height: 35,
               child: Padding(
                 padding: const EdgeInsets.only(left: 20),
                 child: ListView(
                    scrollDirection: Axis.horizontal,
                    
                    children: [
                      Categories(categoryName: 'All'),
                      Categories(categoryName: 'Mobile'),
                      Categories(categoryName: 'Tv'),
                      Categories(categoryName: 'Tab'),
                      Categories(categoryName: 'Watch'),
                      Categories(categoryName: 'Laptop'),
                    ],
                 ),
               ),
             ),    

                    SizedBox(height: 10),

                    Padding(
                      padding: EdgeInsets.only(
                          bottom: 90, left: 10, right: 10),
                      child: GridView.count(
                        scrollDirection: Axis.vertical,
                        crossAxisCount: 2,
                        crossAxisSpacing: 5.0,
                        mainAxisSpacing: 5.0,
                        shrinkWrap: true,
                        childAspectRatio:
                            MediaQuery.of(context).size.width < 600 ? 0.57 : 1,
                        physics: NeverScrollableScrollPhysics(),
                        children: List.generate(20, (index) {
                          return ProductCard(
                            Id: index,
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
