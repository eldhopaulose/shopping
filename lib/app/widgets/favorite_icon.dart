import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping/app/modules/home/controllers/home_controller.dart';

class FavoriteIcon extends StatelessWidget {
final int id;

  const FavoriteIcon({
    Key? key, required this.id,
  
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        print(id);
        return  Obx(() {
      final isFavorite = controller.isFavorite(id);
      return SizedBox(
        height: 40,
        child: IconButton(
          icon: Icon(
            isFavorite ? Icons.favorite : Icons.favorite_border,
            color: Colors.yellow, 
            
          ),
          onPressed: () {
            controller.toggleFavorite(id);
          },
        ),
      );
    });
  });
  }
}

