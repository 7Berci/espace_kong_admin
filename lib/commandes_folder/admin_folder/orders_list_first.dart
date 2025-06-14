// ignore_for_file: depend_on_referenced_packages
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:espace_kong_admin/auth_folder/function.dart';
import 'package:espace_kong_admin/auth_folder/utils.dart';
import 'package:espace_kong_admin/commandes_folder/cart_folder/database.dart';
import 'package:espace_kong_admin/home_folder/home.dart';
import 'package:flutter/material.dart';

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            StreamBuilder<QuerySnapshot>(
              stream: _streamShoppingItems,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasError) {
                  return Center(child: Text(snapshot.error.toString()));
                }
        
                if (snapshot.connectionState == ConnectionState.active) {
                  QuerySnapshot querySnapshot = snapshot.data;
                  List<QueryDocumentSnapshot> listQueryDocumentSnapshot =
                      querySnapshot.docs;
        
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: listQueryDocumentSnapshot.length,
                    itemBuilder: (context, index) {
                      QueryDocumentSnapshot document =
                          listQueryDocumentSnapshot[index];
                      DocumentReference documentReference = document.reference;
                      // FirebaseFirestore.instance.collection('orders').doc(
                      //     " - ${document["Quantité commandée"]} ${document["Nom de l'artcile"]}");
                      return Column(
                        children: [
                          Card(
                            margin: const EdgeInsets.fromLTRB(
                              5.0,
                              15.0,
                              5.0,
                              1.0,
                            ),
                            child: Column(
                              children: [
                                ListTile(
                                  title: Text('No: $index'),
                                  subtitle: Column(children: [
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
                                            fontSize: 16.0,
                                          ),
                                        ),
                                        Text(
                                          'Coût: ${document["Coût unitaire"]}',
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 16.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              const SizedBox(width: 10.0),
                              const Text('Supprimer la commande'),
                              IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () {
                                  documentReference.delete();
                                },
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  );
                }
        
                return const Center(child: CircularProgressIndicator());
              },
            ),
            StreamBuilder<QuerySnapshot>(
              stream:
                  FirebaseFirestore.instance
                      .collection('orders_total')
                      .snapshots(),
              builder: (
                BuildContext context,
                AsyncSnapshot<QuerySnapshot> snapshot,
              ) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
        
                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return Center(
                    child: Text('No total orders found in orders_total.'),
                  );
                }
        
                // Access the documents in the orders_total collection
                final ordersTotal = snapshot.data!.docs;
        
                return ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: ordersTotal.length,
                  itemBuilder: (context, index) {
                    final document = ordersTotal[index];
                    return Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          const SizedBox(height: 10.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              const Text(
                                "Nombre d'articles",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                ),
                              ),
                              Text(
                                // "${controller.globalsom} FCFA",
                                "${document["nbrArticles"]}",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              const Text(
                                "Total",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                ),
                              ),
                              Text(
                                // "${controller.globalsom} FCFA",
                                "${document["totalSimple"]}",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              const Text(
                                "Frais de livraison",
                                style: TextStyle(fontSize: 18.0),
                              ),
                              Text(
                                "${document["fraisLivraison"]}",
                                style: const TextStyle(fontSize: 18.0),
                              ),
                            ],
                          ),
                          const Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              const Text(
                                "Total + livraison",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 19.0,
                                ),
                              ),
                              Text(
                                "${document["totalWithLivraison"]}",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 19.0,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              const Text(
                                "Remise +10 articles",
                                style: TextStyle(fontSize: 19.0),
                              ),
                              Text(
                                "${document["remiseTen"]}",
                                style: const TextStyle(fontSize: 19.0),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              const Text(
                                "Remise +20 articles",
                                style: TextStyle(fontSize: 19.0),
                              ),
                              Text(
                                "${document["remiseTwenty"]}",
                                style: const TextStyle(fontSize: 19.0),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4.0),
                          // Champ de remise manuelle
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Remise manuelle",
                                style: TextStyle(fontSize: 19.0),
                              ),
                              Text(
                                "${document["remiseManuelle"]}",
                                style: const TextStyle(fontSize: 19.0),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Total avec remise",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 21.0,
                                ),
                              ),
                              Text(
                                "${document["totalAvecRemise"]}",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 21.0,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
