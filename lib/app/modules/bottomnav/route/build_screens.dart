import 'package:flutter/material.dart';
import 'package:shopping/app/modules/cart/views/cart_view.dart';
import 'package:shopping/app/modules/favorite/views/favorite_view.dart';
import 'package:shopping/app/modules/home/views/home_view.dart';
import 'package:shopping/app/modules/profile/views/profile_view.dart';

List<Widget> buildScreens() {
        return [
          const HomeView(),
          const FavoriteView(),
          const CartView(),
          const ProfileView()
        ];
    }