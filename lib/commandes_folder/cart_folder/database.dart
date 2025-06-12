// ignore: depend_on_referenced_packages
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:espace_kong_admin/commandes_folder/fetching_orders/orders.dart';

String imagePath =
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQSyfJnaSYfgnTEhLH2AM5Q8fy1IROMZ3gvKlE6OK8&s';
String name = "";
String identification = "";
String location = "";
bool isDarkMode = false;
// late final Products product;
String imagePathProduct = 'assets/images/chemisemc.png';
String nameProduct = "??";
int quantity = 0;
String total = "??";

// final aUser = UsersData(
//   // imagePath: imagePath as File?,
//   imagePath: imagePath,
//   name: name,
//   identification: identification,
//   location: location,
//   isDarkMode: isDarkMode,
// );

// final aOrder = Orders(
//   // imagePath: imagePath as File?,
//   // name: name,
//   identification: identification,
//   location: location,
//   isDarkMode: isDarkMode,
//   produit: product,
//   photo: imagePathProduct,
//   nameProducts: nameProduct,
//   quantity: quantity,
//   total: total,
// );

class DatabaseService {

  final String? uid;
  DatabaseService({required this.uid});

  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection("usersdata");

  final CollectionReference ordersCollection =
      FirebaseFirestore.instance.collection("orders");

  Future updateUserData(String imagePath, String name, String identification,
      String location, bool isDarkMode) async {
    return await usersCollection.doc(uid).set({
      'ImagePath': imagePath,
      'Nom et prénom': name,
      'Numéro de téléphone': identification,
      'Location ': location,
      'Mode sombre': isDarkMode,
    });
  }

  //final json = aUser.toJson();



  // Future sendProductOrder(
  //     String imagePath,
  //     String name,
  //     String identification,
  //     String location,
  //     bool isDarkMode,
  //     String nameProduct,
  //     int quantity,
  //     String total) async {
  //   return await ordersCollection
  //       .doc(uid)
  //       .set({jsonOrder}, SetOptions(merge: true));
  // }

  // final jsonOrder = aOrder.toJsonOrders();

 
 


  // List<UsersData> _usersListFromSnapshot(QuerySnapshot snapshot) {
  //   try {
  //     return snapshot.docs.map((doc) {
  //       return UsersData(
  //         imagePath: doc.get('ImagePath') ?? "",
  //         name: doc.get('Nom et Prénom') ?? "",
  //         identification: doc.get('Numéro de téléphone') ?? "",
  //         location: doc.get('Location') ?? "",
  //         isDarkMode: doc.get('Mode sombre') ?? "",
  //         // imagePath: doc.data('imagePath') ?? "",
  //         // name: doc.data().toString() ?? "",
  //         // number: doc.data('number') ?? "",
  //         // email: doc.data('email') ?? "",
  //         // location: doc.data('location') ?? "",
  //         // isDarkMode: doc.data('isDarkMode') ?? ""
  //       );
  //     }).toList();
  //   } catch (e) {
  //     // ignore: avoid_print
  //     print(e.toString());
  //     utilsWidget.showSnackBar(e.toString());
  //     return [];
  //   }
  // }



  // Stream<List<UsersData>> get usersdata {
  //   return usersCollection.snapshots().map(_usersListFromSnapshot);
  // }

  List<Orders> _ordersListFromSnapshot(QuerySnapshot snapshot) {
    try {
      return snapshot.docs.map((doc) {
        return Orders(
          // imagePath: doc.get('ImagePath') ?? "",
          // name: doc.get('Nom et prénom') ?? "",
          identification: doc.get('email') ?? "",
          location: doc.get("Location") ?? "",
          //produit: doc.get("ProductPath") ?? "",
          photo: doc.get('ImagePathProduct') ?? "",
          nameProducts: doc.get("Nom de l'artcile") ?? "",
          quantity: doc.get('Quantité commandée') ?? "",
          total: doc.get('Coût unitaire') ?? "",
        );
      }).toList();
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
      //utilsWidget.showSnackBar(e.toString());
      return [];
    }
  }

  // = Orders(
  //   identification:

  // , location: null, nameProducts: null, quantity: null, photo: null, produit: null, total: '');
  //To stream data (a QuerySnapshot intially)
  Stream<List<Orders>> get orders {
    return ordersCollection.snapshots().map(_ordersListFromSnapshot);
  }
  // Stream<UsersData> get singleusersdata {
  //   return usersCollection.snapshots()
  //       .map(_usersListFromSnapshot);
  // }
}
