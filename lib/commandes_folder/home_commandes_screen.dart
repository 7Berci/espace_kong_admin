import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:espace_kong_admin/commandes_folder/details_commandes_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeOrders extends StatefulWidget {
  const HomeOrders({super.key});

  @override
  HomeOrdersView createState() => HomeOrdersView();
}

class HomeOrdersView extends State<HomeOrders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 29.0),
            StreamBuilder<QuerySnapshot>(
              stream:
                  FirebaseFirestore.instance
                      .collection('orders_users')
                      .where('archived', isEqualTo: false)
                      .orderBy('createdAt', descending: true)
                      .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  print('Erreur : ${snapshot.error}');
                  return Center(child: Text('Erreur : ${snapshot.error}'));
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                final docs = snapshot.data?.docs ?? [];
                if (docs.isEmpty) {
                  return const Padding(
                    padding: EdgeInsets.all(24.0),
                    child: Text(
                      'Pas de nouvelle commande',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                }
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 16.0,
                        horizontal: 8.0,
                      ),
                      child: Text(
                        'Nouvelle(s) commande(s) :',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        columns: const [
                          DataColumn(label: Text('#')),
                          DataColumn(label: Text('Date')),
                          DataColumn(label: Text('Numéro')),
                          DataColumn(label: Text('Quartier')),
                          DataColumn(label: Text('Statut')),
                        ],
                        rows: List.generate(docs.length, (index) {
                          final data =
                              docs[index].data() as Map<String, dynamic>;
                          final createdAt =
                              data['createdAt'] is Timestamp
                                  ? (data['createdAt'] as Timestamp).toDate()
                                  : DateTime.now();
                          final statut = data['statut'] ?? '---';
                          return DataRow(
                            onSelectChanged: (_) async {
                              // Naviguer vers la page de détails, tu pourras y ajouter les infos plus tard
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (context) => CommandeDetailsScreen(
                                        orderData: data,
                                        //orderId: docs[index].id,
                                      ),
                                ),
                              );
                            },
                            cells: [
                              DataCell(Text('${index + 1}')),
                              DataCell(
                                Text(
                                  DateFormat(
                                    'dd/MM/yyyy HH:mm',
                                  ).format(createdAt),
                                ),
                              ),
                              DataCell(
                                FutureBuilder<QuerySnapshot>(
                                  future:
                                      data['email'] != null
                                          ? FirebaseFirestore.instance
                                              .collection('contacts')
                                              .where(
                                                'email',
                                                isEqualTo: data['email'],
                                              )
                                              .limit(1)
                                              .get()
                                          : FirebaseFirestore.instance
                                              .collection('contacts')
                                              .where(
                                                'email',
                                                isEqualTo: '__no_email__',
                                              )
                                              .limit(1)
                                              .get(),
                                  builder: (context, contactSnapshot) {
                                    if (contactSnapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return const Text('...');
                                    }
                                    if (!contactSnapshot.hasData ||
                                        contactSnapshot.data!.docs.isEmpty) {
                                      return const Text('---');
                                    }
                                    final contactData =
                                        contactSnapshot.data!.docs.first.data()
                                            as Map<String, dynamic>;
                                    return Text(contactData['phone'] ?? '---');
                                  },
                                ),
                              ),
                              DataCell(
                                FutureBuilder<QuerySnapshot>(
                                  future:
                                      data['email'] != null
                                          ? FirebaseFirestore.instance
                                              .collection('contacts')
                                              .where(
                                                'email',
                                                isEqualTo: data['email'],
                                              )
                                              .limit(1)
                                              .get()
                                          : FirebaseFirestore.instance
                                              .collection('contacts')
                                              .where(
                                                'email',
                                                isEqualTo: '__no_email__',
                                              )
                                              .limit(1)
                                              .get(),
                                  builder: (context, contactSnapshot) {
                                    if (contactSnapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return const Text('...');
                                    }
                                    if (!contactSnapshot.hasData ||
                                        contactSnapshot.data!.docs.isEmpty) {
                                      return const Text('---');
                                    }
                                    final contactData =
                                        contactSnapshot.data!.docs.first.data()
                                            as Map<String, dynamic>;
                                    return Text(
                                      contactData['quartier'] ?? '---',
                                    );
                                  },
                                ),
                              ),
                              DataCell(Text('$statut')),
                            ],
                          );
                        }),
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
