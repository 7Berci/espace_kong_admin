// ignore_for_file: depend_on_referenced_packages
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:espace_kong_admin/auth_folder/utils.dart';
import 'package:espace_kong_admin/commandes_folder/cart_folder/cart_validate_order_form.dart';
import 'package:espace_kong_admin/home_folder/home.dart';
import 'package:flutter/material.dart';

class OrdersListFirst extends StatefulWidget {
  final email;

  const OrdersListFirst({super.key, required this.email});

  @override
  State<OrdersListFirst> createState() => _OrdersListFirstState();
}

class _OrdersListFirstState extends State<OrdersListFirst> {
  //late Stream<QuerySnapshot> _streamShoppingItems;
  final Utils utilsWidget = Utils();

  @override
  void initState() {
    // _streamShoppingItems =
    //     DatabaseService(uid: user?.uid).ordersCollection.snapshots();
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
              stream:
                  FirebaseFirestore.instance
                      .collection('orders')
                      .where(
                        'email',
                        isEqualTo: widget.email,
                      ) // ou this.email selon le contexte
                      .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) return CircularProgressIndicator();
                final commandes = snapshot.data!.docs;
                return ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: commandes.length,
                  itemBuilder: (context, index) {
                    final commande = commandes[index];
                    final data = commande.data() as Map<String, dynamic>;
                    final articles = data['articles'] as List<dynamic>? ?? [];
                    final remises =
                        data['remises'] as Map<String, dynamic>? ?? {};
                    final fraisLivraison = data['fraisLivraison'] ?? 0;
                    final totalSansRemise = data['totalSansRemise'] ?? 0;
                    final totalFinal = data['totalFinal'] ?? 0;

                    return Card(
                      margin: EdgeInsets.all(8),
                      child: ExpansionTile(
                        title: Text('Commande de ${data['email']}'),
                        subtitle: Text('Total à payer : $totalFinal FCFA'),
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Détails des articles :',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                ...articles.map(
                                  (article) => ListTile(
                                    title: Text(
                                      '${article["Nom de l'article"]} (${article['Type']})',
                                    ),
                                    subtitle: Text(
                                      'Quantité : ${article['Quantité commandée']}',
                                    ),
                                    trailing: Text(
                                      '${article['Coût unitaire']} FCFA',
                                    ),
                                  ),
                                ),
                                Divider(),
                                Text(
                                  'Frais de livraison : $fraisLivraison FCFA',
                                ),
                                Text(
                                  'Coût total des articles : $totalSansRemise FCFA',
                                ),
                                Text(
                                  'Remise 10% : ${remises['ten'] ?? 0} FCFA',
                                ),
                                Text(
                                  'Remise 20% : ${remises['twenty'] ?? 0} FCFA',
                                ),
                                Text(
                                  'Remise manuelle : ${remises['manuelle'] ?? 0} FCFA',
                                ),
                                Divider(),
                                Text(
                                  'Total à payer : $totalFinal FCFA',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 16.0),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center, // <-- centre horizontalement
                                    children: [
                                      Column(
                                        children: [
                                          Text("S'il y a une erreur :"),
                                          ElevatedButton(
                                            onPressed: () async {
                                              final querySnapshot =
                                                  await FirebaseFirestore.instance
                                                      .collection('orders')
                                                      .where(
                                                        'email',
                                                        isEqualTo: widget.email,
                                                      ) // ou this.email selon le contexte
                                                      .get();

                                              // 1. Récupérer les données du document à archiver
                                              if (querySnapshot.docs.isNotEmpty) {
                                                final doc =
                                                    querySnapshot.docs.first;
                                                final data = doc.data();

                                                // 2. Copier dans la collection d'archives
                                                await FirebaseFirestore.instance
                                                    .collection('deleted_orders')
                                                    .doc(orderId)
                                                    .set(data);

                                                // 3. Supprimer de la collection principale
                                                await doc.reference.delete();

                                                // 4. (Optionnel) Afficher un message ou naviguer
                                                ScaffoldMessenger.of(
                                                  context,
                                                ).showSnackBar(
                                                  SnackBar(
                                                    content: Text(
                                                      'Commande supprimée !',
                                                    ),
                                                  ),
                                                );
                                                Navigator.of(
                                                  context,
                                                ).pushReplacement(
                                                  MaterialPageRoute(
                                                    builder:
                                                        (builder) => OrdersListFirst(email:widget.email),
                                                  ),
                                                );
                                              }
                                            },
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: eclatColor,  // texte rouge
                                            ),                    
                                            child: Text('Supprimer la commande', style: TextStyle(color: Colors.white),),
                                          ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text("Si la commande est achevée :"),
                                        ElevatedButton(
                                          onPressed: () async {
                                            final querySnapshot =
                                                await FirebaseFirestore.instance
                                                    .collection('orders')
                                                    .where(
                                                      'email',
                                                      isEqualTo: widget.email,
                                                    ) // ou this.email selon le contexte
                                                    .get();

                                            // 1. Récupérer les données du document à archiver
                                            if (querySnapshot.docs.isNotEmpty) {
                                              final doc =
                                                  querySnapshot.docs.first;
                                              final data = doc.data();

                                              // 2. Copier dans la collection d'archives
                                              await FirebaseFirestore.instance
                                                  .collection('orders_archive')
                                                  .doc(orderId)
                                                  .set(data);

                                              // 3. Supprimer de la collection principale
                                              await doc.reference.delete();

                                              // 4. (Optionnel) Afficher un message ou naviguer
                                              ScaffoldMessenger.of(
                                                context,
                                              ).showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'Commande archivée !',
                                                  ),
                                                ),
                                              );
                                              Navigator.of(
                                                context,
                                              ).pushReplacement(
                                                MaterialPageRoute(
                                                  builder:
                                                      (builder) => OrdersListFirst(email:widget.email),
                                                ),
                                              );
                                            }
                                          },
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: eclatColor,  // texte rouge
                                            ),
                                          child: Text('Archiver la commande', style: TextStyle(color: Colors.white),),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
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
