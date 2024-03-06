//import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:shopping/app/data/colors.dart';

class Categories extends StatelessWidget {
  //const Categories({super.key});
  final String categoryName;

  const Categories({Key? key, required this.categoryName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: Container(
        width: 100,
                          decoration: BoxDecoration(
                            color:AppColor.blue,
                          //color: Color.fromARGB(255, 187, 208, 228),
                          borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: GestureDetector(
                          onTap: () {
                          // Handle button tap
                         },
                         child: Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: Center(
                           child: Text(
                           categoryName,
                           style: TextStyle(
                            color: Colors.grey[600]),
                           ),
                         ),
                    ),
                  ),
               ),
    );

  }
}