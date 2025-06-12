// ignore_for_file: depend_on_referenced_packages
import 'package:espace_kong_admin/auth_folder/function.dart';
import 'package:espace_kong_admin/auth_folder/utils.dart';
import 'package:espace_kong_admin/commandes_folder/cart_folder/database.dart';
import 'package:espace_kong_admin/home_folder/home.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class OrdersListFirst extends StatefulWidget {
  const OrdersListFirst({super.key});

  @override
  State<OrdersListFirst> createState() => _OrdersListFirstState();
}

class _OrdersListFirstState extends State<OrdersListFirst> {
  late Stream<QuerySnapshot> _streamShoppingItems;
  final Utils utilsWidget = Utils();

  @override
  void initState() {
    _streamShoppingItems =
        DatabaseService(uid: user?.uid).ordersCollection.snapshots();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //try {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: eclatColor,
        title: const Center(child: Text('Les articles de la commande :')),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: _streamShoppingItems,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            }

            if (snapshot.connectionState == ConnectionState.active) {
              QuerySnapshot querySnapshot = snapshot.data;
              List<QueryDocumentSnapshot> listQueryDocumentSnapshot =
                  querySnapshot.docs;

              return ListView.builder(
                  itemCount: listQueryDocumentSnapshot.length,
                  itemBuilder: (context, index) {
                    QueryDocumentSnapshot document =
                        listQueryDocumentSnapshot[index];
                    DocumentReference documentReference = document.reference;
                        // FirebaseFirestore.instance.collection('orders').doc(
                        //     " - ${document["Quantité commandée"]} ${document["Nom de l'artcile"]}");
                    return Column(children: [
                      Card(
                          margin:
                              const EdgeInsets.fromLTRB(5.0, 15.0, 5.0, 1.0),
                          child: Column(
                            children: [
                              ListTile(
                                title: Text('No: $index'),
                                subtitle: Column(
                                  children: [
                                  ],
                                ),
                              ),
                              Center(
                                child: ListTile(
                                  leading: CircleAvatar(
                                    radius: 25.0,
                                    backgroundColor: eclatColor,
                                    child: Image.asset(document["photoPath"]),
                                  ),
                                  title: Text(document["Nom de l'artcile"]),
                                  subtitle: Column(
                                    children: [
                                      Text(
                                          'Qté: ${document["Quantité commandée"]}',
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 16.0)),
                                      Text('Coût: ${document["Coût unitaire"]}',
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 16.0)),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )),
                      Row(
                        children: [
                          const SizedBox(
                            width: 10.0,
                          ),
                          const Text('Supprimer la commande'),
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              documentReference.delete();
                            },
                          )
                        ],
                      ),
                    ]);
                  });
            }

            return const Center(child: CircularProgressIndicator());
          }),
    );
  }
}
