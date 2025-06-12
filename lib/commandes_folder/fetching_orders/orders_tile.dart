import 'package:flutter/material.dart';
import 'orders.dart';

class OrdersTile extends StatelessWidget {
  final Orders orders;

  const OrdersTile({
    super.key,
    required this.orders,
  });

  @override
  Widget build(BuildContext context) {
    // final imagePath = orders.produit.photo;
    // final image = imagePath.contains('https://')
    //     ? NetworkImage(imagePath)
    //     : FileImage(File(imagePath));

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Column(
          children: [
            Card(
              margin: const EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
              child: ListTile(
                // leading: CircleAvatar(
                //   child: Ink.image(
                //     image: image as ImageProvider,
                //     fit: BoxFit.cover,
                //     width: 128,
                //     height: 128,
                //   ),
                //   radius: 25.0,
                //   backgroundColor: eclatColor,
                // ),
                title: const Text(""),
                //title: Text(orders.produit.nameProducts),
                subtitle: Column(
                  children: [
                    // Text('${orders.name}'),
                    Text('Contact: ${orders.identification}'),
                  ],
                ),
              ),
            ),
            Card(
              margin: const EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
              child: ListTile(
                // leading: CircleAvatar(
                //   child: Image.asset(orders.produit.photo),
                //   radius: 25.0,
                //   backgroundColor: eclatColor,
                // ),
                title: const Text(""),
                //title: Text(orders.produit.nameProducts),
                subtitle: Row(
                  children: [
                    Text('${orders.quantity}'),
                    Text('${orders.total} FCFA'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 18),
          ],
        ),
      ),
    );
  }
}
