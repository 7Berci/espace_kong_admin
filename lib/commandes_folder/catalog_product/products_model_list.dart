import 'package:espace_kong_admin/home_folder/home.dart';
import 'package:flutter/material.dart';

class Product {
  final String id;
  final String cat;
  final String nameproduct;
  final double price;
  final String photo;
  final String type;
  final String description;

  Product({
    required this.photo,
    required this.nameproduct,
    required this.price,
    required this.id,
    required this.cat,
    required this.type,
    this.description = '',
  });

  factory Product.fromFirestore(Map<String, dynamic> data) {
    return Product(
      id: data['id'] ?? '',
      cat: data['cat'] ?? '',
      type: data['type'] ?? '',
      photo: data['photo'] ?? '',
      nameproduct: data['nameproduct'] ?? '',
      price: (data['price'] is int) ? (data['price'] as int).toDouble() : (data['price'] ?? 0.0),
      description: data['description'],
    );
  }
  
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Product &&
          runtimeType == other.runtimeType &&
          id == other.id; 

  @override
  int get hashCode => id.hashCode; 
}

Widget cartItem(
  String photo,
  String nameproduct,
  double price,
  int counter,
  void index1,
  void index2,
) {
  return Container(
    color: Colors.white,
    child: Padding(
      padding: const EdgeInsets.fromLTRB(3.0, 8.0, 8.0, 15.0),
      child: Row(children: <Widget>[
        const SizedBox(width: 12.0),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
          child: Container(
            width: 80.0,
            height: 80.0,
            decoration: BoxDecoration(
              color: eclatColor,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Center(
              child: Container(
                width: 60.0,
                height: 60.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.scaleDown,
                    image: AssetImage(photo),
                  ),
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 9.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // ignore: sized_box_for_whitespace
              Container(
                width: 200.0,
                child: Text(
                  nameproduct,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              Row(
                children: [
                  Container(
                    width: 23.0,
                    height: 23.0,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.remove,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        index1;
                      },
                      iconSize: 15.0,
                      padding: const EdgeInsets.all(0.0),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      "$counter",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                  Container(
                    width: 23.0,
                    height: 23.0,
                    decoration: BoxDecoration(
                      color: Colors.blue[300],
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.add,
                        size: 15.0,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        index2;
                      },
                      padding: const EdgeInsets.all(0.0),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    '$price FCFA',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  const SizedBox(width: 12.0),
                ],
              ),
            ],
          ),
        ),
      ]),
    ),
  );
}