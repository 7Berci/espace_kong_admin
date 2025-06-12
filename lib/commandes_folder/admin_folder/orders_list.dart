// import 'package:flutter/material.dart';
// // ignore: depend_on_referenced_packages
// import 'package:provider/provider.dart';
// import '../auth_folder/utils.dart';
// import '../fetching_orders/orders.dart';
// import '../fetching_orders/orders_tile.dart';

// class OrdersList extends StatefulWidget {
//   const OrdersList({Key? key}) : super(key: key);

//   @override
//   State<OrdersList> createState() => _OrdersListState();
// }

// class _OrdersListState extends State<OrdersList> {
//   @override
//   Widget build(BuildContext context) {
//     Utils UtilsWidget = Utils();
//     final orders = Provider.of<List<Orders>?>(context);
//     return ListView.builder(
//         itemCount: orders?.length ?? 0,
//         itemBuilder: (context, index) {
//           return OrdersTile(orders: orders![index]);
//         });
//   }
// }
