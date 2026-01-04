  
import 'package:flutter/material.dart';
import 'package:sixers/theme/colors.dart';

const availableAvatars = ['alpaca', 'audobon', 'bear', 'boar', 'bull', 'cheetah', 'giraffe', 'lion', 'mammoth', 'wolf'];

String stringToAvatar(String? str) {
  if(availableAvatars.contains(str)) {
    return "assets/images/mascots/$str.png";
  }
  return "assets/monochrome_app_icon.png";
}


const avatarColors = {
  'red': AppColors.red100,
  'orange': AppColors.orange600,
  'yellow': AppColors.yellow300,
  'lime': AppColors.lime200,
  'green': AppColors.green300,
  'aqua': AppColors.aqua600,
  'cyan': AppColors.cyan200,
  'blue': AppColors.blue200,
  'purple': AppColors.purple200,
  'pink': AppColors.pink600,
  'darkPink': AppColors.pink500
};

Color stringToColor(String? str) {
  if(avatarColors.containsKey(str)) {
    return avatarColors[str]!;
  }
  return AppColors.black400;
}