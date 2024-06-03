import 'package:YumFind/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AppImages {
  static const String splash = 'assets/images/splash.png';
  static const String auth = 'assets/images/auth.png';
  static const String authVector = 'assets/images/auth_vector.png';
  static const String icFriends = 'assets/icons/ic_friends.png';
  static const String icSport = 'assets/icons/ic_sport.png';
  static const String icFamily = 'assets/icons/ic_family.png';
  static const String icMovie = 'assets/icons/ic_movie.png';
  static const String icHealth = 'assets/icons/ic_health.png';
  static const String icWork = 'assets/icons/ic_work.png';
  static const String icMusic = 'assets/icons/ic_music.png';
  static const String icLove = 'assets/icons/ic_love.png';
  static const String settings = 'assets/images/settings.png';
  static const String noRoom = 'assets/images/no_rooms.png';
  static const String calories = 'assets/images/cal.png';
  static const String share = 'assets/images/share_fill.png';
  static const String onboarding1 = 'assets/images/onBoarding1.png';
  static const String onboarding2 = 'assets/images/onBoarding2.png';
  static const String onboarding3 = 'assets/images/onBoarding3.png';
  static const String shoppingEmpty = 'assets/images/empty_shopping.png';
  static const String savedEmpty = 'assets/images/empty_saved.png';
  static const List<String> quickSearchImages = [
    'assets/images/pasta.png',
    'assets/images/chicken.png',
    'assets/images/meat.png',
    'assets/images/seafood.png',
    'assets/images/pizza.png',
    'assets/images/dessert.png',
  ];
  static const List<Widget> icons = [
     ImageIcon(AssetImage('assets/images/kcal.png'),color: AppColor.primaryColor,),
     ImageIcon(AssetImage('assets/images/protein.png'),color: AppColor.primaryColor,),
     ImageIcon(AssetImage('assets/images/fat.png'),color: AppColor.primaryColor,),
     ImageIcon(AssetImage('assets/images/carb.png'),color: AppColor.primaryColor,),
  ];
}
