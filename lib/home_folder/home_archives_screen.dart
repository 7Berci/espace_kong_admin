import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:permission_handler/permission_handler.dart';
import 'package:printing/printing.dart';

class HomeArchives extends StatefulWidget {
  const HomeArchives({super.key});

  @override
  State<HomeArchives> createState() => _HomeArchivesState();
}

class _HomeArchivesState extends State<HomeArchives> {
  String? selectedMonth;

  List<String> months = [];

  Future<void> fetchMonths() async {
    final snapshot =
        await FirebaseFirestore.instance.collection('orders_archive').get();
    final Set<String> monthSet = {};
    for (var doc in snapshot.docs) {
      final data = doc.data();
      final Timestamp? created = data['createdAt'];
      if (created != null) {
        final date = created.toDate();
        final month = DateFormat('MMMM yyyy', 'fr_FR').format(date);
        monthSet.add(month);
      }
    }
    setState(() {
      months =
          monthSet.toList()
            ..sort((a, b) => b.compareTo(a)); // du plus récent au plus ancien
      if (months.isNotEmpty) selectedMonth = months.first;
    });
    print("Mois récupérés : $months");
  }

  Future<void> savePdfToFile(
    String selectedMonth,
    List<QueryDocumentSnapshot> commandes,
  ) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.MultiPage(
        build:
            (context) => [
              pw.Header(
                level: 0,
                child: pw.Text(
                  'Les commandes de $selectedMonth',
                  style: pw.TextStyle(fontSize: 22),
                ),
              ),
              ...commandes.map((commande) {
                final data = commande.data() as Map<String, dynamic>;
                final Timestamp? created = data['createdAt'];
                final dateStr =
                    created != null
                        ? DateFormat('dd/MM/yyyy').format(created.toDate())
                        : '';
                final articles = data['articles'] as List<dynamic>? ?? [];
                final totalArticles = articles.fold<int>(
                  0,
                  (sum, a) =>
                      sum +
                      (int.tryParse(a['Quantité commandée'].toString()) ?? 0),
                );
                final nomsArticles = articles
                    .map((a) => a["Nom de l'article"])
                    .join(', ');
                final coutTotal =
                    data['totalAvecRemise'] ?? data['totalSimple'] ?? 0;

                return pw.Container(
                  margin: const pw.EdgeInsets.only(bottom: 12),
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text(
                        'Date : $dateStr',
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                      ),
                      pw.Text('Articles : $nomsArticles'),
                      pw.Text('Nombre total d\'articles : $totalArticles'),
                      pw.Text('Coût total : $coutTotal FCFA'),
                      pw.Divider(),
                    ],
                  ),
                );
              }),
            ],
      ),
    );

    await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdf.save(),
    );
    if (Platform.isAndroid) {
      final status = await Permission.storage.request();
      if (!status.isGranted) {
        // Handle permission denied
        return;
      }
    }

    // Get the Downloads directory
    Directory? directory;
    if (Platform.isAndroid) {
      directory = Directory('/storage/emulated/0/Download');
    } else {
      directory = await getApplicationDocumentsDirectory();
    }

    final file = File('${directory.path}/commandes_$selectedMonth.pdf');
    await file.writeAsBytes(await pdf.save());

    // Optionally, show a snackbar or dialog
    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('PDF enregistré dans ${file.path}')));
  }

  @override
  void initState() {
    super.initState();
    fetchMonths();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Produits archivés'),automaticallyImplyLeading: false,
),
      body: Column(
        children: [
          // Dropdown de sélection du mois
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: months.isEmpty
    ? CircularProgressIndicator()
    :DropdownButton<String>(
              value: months.contains(selectedMonth) ? selectedMonth : null,
              hint: Text('Sélectionnez un mois'),
              items:
                  months
                      .map((m) => DropdownMenuItem(value: m, child: Text(m)))
                      .toList(),
              onChanged: (value) {
                setState(() {
                  selectedMonth = value;
                });
              print("selectedMonth: $selectedMonth");
              },
            ),
          ),
          if (selectedMonth != null && months.contains(selectedMonth))
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Les commandes de $selectedMonth',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
          Expanded(
            child:
                selectedMonth == null
                    ? Center(child: Text('Sélectionnez un mois'))
                    : StreamBuilder<QuerySnapshot>(
                      stream:
                          FirebaseFirestore.instance
                              .collection('orders_archive')
                              .orderBy('createdAt', descending: true)
                              .snapshots(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return Center(child: CircularProgressIndicator());
                        }
                        final commandes =
                            snapshot.data!.docs.where((doc) {
                              final data = doc.data() as Map<String, dynamic>;
                              final Timestamp? created = data['createdAt'];
                              if (created == null) return false;
                              final date = created.toDate();
                              final month = DateFormat(
                                'MMMM yyyy',
                                'fr_FR',
                              ).format(date);
                              return month.toLowerCase().trim() == (selectedMonth ?? '').toLowerCase().trim();
                            }).toList();

                        if (commandes.isEmpty) {
                          return Center(
                            child: Text(
                              'Aucune commande archivée pour ce mois.',
                            ),
                          );
                        }

                        return ListView.builder(
                          itemCount: commandes.length,
                          itemBuilder: (context, index) {
                            final data =
                                commandes[index].data() as Map<String, dynamic>;
                            final Timestamp? created = data['createdAt'];
                            final dateStr =
                                created != null
                                    ? DateFormat(
                                      'dd/MM/yyyy',
                                    ).format(created.toDate())
                                    : '';
                            final articles =
                                data['articles'] as List<dynamic>? ?? [];
                            final totalArticles = articles.fold<int>(
                              0,
                              (sum, a) =>
                                  sum +
                                  (int.tryParse(
                                        a['Quantité commandée'].toString(),
                                      ) ??
                                      0),
                            );
                            final nomsArticles = articles
                                .map((a) => a["Nom de l'article"])
                                .join(', ');
                            final coutTotal =
                                data['totalFinal'] ??
                                data['totalSansRemise'] ??
                                0;

                            return Card(
                              margin: EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              child: ListTile(
                                leading: Text(dateStr),
                                title: Text('Articles: $nomsArticles'),
                                subtitle: Text(
                                  'Total articles: $totalArticles\nCoût total: $coutTotal FCFA',
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
          ),
          // Bouton exporter en PDF
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: ElevatedButton.icon(
              onPressed: () async {
                // Récupère les commandes du mois sélectionné (déjà filtrées dans le StreamBuilder)
                final snapshot =
                    await FirebaseFirestore.instance
                        .collection('orders_archive')
                        .orderBy('createdAt', descending: true)
                        .get();

                final commandes =
                    snapshot.docs.where((doc) {
                      final data = doc.data();
                      final Timestamp? created = data['createdAt'];
                      if (created == null) return false;
                      final date = created.toDate();
                      final month = DateFormat(
                        'MMMM yyyy',
                        'fr_FR',
                      ).format(date);
                      return month.toLowerCase().trim() == (selectedMonth ?? '').toLowerCase().trim();
                    }).toList();

                await savePdfToFile(selectedMonth!, commandes);
              },
              icon: Icon(Icons.picture_as_pdf),
              label: Text('Exporter en PDF'),
            ),
          ),
        ],
      ),
    );
  }
}
