import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:espace_kong_admin/commandes_folder/admin_folder/orders_list_first.dart';
import 'package:espace_kong_admin/commandes_folder/ajouter_articles_home.dart';
import 'package:espace_kong_admin/commandes_folder/changer_statut.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CommandeDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> orderData;
  final String orderId;

  const CommandeDetailsScreen({
    super.key,
    required this.orderData,
    required this.orderId,
  });

  // Future<double> printUserTotal(String userEmail) async {
  //   print('Recherche orders_total pour email: $userEmail');
  //   final snapshot =
  //       await FirebaseFirestore.instance
  //           .collection('orders_total')
  //           .where('email', isEqualTo: userEmail)
  //           .get();

  //   print('Nb de docs trouvés: ${snapshot.docs.length}');
  //   if (snapshot.docs.isEmpty) {
  //     return 0.0;
  //   }

  //   // On prend le premier document trouvé
  //   final data = snapshot.docs.first.data() as Map<String, dynamic>;
  //   print('data trouvé: $data');
  //   final montantString = data['totalAvecRemise'].toString();
  //   final montantNum =
  //       double.tryParse(
  //         RegExp(r'\d+(\.\d+)?').stringMatch(montantString) ?? '0',
  //       ) ??
  //       0.0;
  //   return montantNum;
  // }

  // Future<double> sumOrderNum(String userEmail) async {
  //   final snapshot =
  //       await FirebaseFirestore.instance
  //           .collection('orders')
  //           .where('email', isEqualTo: userEmail)
  //           .get();

  //   double total = 0;
  //   for (final doc in snapshot.docs) {
  //     final data = doc.data();
  //     final montant = (data["Quantité commandée"] ?? 0).toDouble();
  //     total += montant;
  //   }
  //   return total;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Détails de la commande')),
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
                          DataColumn(label: Text('Montant')),
                          DataColumn(label: Text('Articles')),
                          DataColumn(label: Text('Statut')),
                          DataColumn(label: Text('Actions')),
                        ],
                        rows: List.generate(docs.length, (index) {
                          final data =
                              docs[index].data() as Map<String, dynamic>;
                          final createdAt =
                              data['createdAt'] is Timestamp
                                  ? (data['createdAt'] as Timestamp).toDate()
                                  : DateTime.now();
                          final userEmail = data['email'];

                          return DataRow(
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
                                StreamBuilder<QuerySnapshot>(
                                  stream:
                                      FirebaseFirestore.instance
                                          .collection('orders_total')
                                          .where(
                                            'email',
                                            isEqualTo: userEmail,
                                          ) // adapte le champ si besoin
                                          .snapshots(),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return CircularProgressIndicator();
                                    }
                                    if (!snapshot.hasData ||
                                        snapshot.data!.docs.isEmpty) {
                                      return Text('0');
                                    }
                                    // Exemple : somme des totaux pour cet utilisateur
                                    double total = 0;
                                    for (var doc in snapshot.data!.docs) {
                                      total +=
                                          double.tryParse(
                                            doc['totalAvecRemise']
                                                .toString()
                                                .replaceAll(' FCFA', ''),
                                          ) ??
                                          0;
                                    }
                                    return Text('$total');
                                  },
                                ),
                              ),
                              DataCell(
                                StreamBuilder<QuerySnapshot>(
                                  stream:
                                      FirebaseFirestore.instance
                                          .collection('orders')
                                          .where(
                                            'email',
                                            isEqualTo: userEmail,
                                          ) // adapte le champ si besoin
                                          .snapshots(),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return CircularProgressIndicator();
                                    }
                                    if (!snapshot.hasData ||
                                        snapshot.data!.docs.isEmpty) {
                                      return TextButton(
                                        onPressed: () {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder:
                                                  (builder) => OrdersListFirst(
                                                    email: userEmail,
                                                  ),
                                            ),
                                          );
                                        },
                                        child: Text('0'),
                                      );
                                    }
                                    // Exemple : somme des quantités pour cet utilisateur
                                    int sum = 0;
                                    for (var doc in snapshot.data!.docs) {
                                      final data =
                                          doc.data() as Map<String, dynamic>;
                                      if (data.containsKey(
                                        'Quantité commandée',
                                      )) {
                                        sum +=
                                            int.tryParse(
                                              data['Quantité commandée']
                                                  .toString(),
                                            ) ??
                                            0;
                                      }
                                    }
                                    return TextButton(
                                      onPressed: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder:
                                                (builder) => OrdersListFirst(
                                                  email: userEmail,
                                                ),
                                          ),
                                        );
                                      },
                                      child: Text('$sum'),
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
                                          Navigator.of(context).pushReplacement(
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
                                          Navigator.of(context).pushReplacement(
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
                                          Navigator.of(context).pushReplacement(
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
                              DataCell(
                                Row(
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                            builder:
                                                (builder) => Articles(
                                                  id: docs[index].id,
                                                  email: data['email'],
                                                ),
                                          ),
                                        );
                                        //Navigator.pushNamed(context, '/ajouter_articles', arguments: docs[index].id);
                                      },
                                      child: const Text(
                                        'Ajouter articles/montant',
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                  ],
                                ),
                              ),
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
