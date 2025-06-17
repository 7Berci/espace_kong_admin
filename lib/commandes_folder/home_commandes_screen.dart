import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:espace_kong_admin/commandes_folder/changer_statut.dart';
import 'package:espace_kong_admin/commandes_folder/details_commandes_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeOrders extends StatefulWidget {
  const HomeOrders({super.key});

  @override
  HomeOrdersView createState() => HomeOrdersView();
}

class HomeOrdersView extends State<HomeOrders> {
  String? selectedVille;
  final List<String?> villes = [];

  @override
  void initState() {
    super.initState();
    fetchVilles();
  }

  void fetchVilles() async {
    final snapshot =
        await FirebaseFirestore.instance.collection('orders_users').get();
    final villesList =
        snapshot.docs
            .map((doc) => doc['ville'] as String?)
            .where((ville) => ville != null)
            .toSet()
            .toList();
    setState(() {
      villes.clear();
      villes.addAll(villesList);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Wrap(
          spacing: 8,
          children:
              villes.map((ville) {
                return ChoiceChip(
                  label: Text(ville ?? ""),
                  selected: selectedVille == ville,
                  onSelected: (selected) {
                    setState(() {
                      selectedVille = ville;
                    });
                  },
                );
              }).toList(),
        ),
        Expanded(
          child:
              selectedVille == null
                  ? Center(child: Text('Sélectionnez une ville'))
                  : StreamBuilder<QuerySnapshot>(
                    stream:
                        FirebaseFirestore.instance
                            .collection('orders_users')
                            .where('ville', isEqualTo: selectedVille)
                            .snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) return CircularProgressIndicator();
                      final commandes = snapshot.data!.docs;
                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: DataTable(
                          columns: const [
                            DataColumn(label: Text('#')),
                            DataColumn(label: Text('Date')),
                            DataColumn(label: Text('Numéro')),
                            DataColumn(label: Text('Quartier')),
                            DataColumn(label: Text('Statut')),
                          ],
                          rows: List.generate(commandes.length, (index) {
                            final data =
                                commandes[index].data() as Map<String, dynamic>;
                            final createdAt =
                                data['createdAt'] is Timestamp
                                    ? (data['createdAt'] as Timestamp).toDate()
                                    : DateTime.now();

                            final userEmail = data['email'];
                            return DataRow(
                              onSelectChanged: (_) async {
                                // Naviguer vers la page de détails, tu pourras y ajouter les infos plus tard
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder:
                                        (context) => CommandeDetailsScreen(
                                          orderData: data,
                                          ville: data['ville'],
                                          quartier: data['quartier'],
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
                                          contactSnapshot.data!.docs.first
                                                  .data()
                                              as Map<String, dynamic>;
                                      return Text(
                                        contactData['phone'] ?? '---',
                                      );
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
                                          contactSnapshot.data!.docs.first
                                                  .data()
                                              as Map<String, dynamic>;
                                      return Text(
                                        contactData['quartier'] ?? '---',
                                      );
                                    },
                                  ),
                                ),

                                DataCell(
                                  StreamBuilder<DocumentSnapshot>(
                                    stream:
                                        FirebaseFirestore.instance
                                            .collection('status')
                                            .doc(
                                              userEmail,
                                            ) // ou adapte selon ton id de commande
                                            .snapshots(),
                                    builder: (context, snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.waiting) {
                                        return CircularProgressIndicator();
                                      }
                                      if (!snapshot.hasData ||
                                          !snapshot.data!.exists) {
                                        return TextButton(
                                          onPressed: () {
                                            Navigator.of(
                                              context,
                                            ).pushReplacement(
                                              MaterialPageRoute(
                                                builder:
                                                    (builder) => StatusMenu(
                                                      email: userEmail,
                                                    ),
                                              ),
                                            );
                                          },
                                          child: Text('Aucun statut'),
                                        );
                                      }
                                      final data =
                                          snapshot.data!.data()
                                              as Map<String, dynamic>;
                                      final statuts =
                                          data['statuts']
                                              as Map<String, dynamic>?;

                                      if (statuts == null || statuts.isEmpty) {
                                        return TextButton(
                                          onPressed: () {
                                            Navigator.of(
                                              context,
                                            ).pushReplacement(
                                              MaterialPageRoute(
                                                builder:
                                                    (builder) => StatusMenu(
                                                      email: userEmail,
                                                    ),
                                              ),
                                            );
                                          },
                                          child: Text('Aucun statut'),
                                        );
                                      }

                                      // On récupère la liste des statuts activés (true)
                                      final activeStatuts =
                                          statuts.entries
                                              .where((e) => e.value == true)
                                              .map((e) => e.key)
                                              .toList();

                                      if (activeStatuts.isEmpty) {
                                        return TextButton(
                                          onPressed: () {
                                            Navigator.of(
                                              context,
                                            ).pushReplacement(
                                              MaterialPageRoute(
                                                builder:
                                                    (builder) => StatusMenu(
                                                      email: userEmail,
                                                    ),
                                              ),
                                            );
                                          },
                                          child: Text('Aucun statut'),
                                        );
                                      }

                                      // On prend le dernier statut activé (le plus à droite dans la liste)
                                      final lastActive = activeStatuts.last;

                                      return TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                              builder:
                                                  (builder) => StatusMenu(
                                                    email: userEmail,
                                                  ),
                                            ),
                                          );
                                        },
                                        child: Text(lastActive),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            );
                          }),
                        ),
                      );
                    },
                  ),
        ),
      ],
    );
  }

  // @override
  // Widget build(BuildContext context) {

  //   return Scaffold(
  //     body: SingleChildScrollView(
  //       child: Column(
  //         children: [
  //           const SizedBox(height: 29.0),
  //           StreamBuilder<QuerySnapshot>(
  //             stream:
  //                 FirebaseFirestore.instance
  //                     .collection('orders_users')
  //                     .where('archived', isEqualTo: false)
  //                     .orderBy('createdAt', descending: true)
  //                     .snapshots(),
  //             builder: (context, snapshot) {
  //               if (snapshot.hasError) {
  //                 print('Erreur : ${snapshot.error}');
  //                 return Center(child: Text('Erreur : ${snapshot.error}'));
  //               }
  //               if (snapshot.connectionState == ConnectionState.waiting) {
  //                 return const Center(child: CircularProgressIndicator());
  //               }
  //               final docs = snapshot.data?.docs ?? [];
  //               if (docs.isEmpty) {
  //                 return const Padding(
  //                   padding: EdgeInsets.all(24.0),
  //                   child: Text(
  //                     'Pas de nouvelle commande',
  //                     style: TextStyle(
  //                       fontSize: 20,
  //                       fontWeight: FontWeight.bold,
  //                     ),
  //                   ),
  //                 );
  //               }
  //               return Column(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: [
  //                   const Padding(
  //                     padding: EdgeInsets.symmetric(
  //                       vertical: 16.0,
  //                       horizontal: 8.0,
  //                     ),
  //                     child: Text(
  //                       'Nouvelle(s) commande(s) :',
  //                       style: TextStyle(
  //                         fontSize: 22,
  //                         fontWeight: FontWeight.bold,
  //                       ),
  //                     ),
  //                   ),
  //                   SingleChildScrollView(
  //                     scrollDirection: Axis.horizontal,
  //                     child: DataTable(
  //                       columns: const [
  //                         DataColumn(label: Text('#')),
  //                         DataColumn(label: Text('Date')),
  //                         DataColumn(label: Text('Numéro')),
  //                         DataColumn(label: Text('Quartier')),
  //                         DataColumn(label: Text('Statut')),
  //                       ],
  //                       rows: List.generate(docs.length, (index) {
  //                         final data =
  //                             docs[index].data() as Map<String, dynamic>;
  //                         final createdAt =
  //                             data['createdAt'] is Timestamp
  //                                 ? (data['createdAt'] as Timestamp).toDate()
  //                                 : DateTime.now();
  //                         final statut = data['statut'] ?? '---';
  //                         return DataRow(
  //                           onSelectChanged: (_) async {
  //                             // Naviguer vers la page de détails, tu pourras y ajouter les infos plus tard
  //                             Navigator.push(
  //                               context,
  //                               MaterialPageRoute(
  //                                 builder:
  //                                     (context) => CommandeDetailsScreen(
  //                                       orderData: data,
  //                                       //orderId: docs[index].id,
  //                                     ),
  //                               ),
  //                             );
  //                           },
  //                           cells: [
  //                             DataCell(Text('${index + 1}')),
  //                             DataCell(
  //                               Text(
  //                                 DateFormat(
  //                                   'dd/MM/yyyy HH:mm',
  //                                 ).format(createdAt),
  //                               ),
  //                             ),
  //                             DataCell(
  //                               FutureBuilder<QuerySnapshot>(
  //                                 future:
  //                                     data['email'] != null
  //                                         ? FirebaseFirestore.instance
  //                                             .collection('contacts')
  //                                             .where(
  //                                               'email',
  //                                               isEqualTo: data['email'],
  //                                             )
  //                                             .limit(1)
  //                                             .get()
  //                                         : FirebaseFirestore.instance
  //                                             .collection('contacts')
  //                                             .where(
  //                                               'email',
  //                                               isEqualTo: '__no_email__',
  //                                             )
  //                                             .limit(1)
  //                                             .get(),
  //                                 builder: (context, contactSnapshot) {
  //                                   if (contactSnapshot.connectionState ==
  //                                       ConnectionState.waiting) {
  //                                     return const Text('...');
  //                                   }
  //                                   if (!contactSnapshot.hasData ||
  //                                       contactSnapshot.data!.docs.isEmpty) {
  //                                     return const Text('---');
  //                                   }
  //                                   final contactData =
  //                                       contactSnapshot.data!.docs.first.data()
  //                                           as Map<String, dynamic>;
  //                                   return Text(contactData['phone'] ?? '---');
  //                                 },
  //                               ),
  //                             ),
  //                             DataCell(
  //                               FutureBuilder<QuerySnapshot>(
  //                                 future:
  //                                     data['email'] != null
  //                                         ? FirebaseFirestore.instance
  //                                             .collection('contacts')
  //                                             .where(
  //                                               'email',
  //                                               isEqualTo: data['email'],
  //                                             )
  //                                             .limit(1)
  //                                             .get()
  //                                         : FirebaseFirestore.instance
  //                                             .collection('contacts')
  //                                             .where(
  //                                               'email',
  //                                               isEqualTo: '__no_email__',
  //                                             )
  //                                             .limit(1)
  //                                             .get(),
  //                                 builder: (context, contactSnapshot) {
  //                                   if (contactSnapshot.connectionState ==
  //                                       ConnectionState.waiting) {
  //                                     return const Text('...');
  //                                   }
  //                                   if (!contactSnapshot.hasData ||
  //                                       contactSnapshot.data!.docs.isEmpty) {
  //                                     return const Text('---');
  //                                   }
  //                                   final contactData =
  //                                       contactSnapshot.data!.docs.first.data()
  //                                           as Map<String, dynamic>;
  //                                   return Text(
  //                                     contactData['quartier'] ?? '---',
  //                                   );
  //                                 },
  //                               ),
  //                             ),
  //                             DataCell(Text('$statut')),
  //                           ],
  //                         );
  //                       }),
  //                     ),
  //                   ),
  //                 ],
  //               );
  //             },
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
