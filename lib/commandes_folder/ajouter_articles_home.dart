import 'package:espace_kong_admin/commandes_folder/ajouter_lavage/ajouter_articles_lavage_home.dart';
import 'package:espace_kong_admin/commandes_folder/ajouter_lavage_repassage/ajouter_articles_lavagerepassage_home.dart';
import 'package:espace_kong_admin/commandes_folder/ajouter_repassage/ajouter_articles_repassage_home.dart';
import 'package:flutter/material.dart';

class AddHome extends StatelessWidget {
  final id;
  final email;
  final ville;
  final quartier;
  const AddHome({super.key, required this.id,
    required this.ville, required this.email,
    required this.quartier,});

  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('Choisir le type de service'),
    ),
    body: Padding(
      padding: const EdgeInsets.all(12.0),
      child: Center(
        child: Wrap(
          spacing: 12,
          runSpacing: 12,
          alignment: WrapAlignment.center,
          children: [
            _buildCard(
              context,
              icon: Icons.local_laundry_service,
              label: 'LAVAGE SIMPLE',
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ArticlesToWash(
                    id: id, email: email, ville: ville, quartier: quartier,
                  ),
                ),
              ),
            ),
            _buildCard(
              context,
              icon: Icons.local_laundry_service,
              label: 'LAVAGE + REPASSAGE',
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ArticlesToWashnIron(
                    id: id, email: email, ville: ville, quartier: quartier,
                  ),
                ),
              ),
            ),
            _buildCard(
              context,
              icon: Icons.local_laundry_service,
              label: 'REPASSAGE SIMPLE',
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ArticlesToIron(
                    id: id, email: email, ville: ville, quartier: quartier,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget _buildCard(
  BuildContext context, {
  required IconData icon,
  required String label,
  required VoidCallback onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        width: 130,
        height: 130,
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50, color: Colors.blue),
            const SizedBox(height: 10),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
}