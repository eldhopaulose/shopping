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
        return  Obx(() {
      final isFavorite = controller.isFavorite(id);
      return IconButton(
        icon: Icon(
          isFavorite ? Icons.favorite : Icons.favorite_border,
          color: Colors.red,
        ),
        onPressed: () {
          controller.toggleFavorite(id);
        },
      );
    });
  });
  }
}



// import 'package:flutter/material.dart';

// class FavoriteIcon extends StatefulWidget {
//   final bool isFavorite;
//   final Function(bool)? onFavoriteChanged;

//   const FavoriteIcon({
//     Key? key,
//     required this.isFavorite,
//     this.onFavoriteChanged,
//   }) : super(key: key);

//   @override
//   _FavoriteIconState createState() => _FavoriteIconState();
// }

// class _FavoriteIconState extends State<FavoriteIcon> {
//   late bool _isFavorite;

//   @override
//   void initState() {
//     super.initState();
//     _isFavorite = widget.isFavorite;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         setState(() {
//           _isFavorite = !_isFavorite;
//           if (widget.onFavoriteChanged != null) {
//             widget.onFavoriteChanged!(_isFavorite);
//           }
//         });
//       },
//       child: Icon(
//         _isFavorite ? Icons.favorite : Icons.favorite_border,
//         color: _isFavorite ? Colors.red : Colors.grey,
//       ),
//     );
//   }
// }
