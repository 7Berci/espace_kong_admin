// import '../products_model_list.dart';
// import '../shop_superexpress_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'cart_controller.dart';
// import 'catalog_accessoires_screen.dart';
// import 'catalog_accessoires_screen_express.dart';
// import 'catalog_accessoires_screen_superexpress.dart';
// import 'catalog_autres_screen.dart';
// import 'catalog_autres_screen_express.dart';
// import 'catalog_autres_screen_superexpress.dart';
// import 'catalog_bain_screen.dart';
// import 'catalog_bain_screen_express.dart';
// import 'catalog_bain_screen_superexpress.dart';
// import 'catalog_literie_screen.dart';
// import 'catalog_literie_screen_express.dart';
// import 'catalog_literie_screen_superexpress.dart';
// import 'catalog_special_screen.dart';
// import 'catalog_special_screen_express.dart';
// import 'catalog_special_screen_superexpress.dart';
// import 'catalog_vetements_screen.dart';
// import 'catalog_vetements_screen_express.dart';
// import 'catalog_vetements_screen_superexpress.dart';
//
// class ProductsList extends StatefulWidget {
//   ProductsList ({Key? key}) : super(key: key);
//
//   @override
//   State<ProductsList> createState() => _ProductsListState();
// }
//
// class _ProductsListState extends State<ProductsList> {
//   int index = 0;
//
//   final screens = [
//     ShowNormalProductsList(),
//     ShowExpressProductsList(),
//     ShowSuperExpressProductsList(),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.eclat.shade50,
//         title: const Center(
//             child: Text('Liste des produits')
//         ),
//       ),
//       body: screens[index],
//       bottomNavigationBar: NavigationBarTheme(
//         data: NavigationBarThemeData(
//           indicatorColor: Colors.green,
//           labelTextStyle: MaterialStateProperty.all(
//             const TextStyle(
//               fontSize: 14.0,
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//         ),
//         child: NavigationBar(
//           selectedIndex: index,
//           onDestinationSelected: (index) =>
//               setState(() => this.index = index),
//           height: 60.0,
//           backgroundColor: Colors.white,
//           destinations: const [
//             NavigationDestination(
//               icon: Icon(Icons.delivery_dining),
//               label: 'Normal',
//             ),
//             NavigationDestination(
//               icon: Icon(Icons.local_shipping),
//               label: 'Express',
//             ),
//             NavigationDestination(
//               icon: Icon(Icons.motorcycle),
//               label: 'Super Express',
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class ShowNormalProductsList extends StatelessWidget {
//   ShowNormalProductsList({Key? key}) : super(key: key);
//   final cart_Controller = Get.put(CartController());
//
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Row(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
//                     child: ShowPicture(Product.products[0].photo),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                     child: Text(
//                       'Vêtements',
//                       style: const TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 21.0,
//                       ),
//                     ),
//                   ),
//                   const Spacer(),
//                   IconButton(
//                     onPressed: () {
//                       cart_Controller.InitCounter(Product.products[0]);
//                       cart_Controller.InitCounter(Product.products[1]);
//                       cart_Controller.InitCounter(Product.products[2]);
//                       cart_Controller.InitCounter(Product.products[3]);
//                       cart_Controller.InitCounter(Product.products[4]);
//                       cart_Controller.InitCounter(Product.products[5]);
//                       cart_Controller.InitCounter(Product.products[6]);
//                       cart_Controller.InitCounter(Product.products[7]);
//                       cart_Controller.InitCounter(Product.products[8]);
//                       cart_Controller.InitCounter(Product.products[9]);
//                       cart_Controller.InitCounter(Product.products[10]);
//                       cart_Controller.InitCounter(Product.products[11]);
//                       cart_Controller.InitCounter(Product.products[12]);
//                       cart_Controller.InitCounter(Product.products[13]);
//                       cart_Controller.InitCounter(Product.products[14]);
//                       cart_Controller.InitCounter(Product.products[15]);
//
//                       cart_Controller.clothesInitRealCounter(Product.products[0]);
//                       cart_Controller.clothesInitRealCounter(Product.products[1]);
//                       cart_Controller.clothesInitRealCounter(Product.products[2]);
//                       cart_Controller.clothesInitRealCounter(Product.products[3]);
//                       cart_Controller.clothesInitRealCounter(Product.products[4]);
//                       cart_Controller.clothesInitRealCounter(Product.products[5]);
//                       cart_Controller.clothesInitRealCounter(Product.products[6]);
//                       cart_Controller.clothesInitRealCounter(Product.products[7]);
//                       cart_Controller.clothesInitRealCounter(Product.products[8]);
//                       cart_Controller.clothesInitRealCounter(Product.products[9]);
//                       cart_Controller.clothesInitRealCounter(Product.products[10]);
//                       cart_Controller.clothesInitRealCounter(Product.products[11]);
//                       cart_Controller.clothesInitRealCounter(Product.products[12]);
//                       cart_Controller.clothesInitRealCounter(Product.products[13]);
//                       cart_Controller.clothesInitRealCounter(Product.products[14]);
//                       cart_Controller.clothesInitRealCounter(Product.products[15]);
//
//                       Navigator.of(context).push(MaterialPageRoute(builder: (builder) => ShowClothes()));
//                     },
//                     icon: Icon(Icons.add_box_rounded),
//                   )
//                 ]
//             ),
//             Divider(),
//             Row(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
//                     child: ShowPicture(Product.products[32].photo),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                     child: Text(
//                       'Spécial',
//                       style: const TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 21.0,
//                       ),
//                     ),
//                   ),
//                   const Spacer(),
//                   IconButton(
//                       icon: Icon(Icons.add_box_rounded),
//                       onPressed: () {
//                         cart_Controller.specialInitCounter(Product.products[32]);
//                         cart_Controller.specialInitRealCounter(Product.products[32]);
//                         Navigator.of(context).push(MaterialPageRoute(builder: (builder) => ShowSpecial()));
//                       }
//                   )
//
//                 ]
//             ),
//             Divider(),
//             Row(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
//                     child: ShowPicture(Product.products[34].photo),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                     child: Text(
//                       'Accessoires',
//                       style: const TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 21.0,
//                       ),
//                     ),
//                   ),
//                   const Spacer(),
//                   IconButton(
//                       icon: Icon(Icons.add_box_rounded),
//                       onPressed: () {
//                         cart_Controller.accessoriesInitCounter(Product.products[34]);
//                         cart_Controller.accessoriesInitCounter(Product.products[35]);
//                         cart_Controller.accessoriesInitCounter(Product.products[36]);
//                         cart_Controller.accessoriesInitCounter(Product.products[37]);
//                         cart_Controller.accessoriesInitCounter(Product.products[38]);
//
//                         cart_Controller.accessoriesInitRealCounter(Product.products[34]);
//                         cart_Controller.accessoriesInitRealCounter(Product.products[35]);
//                         cart_Controller.accessoriesInitRealCounter(Product.products[36]);
//                         cart_Controller.accessoriesInitRealCounter(Product.products[37]);
//                         cart_Controller.accessoriesInitRealCounter(Product.products[38]);
//                         Navigator.of(context).push(MaterialPageRoute(builder: (builder) => ShowAccessories()));
//                       }
//                   )
//                 ]
//             ),
//             Divider(),
//             Row(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
//                     child: ShowPicture(Product.products[44].photo),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                     child: Text(
//                       'Bain',
//                       style: const TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 21.0,
//                       ),
//                     ),
//                   ),
//                   const Spacer(),
//                   IconButton(
//                       icon: Icon(Icons.add_box_rounded),
//                       onPressed: () {
//                         cart_Controller.bathInitCounter(Product.products[44]);
//                         cart_Controller.bathInitCounter(Product.products[45]);
//                         cart_Controller.bathInitCounter(Product.products[46]);
//
//                         cart_Controller.bathInitRealCounter(Product.products[44]);
//                         cart_Controller.bathInitRealCounter(Product.products[45]);
//                         cart_Controller.bathInitRealCounter(Product.products[46]);
//                         Navigator.of(context).push(MaterialPageRoute(builder: (builder) => ShowBain()));
//                       }
//                   )
//                 ]
//             ),
//             Divider(),
//             Row(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
//                     child: ShowPicture(Product.products[50].photo),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                     child: Text(
//                       'Literie',
//                       style: const TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 21.0,
//                       ),
//                     ),
//                   ),
//                   const Spacer(),
//                   IconButton(
//                       icon: Icon(Icons.add_box_rounded),
//                       onPressed: () {
//                         cart_Controller.beddingInitCounter(Product.products[50]);
//                         cart_Controller.beddingInitCounter(Product.products[51]);
//                         cart_Controller.beddingInitCounter(Product.products[52]);
//                         cart_Controller.beddingInitCounter(Product.products[53]);
//                         cart_Controller.beddingInitCounter(Product.products[54]);
//                         cart_Controller.beddingInitCounter(Product.products[55]);
//                         cart_Controller.beddingInitCounter(Product.products[56]);
//
//                         cart_Controller.beddingInitRealCounter(Product.products[50]);
//                         cart_Controller.beddingInitRealCounter(Product.products[51]);
//                         cart_Controller.beddingInitRealCounter(Product.products[52]);
//                         cart_Controller.beddingInitRealCounter(Product.products[53]);
//                         cart_Controller.beddingInitRealCounter(Product.products[54]);
//                         cart_Controller.beddingInitRealCounter(Product.products[55]);
//                         cart_Controller.beddingInitRealCounter(Product.products[56]);
//                         Navigator.of(context).push(MaterialPageRoute(builder: (builder) => ShowLiterie()));
//                       }
//                   )
//                 ]
//             ),
//             Divider(),
//             Row(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
//                     child: ShowPicture(Product.products[64].photo),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                     child: Text(
//                       'Autre',
//                       style: const TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 21.0,
//                       ),
//                     ),
//                   ),
//                   const Spacer(),
//                   IconButton(
//                       icon: Icon(Icons.add_box_rounded),
//                       onPressed: () {
//                         cart_Controller.othersInitCounter(Product.products[64]);
//                         cart_Controller.othersInitCounter(Product.products[65]);
//                         cart_Controller.othersInitCounter(Product.products[66]);
//
//                         cart_Controller.othersInitRealCounter(Product.products[64]);
//                         cart_Controller.othersInitRealCounter(Product.products[65]);
//                         cart_Controller.othersInitRealCounter(Product.products[66]);
//                         Navigator.of(context).push(MaterialPageRoute(builder: (builder) => ShowAutre()));
//                       }
//                   )
//                 ]
//             ),
//             Divider(),
//             const SizedBox(height: 30.0),
//             // Center(
//             //   child: MaterialButton(
//             //     onPressed: () {
//             //       Navigator.of(context).push(
//             //           MaterialPageRoute(builder: (builder) => CartScreen()));
//             //       cartController.ifsigned();
//             //       cartController.clothesInitrkvalue(Product.products[0]);
//             //       cartController.clothesInitrkvalue(Product.products[1]);
//             //       cartController.clothesInitrkvalue(Product.products[2]);
//             //       cartController.clothesInitrkvalue(Product.products[3]);
//             //       cartController.clothesInitrkvalue(Product.products[4]);
//             //       cartController.clothesInitrkvalue(Product.products[5]);
//             //       cartController.clothesInitrkvalue(Product.products[6]);
//             //       cartController.clothesInitrkvalue(Product.products[7]);
//             //       cartController.clothesInitrkvalue(Product.products[8]);
//             //       cartController.clothesInitrkvalue(Product.products[9]);
//             //       cartController.clothesInitrkvalue(Product.products[10]);
//             //       cartController.clothesInitrkvalue(Product.products[11]);
//             //       cartController.clothesInitrkvalue(Product.products[12]);
//             //       cartController.clothesInitrkvalue(Product.products[13]);
//             //       cartController.clothesInitrkvalue(Product.products[14]);
//             //       cartController.clothesInitrkvalue(Product.products[15]);
//             //
//             //       cartController.specialInitrkvalue(Product.products[32]);
//             //
//             //       cartController.accessoriesInitrkvalue(Product.products[34]);
//             //       cartController.accessoriesInitrkvalue(Product.products[35]);
//             //       cartController.accessoriesInitrkvalue(Product.products[36]);
//             //       cartController.accessoriesInitrkvalue(Product.products[37]);
//             //       cartController.accessoriesInitrkvalue(Product.products[38]);
//             //
//             //       cartController.bathInitrkvalue(Product.products[44]);
//             //       cartController.bathInitrkvalue(Product.products[45]);
//             //       cartController.bathInitrkvalue(Product.products[46]);
//             //
//             //       cartController.beddingInitrkvalue(Product.products[50]);
//             //       cartController.beddingInitrkvalue(Product.products[51]);
//             //       cartController.beddingInitrkvalue(Product.products[52]);
//             //       cartController.beddingInitrkvalue(Product.products[53]);
//             //       cartController.beddingInitrkvalue(Product.products[54]);
//             //       cartController.beddingInitrkvalue(Product.products[55]);
//             //       cartController.beddingInitrkvalue(Product.products[56]);
//             //
//             //       cartController.othersInitrkvalue(Product.products[64]);
//             //       cartController.othersInitrkvalue(Product.products[65]);
//             //       cartController.othersInitrkvalue(Product.products[66]);
//             //
//             //
//             //       //for express screen
//             //       cartController.clothesInitrkvalue(Product.products[16]);
//             //       cartController.clothesInitrkvalue(Product.products[17]);
//             //       cartController.clothesInitrkvalue(Product.products[18]);
//             //       cartController.clothesInitrkvalue(Product.products[19]);
//             //       cartController.clothesInitrkvalue(Product.products[20]);
//             //       cartController.clothesInitrkvalue(Product.products[21]);
//             //       cartController.clothesInitrkvalue(Product.products[22]);
//             //       cartController.clothesInitrkvalue(Product.products[23]);
//             //       cartController.clothesInitrkvalue(Product.products[24]);
//             //       cartController.clothesInitrkvalue(Product.products[25]);
//             //       cartController.clothesInitrkvalue(Product.products[26]);
//             //       cartController.clothesInitrkvalue(Product.products[27]);
//             //       cartController.clothesInitrkvalue(Product.products[28]);
//             //       cartController.clothesInitrkvalue(Product.products[29]);
//             //       cartController.clothesInitrkvalue(Product.products[30]);
//             //       cartController.clothesInitrkvalue(Product.products[31]);
//             //
//             //       // cartController.clothesDropOutInitrkvalueExpress(Product.products[16]);
//             //       // cartController.clothesDropOutInitrkvalueExpress(Product.products[17]);
//             //       // cartController.clothesDropOutInitrkvalueExpress(Product.products[18]);
//             //       // cartController.clothesDropOutInitrkvalueExpress(Product.products[19]);
//             //       // cartController.clothesDropOutInitrkvalueExpress(Product.products[20]);
//             //       // cartController.clothesDropOutInitrkvalueExpress(Product.products[21]);
//             //       // cartController.clothesDropOutInitrkvalueExpress(Product.products[22]);
//             //       // cartController.clothesDropOutInitrkvalueExpress(Product.products[23]);
//             //       // cartController.clothesDropOutInitrkvalueExpress(Product.products[24]);
//             //       // cartController.clothesDropOutInitrkvalueExpress(Product.products[25]);
//             //       // cartController.clothesDropOutInitrkvalueExpress(Product.products[26]);
//             //       // cartController.clothesDropOutInitrkvalueExpress(Product.products[27]);
//             //       // cartController.clothesDropOutInitrkvalueExpress(Product.products[28]);
//             //       // cartController.clothesDropOutInitrkvalueExpress(Product.products[29]);
//             //       // cartController.clothesDropOutInitrkvalueExpress(Product.products[30]);
//             //       // cartController.clothesDropOutInitrkvalueExpress(Product.products[31]);
//             //
//             //       cartController.specialInitrkvalue(Product.products[33]);
//             //
//             //       cartController.accessoriesInitrkvalue(Product.products[39]);
//             //       cartController.accessoriesInitrkvalue(Product.products[40]);
//             //       cartController.accessoriesInitrkvalue(Product.products[41]);
//             //       cartController.accessoriesInitrkvalue(Product.products[42]);
//             //       cartController.accessoriesInitrkvalue(Product.products[43]);
//             //
//             //       cartController.bathInitrkvalue(Product.products[47]);
//             //       cartController.bathInitrkvalue(Product.products[48]);
//             //       cartController.bathInitrkvalue(Product.products[49]);
//             //
//             //       cartController.beddingInitrkvalue(Product.products[57]);
//             //       cartController.beddingInitrkvalue(Product.products[58]);
//             //       cartController.beddingInitrkvalue(Product.products[59]);
//             //       cartController.beddingInitrkvalue(Product.products[60]);
//             //       cartController.beddingInitrkvalue(Product.products[61]);
//             //       cartController.beddingInitrkvalue(Product.products[62]);
//             //       cartController.beddingInitrkvalue(Product.products[63]);
//             //
//             //       cartController.othersInitrkvalue(Product.products[67]);
//             //       cartController.othersInitrkvalue(Product.products[68]);
//             //       cartController.othersInitrkvalue(Product.products[69]);
//             //
//             //
//             //
//             //
//             //       //for super express screen
//             //       cartController.clothesInitrkvalue(Product.products[70]);
//             //       cartController.clothesInitrkvalue(Product.products[71]);
//             //       cartController.clothesInitrkvalue(Product.products[72]);
//             //       cartController.clothesInitrkvalue(Product.products[73]);
//             //       cartController.clothesInitrkvalue(Product.products[74]);
//             //       cartController.clothesInitrkvalue(Product.products[75]);
//             //       cartController.clothesInitrkvalue(Product.products[76]);
//             //       cartController.clothesInitrkvalue(Product.products[77]);
//             //       cartController.clothesInitrkvalue(Product.products[78]);
//             //       cartController.clothesInitrkvalue(Product.products[79]);
//             //       cartController.clothesInitrkvalue(Product.products[80]);
//             //       cartController.clothesInitrkvalue(Product.products[81]);
//             //       cartController.clothesInitrkvalue(Product.products[82]);
//             //       cartController.clothesInitrkvalue(Product.products[83]);
//             //       cartController.clothesInitrkvalue(Product.products[84]);
//             //       cartController.clothesInitrkvalue(Product.products[85]);
//             //
//             //       cartController.specialInitrkvalue(Product.products[86]);
//             //
//             //       cartController.accessoriesInitrkvalue(Product.products[87]);
//             //       cartController.accessoriesInitrkvalue(Product.products[88]);
//             //       cartController.accessoriesInitrkvalue(Product.products[89]);
//             //       cartController.accessoriesInitrkvalue(Product.products[90]);
//             //       cartController.accessoriesInitrkvalue(Product.products[91]);
//             //
//             //       cartController.bathInitrkvalue(Product.products[92]);
//             //       cartController.bathInitrkvalue(Product.products[93]);
//             //       cartController.bathInitrkvalue(Product.products[94]);
//             //
//             //       cartController.beddingInitrkvalue(Product.products[95]);
//             //       cartController.beddingInitrkvalue(Product.products[96]);
//             //       cartController.beddingInitrkvalue(Product.products[97]);
//             //       cartController.beddingInitrkvalue(Product.products[98]);
//             //       cartController.beddingInitrkvalue(Product.products[99]);
//             //       cartController.beddingInitrkvalue(Product.products[100]);
//             //       cartController.beddingInitrkvalue(Product.products[101]);
//             //
//             //       cartController.othersInitrkvalue(Product.products[102]);
//             //       cartController.othersInitrkvalue(Product.products[103]);
//             //       cartController.othersInitrkvalue(Product.products[104]);
//             //
//             //       // Navigator.of(context).push(
//             //       //     MaterialPageRoute(builder: (builder) => CartScreen()));
//             //     },
//             //     // onPressed: () => Get.to(() => CartScreen()),
//             //     color: Colors.yellow,
//             //     height: 55.0,
//             //     child: Text(
//             //       "MON PANIER",
//             //       style: const TextStyle(
//             //         fontWeight: FontWeight.bold,
//             //         fontSize: 14.0,
//             //         color: Colors.black,
//             //       ),
//             //     ),
//             //   ),
//             // ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class ShowExpressProductsList extends StatelessWidget {
//   ShowExpressProductsList({Key? key}) : super(key: key);
//   final cart_Controller = Get.put(CartController());
//
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Row(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
//                     child: ShowPicture(Product.products[0].photo),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                     child: Text(
//                       'Vêtements (express)',
//                       style: const TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 21.0,
//                       ),
//                     ),
//                   ),
//                   const Spacer(),
//                   IconButton(
//                     onPressed: () {
//                       cart_Controller.InitCounter(Product.products[16]);
//                       cart_Controller.InitCounter(Product.products[17]);
//                       cart_Controller.InitCounter(Product.products[18]);
//                       cart_Controller.InitCounter(Product.products[19]);
//                       cart_Controller.InitCounter(Product.products[20]);
//                       cart_Controller.InitCounter(Product.products[21]);
//                       cart_Controller.InitCounter(Product.products[22]);
//                       cart_Controller.InitCounter(Product.products[23]);
//                       cart_Controller.InitCounter(Product.products[24]);
//                       cart_Controller.InitCounter(Product.products[25]);
//                       cart_Controller.InitCounter(Product.products[26]);
//                       cart_Controller.InitCounter(Product.products[27]);
//                       cart_Controller.InitCounter(Product.products[28]);
//                       cart_Controller.InitCounter(Product.products[29]);
//                       cart_Controller.InitCounter(Product.products[30]);
//                       cart_Controller.InitCounter(Product.products[31]);
//
//                       cart_Controller.clothesInitRealCounter(Product.products[16]);
//                       cart_Controller.clothesInitRealCounter(Product.products[17]);
//                       cart_Controller.clothesInitRealCounter(Product.products[18]);
//                       cart_Controller.clothesInitRealCounter(Product.products[19]);
//                       cart_Controller.clothesInitRealCounter(Product.products[20]);
//                       cart_Controller.clothesInitRealCounter(Product.products[21]);
//                       cart_Controller.clothesInitRealCounter(Product.products[22]);
//                       cart_Controller.clothesInitRealCounter(Product.products[23]);
//                       cart_Controller.clothesInitRealCounter(Product.products[24]);
//                       cart_Controller.clothesInitRealCounter(Product.products[25]);
//                       cart_Controller.clothesInitRealCounter(Product.products[26]);
//                       cart_Controller.clothesInitRealCounter(Product.products[27]);
//                       cart_Controller.clothesInitRealCounter(Product.products[28]);
//                       cart_Controller.clothesInitRealCounter(Product.products[29]);
//                       cart_Controller.clothesInitRealCounter(Product.products[30]);
//                       cart_Controller.clothesInitRealCounter(Product.products[31]);
//
//                       Navigator.of(context).push(MaterialPageRoute(builder: (builder) => ShowClothesExpress()));
//                     },
//                     icon: Icon(Icons.add_box_rounded),
//                   )
//                 ]
//             ),
//             Divider(),
//             Row(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
//                     child: ShowPicture(Product.products[32].photo),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                     child: Text(
//                       'Spécial (express)',
//                       style: const TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 21.0,
//                       ),
//                     ),
//                   ),
//                   const Spacer(),
//                   IconButton(
//                       icon: Icon(Icons.add_box_rounded),
//                       onPressed: () {
//                         cart_Controller.specialInitCounter(Product.products[33]);
//                         cart_Controller.specialInitRealCounter(Product.products[33]);
//                         Navigator.of(context).push(MaterialPageRoute(builder: (builder) => ShowSpecialExpress()));
//                       }
//                   )
//                 ]
//             ),
//             Divider(),
//             Row(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
//                     child: ShowPicture(Product.products[34].photo),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                     child: Text(
//                       'Accessoires (express)',
//                       style: const TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 21.0,
//                       ),
//                     ),
//                   ),
//                   const Spacer(),
//                   IconButton(
//                       icon: Icon(Icons.add_box_rounded),
//                       onPressed: () {
//                         cart_Controller.accessoriesInitCounter(Product.products[39]);
//                         cart_Controller.accessoriesInitCounter(Product.products[40]);
//                         cart_Controller.accessoriesInitCounter(Product.products[41]);
//                         cart_Controller.accessoriesInitCounter(Product.products[42]);
//                         cart_Controller.accessoriesInitCounter(Product.products[43]);
//
//                         cart_Controller.accessoriesInitRealCounter(Product.products[39]);
//                         cart_Controller.accessoriesInitRealCounter(Product.products[40]);
//                         cart_Controller.accessoriesInitRealCounter(Product.products[41]);
//                         cart_Controller.accessoriesInitRealCounter(Product.products[42]);
//                         cart_Controller.accessoriesInitRealCounter(Product.products[43]);
//                         Navigator.of(context).push(MaterialPageRoute(builder: (builder) => ShowAccessoriesExpress()));
//                       }
//                   )
//                 ]
//             ),
//             Divider(),
//             Row(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
//                     child: ShowPicture(Product.products[44].photo),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                     child: Text(
//                       'Bain (express)',
//                       style: const TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 21.0,
//                       ),
//                     ),
//                   ),
//                   const Spacer(),
//                   IconButton(
//                       icon: Icon(Icons.add_box_rounded),
//                       onPressed: () {
//                         cart_Controller.bathInitCounter(Product.products[47]);
//                         cart_Controller.bathInitCounter(Product.products[48]);
//                         cart_Controller.bathInitCounter(Product.products[49]);
//
//                         cart_Controller.bathInitRealCounter(Product.products[47]);
//                         cart_Controller.bathInitRealCounter(Product.products[48]);
//                         cart_Controller.bathInitRealCounter(Product.products[49]);
//                         Navigator.of(context).push(MaterialPageRoute(builder: (builder) => ShowBainExpress()));
//                       }
//                   )
//                 ]
//             ),
//             Divider(),
//             Row(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
//                     child: ShowPicture(Product.products[50].photo),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                     child: Text(
//                       'Literie (express)',
//                       style: const TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 21.0,
//                       ),
//                     ),
//                   ),
//                   const Spacer(),
//                   IconButton(
//                       icon: Icon(Icons.add_box_rounded),
//                       onPressed: () {
//                         cart_Controller.beddingInitCounter(Product.products[57]);
//                         cart_Controller.beddingInitCounter(Product.products[58]);
//                         cart_Controller.beddingInitCounter(Product.products[59]);
//                         cart_Controller.beddingInitCounter(Product.products[60]);
//                         cart_Controller.beddingInitCounter(Product.products[61]);
//                         cart_Controller.beddingInitCounter(Product.products[62]);
//                         cart_Controller.beddingInitCounter(Product.products[63]);
//
//                         cart_Controller.beddingInitRealCounter(Product.products[57]);
//                         cart_Controller.beddingInitRealCounter(Product.products[58]);
//                         cart_Controller.beddingInitRealCounter(Product.products[59]);
//                         cart_Controller.beddingInitRealCounter(Product.products[60]);
//                         cart_Controller.beddingInitRealCounter(Product.products[61]);
//                         cart_Controller.beddingInitRealCounter(Product.products[62]);
//                         cart_Controller.beddingInitRealCounter(Product.products[63]);
//                         Navigator.of(context).push(MaterialPageRoute(builder: (builder) => ShowLiterieExpress()));
//                       }
//                   )
//                 ]
//             ),
//             Divider(),
//             Row(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
//                     child: ShowPicture(Product.products[64].photo),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                     child: Text(
//                       'Autre (express)',
//                       style: const TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 21.0,
//                       ),
//                     ),
//                   ),
//                   const Spacer(),
//                   IconButton(
//                       icon: Icon(Icons.add_box_rounded),
//                       onPressed: () {
//                         cart_Controller.othersInitCounter(Product.products[67]);
//                         cart_Controller.othersInitCounter(Product.products[68]);
//                         cart_Controller.othersInitCounter(Product.products[69]);
//
//                         cart_Controller.othersInitRealCounter(Product.products[67]);
//                         cart_Controller.othersInitRealCounter(Product.products[68]);
//                         cart_Controller.othersInitRealCounter(Product.products[69]);
//                         Navigator.of(context).push(MaterialPageRoute(builder: (builder) => ShowAutreExpress()));
//                       }
//                   )
//                 ]
//             ),
//             Divider(),
//             const SizedBox(height: 40.0),
//             // CartButton(),
//             // Center(
//             //   child: MaterialButton(
//             //     onPressed: () {
//             //       Navigator.of(context).push(
//             //       MaterialPageRoute(builder: (builder) => CartScreen()));
//             //       cartController.ifsigned();
//             //       //for normal screen
//             //       cartController.clothesInitrkvalue(Product.products[0]);
//             //       cartController.clothesInitrkvalue(Product.products[1]);
//             //       cartController.clothesInitrkvalue(Product.products[2]);
//             //       cartController.clothesInitrkvalue(Product.products[3]);
//             //       cartController.clothesInitrkvalue(Product.products[4]);
//             //       cartController.clothesInitrkvalue(Product.products[5]);
//             //       cartController.clothesInitrkvalue(Product.products[6]);
//             //       cartController.clothesInitrkvalue(Product.products[7]);
//             //       cartController.clothesInitrkvalue(Product.products[8]);
//             //       cartController.clothesInitrkvalue(Product.products[9]);
//             //       cartController.clothesInitrkvalue(Product.products[10]);
//             //       cartController.clothesInitrkvalue(Product.products[11]);
//             //       cartController.clothesInitrkvalue(Product.products[12]);
//             //       cartController.clothesInitrkvalue(Product.products[13]);
//             //       cartController.clothesInitrkvalue(Product.products[14]);
//             //       cartController.clothesInitrkvalue(Product.products[15]);
//             //
//             //       cartController.specialInitrkvalue(Product.products[32]);
//             //
//             //       cartController.accessoriesInitrkvalue(Product.products[34]);
//             //       cartController.accessoriesInitrkvalue(Product.products[35]);
//             //       cartController.accessoriesInitrkvalue(Product.products[36]);
//             //       cartController.accessoriesInitrkvalue(Product.products[37]);
//             //       cartController.accessoriesInitrkvalue(Product.products[38]);
//             //
//             //       cartController.bathInitrkvalue(Product.products[44]);
//             //       cartController.bathInitrkvalue(Product.products[45]);
//             //       cartController.bathInitrkvalue(Product.products[46]);
//             //
//             //       cartController.beddingInitrkvalue(Product.products[50]);
//             //       cartController.beddingInitrkvalue(Product.products[51]);
//             //       cartController.beddingInitrkvalue(Product.products[52]);
//             //       cartController.beddingInitrkvalue(Product.products[53]);
//             //       cartController.beddingInitrkvalue(Product.products[54]);
//             //       cartController.beddingInitrkvalue(Product.products[55]);
//             //       cartController.beddingInitrkvalue(Product.products[56]);
//             //
//             //       cartController.othersInitrkvalue(Product.products[64]);
//             //       cartController.othersInitrkvalue(Product.products[65]);
//             //       cartController.othersInitrkvalue(Product.products[66]);
//             //
//             //
//             //       //for express screen
//             //       cartController.clothesInitrkvalue(Product.products[16]);
//             //       cartController.clothesInitrkvalue(Product.products[17]);
//             //       cartController.clothesInitrkvalue(Product.products[18]);
//             //       cartController.clothesInitrkvalue(Product.products[19]);
//             //       cartController.clothesInitrkvalue(Product.products[20]);
//             //       cartController.clothesInitrkvalue(Product.products[21]);
//             //       cartController.clothesInitrkvalue(Product.products[22]);
//             //       cartController.clothesInitrkvalue(Product.products[23]);
//             //       cartController.clothesInitrkvalue(Product.products[24]);
//             //       cartController.clothesInitrkvalue(Product.products[25]);
//             //       cartController.clothesInitrkvalue(Product.products[26]);
//             //       cartController.clothesInitrkvalue(Product.products[27]);
//             //       cartController.clothesInitrkvalue(Product.products[28]);
//             //       cartController.clothesInitrkvalue(Product.products[29]);
//             //       cartController.clothesInitrkvalue(Product.products[30]);
//             //       cartController.clothesInitrkvalue(Product.products[31]);
//             //
//             //       // cartController.clothesDropOutInitrkvalueExpress(Product.products[16]);
//             //       // cartController.clothesDropOutInitrkvalueExpress(Product.products[17]);
//             //       // cartController.clothesDropOutInitrkvalueExpress(Product.products[18]);
//             //       // cartController.clothesDropOutInitrkvalueExpress(Product.products[19]);
//             //       // cartController.clothesDropOutInitrkvalueExpress(Product.products[20]);
//             //       // cartController.clothesDropOutInitrkvalueExpress(Product.products[21]);
//             //       // cartController.clothesDropOutInitrkvalueExpress(Product.products[22]);
//             //       // cartController.clothesDropOutInitrkvalueExpress(Product.products[23]);
//             //       // cartController.clothesDropOutInitrkvalueExpress(Product.products[24]);
//             //       // cartController.clothesDropOutInitrkvalueExpress(Product.products[25]);
//             //       // cartController.clothesDropOutInitrkvalueExpress(Product.products[26]);
//             //       // cartController.clothesDropOutInitrkvalueExpress(Product.products[27]);
//             //       // cartController.clothesDropOutInitrkvalueExpress(Product.products[28]);
//             //       // cartController.clothesDropOutInitrkvalueExpress(Product.products[29]);
//             //       // cartController.clothesDropOutInitrkvalueExpress(Product.products[30]);
//             //       // cartController.clothesDropOutInitrkvalueExpress(Product.products[31]);
//             //
//             //       cartController.specialInitrkvalue(Product.products[33]);
//             //
//             //       cartController.accessoriesInitrkvalue(Product.products[39]);
//             //       cartController.accessoriesInitrkvalue(Product.products[40]);
//             //       cartController.accessoriesInitrkvalue(Product.products[41]);
//             //       cartController.accessoriesInitrkvalue(Product.products[42]);
//             //       cartController.accessoriesInitrkvalue(Product.products[43]);
//             //
//             //       cartController.bathInitrkvalue(Product.products[47]);
//             //       cartController.bathInitrkvalue(Product.products[48]);
//             //       cartController.bathInitrkvalue(Product.products[49]);
//             //
//             //       cartController.beddingInitrkvalue(Product.products[57]);
//             //       cartController.beddingInitrkvalue(Product.products[58]);
//             //       cartController.beddingInitrkvalue(Product.products[59]);
//             //       cartController.beddingInitrkvalue(Product.products[60]);
//             //       cartController.beddingInitrkvalue(Product.products[61]);
//             //       cartController.beddingInitrkvalue(Product.products[62]);
//             //       cartController.beddingInitrkvalue(Product.products[63]);
//             //
//             //       cartController.othersInitrkvalue(Product.products[67]);
//             //       cartController.othersInitrkvalue(Product.products[68]);
//             //       cartController.othersInitrkvalue(Product.products[69]);
//             //
//             //
//             //
//             //
//             //       //for super express screen
//             //       cartController.clothesInitrkvalue(Product.products[70]);
//             //       cartController.clothesInitrkvalue(Product.products[71]);
//             //       cartController.clothesInitrkvalue(Product.products[72]);
//             //       cartController.clothesInitrkvalue(Product.products[73]);
//             //       cartController.clothesInitrkvalue(Product.products[74]);
//             //       cartController.clothesInitrkvalue(Product.products[75]);
//             //       cartController.clothesInitrkvalue(Product.products[76]);
//             //       cartController.clothesInitrkvalue(Product.products[77]);
//             //       cartController.clothesInitrkvalue(Product.products[78]);
//             //       cartController.clothesInitrkvalue(Product.products[79]);
//             //       cartController.clothesInitrkvalue(Product.products[80]);
//             //       cartController.clothesInitrkvalue(Product.products[81]);
//             //       cartController.clothesInitrkvalue(Product.products[82]);
//             //       cartController.clothesInitrkvalue(Product.products[83]);
//             //       cartController.clothesInitrkvalue(Product.products[84]);
//             //       cartController.clothesInitrkvalue(Product.products[85]);
//             //
//             //       cartController.specialInitrkvalue(Product.products[86]);
//             //
//             //       cartController.accessoriesInitrkvalue(Product.products[87]);
//             //       cartController.accessoriesInitrkvalue(Product.products[88]);
//             //       cartController.accessoriesInitrkvalue(Product.products[89]);
//             //       cartController.accessoriesInitrkvalue(Product.products[90]);
//             //       cartController.accessoriesInitrkvalue(Product.products[91]);
//             //
//             //       cartController.bathInitrkvalue(Product.products[92]);
//             //       cartController.bathInitrkvalue(Product.products[93]);
//             //       cartController.bathInitrkvalue(Product.products[94]);
//             //
//             //       cartController.beddingInitrkvalue(Product.products[95]);
//             //       cartController.beddingInitrkvalue(Product.products[96]);
//             //       cartController.beddingInitrkvalue(Product.products[97]);
//             //       cartController.beddingInitrkvalue(Product.products[98]);
//             //       cartController.beddingInitrkvalue(Product.products[99]);
//             //       cartController.beddingInitrkvalue(Product.products[100]);
//             //       cartController.beddingInitrkvalue(Product.products[101]);
//             //
//             //       cartController.othersInitrkvalue(Product.products[102]);
//             //       cartController.othersInitrkvalue(Product.products[103]);
//             //       cartController.othersInitrkvalue(Product.products[104]);
//             //
//             //     //   Navigator.of(context).push(
//             //     //       MaterialPageRoute(builder: (builder) => CartScreen()));
//             //     },
//             //     // onPressed: () => Get.to(() => CartScreen()),
//             //     color: Colors.yellow,
//             //     height: 55.0,
//             //     child: Text(
//             //       "MON PANIER",
//             //       style: const TextStyle(
//             //         fontWeight: FontWeight.bold,
//             //         fontSize: 14.0,
//             //         color: Colors.black,
//             //       ),
//             //     ),
//             //   ),
//             // ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class ShowSuperExpressProductsList extends StatelessWidget {
//   ShowSuperExpressProductsList({Key? key}) : super(key: key);
//   final cart_Controller = Get.put(CartController());
//
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Row(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
//                     child: ShowPicture(Product.products[0].photo),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                     child: Text(
//                       'Vêtements (super express)',
//                       style: const TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 21.0,
//                       ),
//                     ),
//                   ),
//                   const Spacer(),
//                   IconButton(
//                     onPressed: () {
//                       cart_Controller.InitCounter(Product.products[70]);
//                       cart_Controller.InitCounter(Product.products[71]);
//                       cart_Controller.InitCounter(Product.products[72]);
//                       cart_Controller.InitCounter(Product.products[73]);
//                       cart_Controller.InitCounter(Product.products[74]);
//                       cart_Controller.InitCounter(Product.products[75]);
//                       cart_Controller.InitCounter(Product.products[76]);
//                       cart_Controller.InitCounter(Product.products[77]);
//                       cart_Controller.InitCounter(Product.products[78]);
//                       cart_Controller.InitCounter(Product.products[79]);
//                       cart_Controller.InitCounter(Product.products[80]);
//                       cart_Controller.InitCounter(Product.products[81]);
//                       cart_Controller.InitCounter(Product.products[82]);
//                       cart_Controller.InitCounter(Product.products[83]);
//                       cart_Controller.InitCounter(Product.products[84]);
//                       cart_Controller.InitCounter(Product.products[85]);
//
//                       cart_Controller.clothesInitRealCounter(Product.products[70]);
//                       cart_Controller.clothesInitRealCounter(Product.products[71]);
//                       cart_Controller.clothesInitRealCounter(Product.products[72]);
//                       cart_Controller.clothesInitRealCounter(Product.products[73]);
//                       cart_Controller.clothesInitRealCounter(Product.products[74]);
//                       cart_Controller.clothesInitRealCounter(Product.products[75]);
//                       cart_Controller.clothesInitRealCounter(Product.products[76]);
//                       cart_Controller.clothesInitRealCounter(Product.products[77]);
//                       cart_Controller.clothesInitRealCounter(Product.products[78]);
//                       cart_Controller.clothesInitRealCounter(Product.products[79]);
//                       cart_Controller.clothesInitRealCounter(Product.products[80]);
//                       cart_Controller.clothesInitRealCounter(Product.products[81]);
//                       cart_Controller.clothesInitRealCounter(Product.products[82]);
//                       cart_Controller.clothesInitRealCounter(Product.products[83]);
//                       cart_Controller.clothesInitRealCounter(Product.products[84]);
//                       cart_Controller.clothesInitRealCounter(Product.products[85]);
//
//                       Navigator.of(context).push(MaterialPageRoute(builder: (builder) => ShowClothesSuperExpress()));
//                     },
//                     icon: Icon(Icons.add_box_rounded),
//                   )
//                 ]
//             ),
//             Divider(),
//             Row(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
//                     child: ShowPicture(Product.products[32].photo),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                     child: Text(
//                       'Spécial (super express)',
//                       style: const TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 21.0,
//                       ),
//                     ),
//                   ),
//                   const Spacer(),
//                   IconButton(
//                       icon: Icon(Icons.add_box_rounded),
//                       onPressed: () {
//                         cart_Controller.specialInitCounter(Product.products[86]);
//                         cart_Controller.specialInitRealCounter(Product.products[86]);
//                         Navigator.of(context).push(MaterialPageRoute(builder: (builder) => ShowSpecialSuperExpress()));
//                       }
//                   )
//                 ]
//             ),
//             Divider(),
//             Row(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
//                     child: ShowPicture(Product.products[34].photo),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                     child: Text(
//                       'Accessoires (super express)',
//                       style: const TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 21.0,
//                       ),
//                     ),
//                   ),
//                   const Spacer(),
//                   IconButton(
//                       icon: Icon(Icons.add_box_rounded),
//                       onPressed: () {
//                         cart_Controller.accessoriesInitCounter(Product.products[87]);
//                         cart_Controller.accessoriesInitCounter(Product.products[88]);
//                         cart_Controller.accessoriesInitCounter(Product.products[89]);
//                         cart_Controller.accessoriesInitCounter(Product.products[90]);
//                         cart_Controller.accessoriesInitCounter(Product.products[91]);
//
//                         cart_Controller.accessoriesInitRealCounter(Product.products[87]);
//                         cart_Controller.accessoriesInitRealCounter(Product.products[88]);
//                         cart_Controller.accessoriesInitRealCounter(Product.products[89]);
//                         cart_Controller.accessoriesInitRealCounter(Product.products[90]);
//                         cart_Controller.accessoriesInitRealCounter(Product.products[91]);
//                         Navigator.of(context).push(MaterialPageRoute(builder: (builder) => ShowAccessoriesSuperExpress()));
//                       }
//                   )
//                 ]
//             ),
//             Divider(),
//             Row(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
//                     child: ShowPicture(Product.products[44].photo),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                     child: Text(
//                       'Bain (super express)',
//                       style: const TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 21.0,
//                       ),
//                     ),
//                   ),
//                   const Spacer(),
//                   IconButton(
//                       icon: Icon(Icons.add_box_rounded),
//                       onPressed: () {
//                         cart_Controller.bathInitCounter(Product.products[92]);
//                         cart_Controller.bathInitCounter(Product.products[93]);
//                         cart_Controller.bathInitCounter(Product.products[94]);
//
//                         cart_Controller.bathInitRealCounter(Product.products[92]);
//                         cart_Controller.bathInitRealCounter(Product.products[93]);
//                         cart_Controller.bathInitRealCounter(Product.products[94]);
//                         Navigator.of(context).push(MaterialPageRoute(builder: (builder) => ShowBainSuperExpress()));
//                       }
//                   )
//                 ]
//             ),
//             Divider(),
//             Row(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
//                     child: ShowPicture(Product.products[50].photo),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                     child: Text(
//                       'Literie (super express)',
//                       style: const TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 21.0,
//                       ),
//                     ),
//                   ),
//                   const Spacer(),
//                   IconButton(
//                       icon: Icon(Icons.add_box_rounded),
//                       onPressed: () {
//                         cart_Controller.beddingInitCounter(Product.products[95]);
//                         cart_Controller.beddingInitCounter(Product.products[96]);
//                         cart_Controller.beddingInitCounter(Product.products[97]);
//                         cart_Controller.beddingInitCounter(Product.products[98]);
//                         cart_Controller.beddingInitCounter(Product.products[99]);
//                         cart_Controller.beddingInitCounter(Product.products[100]);
//                         cart_Controller.beddingInitCounter(Product.products[101]);
//
//                         cart_Controller.beddingInitRealCounter(Product.products[95]);
//                         cart_Controller.beddingInitRealCounter(Product.products[96]);
//                         cart_Controller.beddingInitRealCounter(Product.products[97]);
//                         cart_Controller.beddingInitRealCounter(Product.products[98]);
//                         cart_Controller.beddingInitRealCounter(Product.products[99]);
//                         cart_Controller.beddingInitRealCounter(Product.products[100]);
//                         cart_Controller.beddingInitRealCounter(Product.products[101]);
//                         Navigator.of(context).push(MaterialPageRoute(builder: (builder) => ShowLiterieSuperExpress()));
//                       }
//                   )
//                 ]
//             ),
//             Divider(),
//             Row(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
//                     child: ShowPicture(Product.products[64].photo),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                     child: Text(
//                       'Autre (super express)',
//                       style: const TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 21.0,
//                       ),
//                     ),
//                   ),
//                   Spacer(),
//                   IconButton(
//                       icon: Icon(Icons.add_box_rounded),
//                       onPressed: () {
//                         cart_Controller.othersInitCounter(Product.products[102]);
//                         cart_Controller.othersInitCounter(Product.products[103]);
//                         cart_Controller.othersInitCounter(Product.products[104]);
//
//                         cart_Controller.othersInitRealCounter(Product.products[102]);
//                         cart_Controller.othersInitRealCounter(Product.products[103]);
//                         cart_Controller.othersInitRealCounter(Product.products[104]);
//                         Navigator.of(context).push(MaterialPageRoute(builder: (builder) => ShowAutreSuperExpress()));
//                       }
//                   )
//                 ]
//             ),
//             Divider(),
//             const SizedBox(height: 40.0),
//             // CartButton(),
//             // Center(
//             //   child: MaterialButton(
//             //     onPressed: () {
//             //       Navigator.of(context).push(
//             //           MaterialPageRoute(builder: (builder) => CartScreen()));
//             //       cartController.ifsigned();
//             //       //for normal screen
//             //       cartController.clothesInitrkvalue(Product.products[0]);
//             //       cartController.clothesInitrkvalue(Product.products[1]);
//             //       cartController.clothesInitrkvalue(Product.products[2]);
//             //       cartController.clothesInitrkvalue(Product.products[3]);
//             //       cartController.clothesInitrkvalue(Product.products[4]);
//             //       cartController.clothesInitrkvalue(Product.products[5]);
//             //       cartController.clothesInitrkvalue(Product.products[6]);
//             //       cartController.clothesInitrkvalue(Product.products[7]);
//             //       cartController.clothesInitrkvalue(Product.products[8]);
//             //       cartController.clothesInitrkvalue(Product.products[9]);
//             //       cartController.clothesInitrkvalue(Product.products[10]);
//             //       cartController.clothesInitrkvalue(Product.products[11]);
//             //       cartController.clothesInitrkvalue(Product.products[12]);
//             //       cartController.clothesInitrkvalue(Product.products[13]);
//             //       cartController.clothesInitrkvalue(Product.products[14]);
//             //       cartController.clothesInitrkvalue(Product.products[15]);
//             //
//             //       cartController.specialInitrkvalue(Product.products[32]);
//             //
//             //       cartController.accessoriesInitrkvalue(Product.products[34]);
//             //       cartController.accessoriesInitrkvalue(Product.products[35]);
//             //       cartController.accessoriesInitrkvalue(Product.products[36]);
//             //       cartController.accessoriesInitrkvalue(Product.products[37]);
//             //       cartController.accessoriesInitrkvalue(Product.products[38]);
//             //
//             //       cartController.bathInitrkvalue(Product.products[44]);
//             //       cartController.bathInitrkvalue(Product.products[45]);
//             //       cartController.bathInitrkvalue(Product.products[46]);
//             //
//             //       cartController.beddingInitrkvalue(Product.products[50]);
//             //       cartController.beddingInitrkvalue(Product.products[51]);
//             //       cartController.beddingInitrkvalue(Product.products[52]);
//             //       cartController.beddingInitrkvalue(Product.products[53]);
//             //       cartController.beddingInitrkvalue(Product.products[54]);
//             //       cartController.beddingInitrkvalue(Product.products[55]);
//             //       cartController.beddingInitrkvalue(Product.products[56]);
//             //
//             //       cartController.othersInitrkvalue(Product.products[64]);
//             //       cartController.othersInitrkvalue(Product.products[65]);
//             //       cartController.othersInitrkvalue(Product.products[66]);
//             //
//             //
//             //       //for express screen
//             //       cartController.clothesInitrkvalue(Product.products[16]);
//             //       cartController.clothesInitrkvalue(Product.products[17]);
//             //       cartController.clothesInitrkvalue(Product.products[18]);
//             //       cartController.clothesInitrkvalue(Product.products[19]);
//             //       cartController.clothesInitrkvalue(Product.products[20]);
//             //       cartController.clothesInitrkvalue(Product.products[21]);
//             //       cartController.clothesInitrkvalue(Product.products[22]);
//             //       cartController.clothesInitrkvalue(Product.products[23]);
//             //       cartController.clothesInitrkvalue(Product.products[24]);
//             //       cartController.clothesInitrkvalue(Product.products[25]);
//             //       cartController.clothesInitrkvalue(Product.products[26]);
//             //       cartController.clothesInitrkvalue(Product.products[27]);
//             //       cartController.clothesInitrkvalue(Product.products[28]);
//             //       cartController.clothesInitrkvalue(Product.products[29]);
//             //       cartController.clothesInitrkvalue(Product.products[30]);
//             //       cartController.clothesInitrkvalue(Product.products[31]);
//             //
//             //       // cartController.clothesDropOutInitrkvalueExpress(Product.products[16]);
//             //       // cartController.clothesDropOutInitrkvalueExpress(Product.products[17]);
//             //       // cartController.clothesDropOutInitrkvalueExpress(Product.products[18]);
//             //       // cartController.clothesDropOutInitrkvalueExpress(Product.products[19]);
//             //       // cartController.clothesDropOutInitrkvalueExpress(Product.products[20]);
//             //       // cartController.clothesDropOutInitrkvalueExpress(Product.products[21]);
//             //       // cartController.clothesDropOutInitrkvalueExpress(Product.products[22]);
//             //       // cartController.clothesDropOutInitrkvalueExpress(Product.products[23]);
//             //       // cartController.clothesDropOutInitrkvalueExpress(Product.products[24]);
//             //       // cartController.clothesDropOutInitrkvalueExpress(Product.products[25]);
//             //       // cartController.clothesDropOutInitrkvalueExpress(Product.products[26]);
//             //       // cartController.clothesDropOutInitrkvalueExpress(Product.products[27]);
//             //       // cartController.clothesDropOutInitrkvalueExpress(Product.products[28]);
//             //       // cartController.clothesDropOutInitrkvalueExpress(Product.products[29]);
//             //       // cartController.clothesDropOutInitrkvalueExpress(Product.products[30]);
//             //       // cartController.clothesDropOutInitrkvalueExpress(Product.products[31]);
//             //
//             //       cartController.specialInitrkvalue(Product.products[33]);
//             //
//             //       cartController.accessoriesInitrkvalue(Product.products[39]);
//             //       cartController.accessoriesInitrkvalue(Product.products[40]);
//             //       cartController.accessoriesInitrkvalue(Product.products[41]);
//             //       cartController.accessoriesInitrkvalue(Product.products[42]);
//             //       cartController.accessoriesInitrkvalue(Product.products[43]);
//             //
//             //       cartController.bathInitrkvalue(Product.products[47]);
//             //       cartController.bathInitrkvalue(Product.products[48]);
//             //       cartController.bathInitrkvalue(Product.products[49]);
//             //
//             //       cartController.beddingInitrkvalue(Product.products[57]);
//             //       cartController.beddingInitrkvalue(Product.products[58]);
//             //       cartController.beddingInitrkvalue(Product.products[59]);
//             //       cartController.beddingInitrkvalue(Product.products[60]);
//             //       cartController.beddingInitrkvalue(Product.products[61]);
//             //       cartController.beddingInitrkvalue(Product.products[62]);
//             //       cartController.beddingInitrkvalue(Product.products[63]);
//             //
//             //       cartController.othersInitrkvalue(Product.products[67]);
//             //       cartController.othersInitrkvalue(Product.products[68]);
//             //       cartController.othersInitrkvalue(Product.products[69]);
//             //
//             //
//             //
//             //
//             //       //for super express screen
//             //       cartController.clothesInitrkvalue(Product.products[70]);
//             //       cartController.clothesInitrkvalue(Product.products[71]);
//             //       cartController.clothesInitrkvalue(Product.products[72]);
//             //       cartController.clothesInitrkvalue(Product.products[73]);
//             //       cartController.clothesInitrkvalue(Product.products[74]);
//             //       cartController.clothesInitrkvalue(Product.products[75]);
//             //       cartController.clothesInitrkvalue(Product.products[76]);
//             //       cartController.clothesInitrkvalue(Product.products[77]);
//             //       cartController.clothesInitrkvalue(Product.products[78]);
//             //       cartController.clothesInitrkvalue(Product.products[79]);
//             //       cartController.clothesInitrkvalue(Product.products[80]);
//             //       cartController.clothesInitrkvalue(Product.products[81]);
//             //       cartController.clothesInitrkvalue(Product.products[82]);
//             //       cartController.clothesInitrkvalue(Product.products[83]);
//             //       cartController.clothesInitrkvalue(Product.products[84]);
//             //       cartController.clothesInitrkvalue(Product.products[85]);
//             //
//             //       cartController.specialInitrkvalue(Product.products[86]);
//             //
//             //       cartController.accessoriesInitrkvalue(Product.products[87]);
//             //       cartController.accessoriesInitrkvalue(Product.products[88]);
//             //       cartController.accessoriesInitrkvalue(Product.products[89]);
//             //       cartController.accessoriesInitrkvalue(Product.products[90]);
//             //       cartController.accessoriesInitrkvalue(Product.products[91]);
//             //
//             //       cartController.bathInitrkvalue(Product.products[92]);
//             //       cartController.bathInitrkvalue(Product.products[93]);
//             //       cartController.bathInitrkvalue(Product.products[94]);
//             //
//             //       cartController.beddingInitrkvalue(Product.products[95]);
//             //       cartController.beddingInitrkvalue(Product.products[96]);
//             //       cartController.beddingInitrkvalue(Product.products[97]);
//             //       cartController.beddingInitrkvalue(Product.products[98]);
//             //       cartController.beddingInitrkvalue(Product.products[99]);
//             //       cartController.beddingInitrkvalue(Product.products[100]);
//             //       cartController.beddingInitrkvalue(Product.products[101]);
//             //
//             //       cartController.othersInitrkvalue(Product.products[102]);
//             //       cartController.othersInitrkvalue(Product.products[103]);
//             //       cartController.othersInitrkvalue(Product.products[104]);
//             //
//             //       // Navigator.of(context).push(
//             //       //     MaterialPageRoute(builder: (builder) => CartScreen()));
//             //     },
//             //     // onPressed: () => Get.to(() => CartScreen()),
//             //     color: Colors.yellow,
//             //     height: 55.0,
//             //     child: Text(
//             //       "MON PANIER",
//             //       style: const TextStyle(
//             //         fontWeight: FontWeight.bold,
//             //         fontSize: 14.0,
//             //         color: Colors.black,
//             //       ),
//             //     ),
//             //   ),
//             // ),
//           ],
//         ),
//       ),
//     );
//   }
// }