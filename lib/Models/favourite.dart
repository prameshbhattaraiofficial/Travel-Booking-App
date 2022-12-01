import 'package:flutter/material.dart';

class FavsAttr with ChangeNotifier {
  final String id;
  final String title;
  final double price;
  final String imageUrl;

  // FavsAttr({this.id, this.title, this.price, this.imageUrl});

  FavsAttr({required this.id, required this.imageUrl, required this.price,required this.title});
}