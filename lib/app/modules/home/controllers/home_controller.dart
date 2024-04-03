import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:tugas7_1/app/data/food.dart';

class HomeController extends GetxController {
  CollectionReference ref = FirebaseFirestore.instance
      .collection('Food');

  final buttonText = [
    "All",
    "Makanan",
    "Kuah",
    "Minuman",
  ]; //variable untuk menampung data button

  final iconButton = [
    "assets/images/ic_makanan.png",
    "assets/images/ic_makanan.png",
    "assets/images/ic_kuah.png",
    "assets/images/ic_minuman.png"
  ];

  final selectedValueIndex =
      0.obs;

  Stream<List<Food>> readRecipe(String jenis) {
    if (jenis != "All") {
      return FirebaseFirestore.instance
          .collection('Food')
          .where('jenis', isEqualTo: jenis)
          .snapshots()
          .map((snapshot) =>
              snapshot.docs.map((doc) => Food.fromJson(doc.data())).toList());
    } else {
      return FirebaseFirestore.instance.collection('Food').snapshots().map(
          (snapshot) =>
              snapshot.docs.map((doc) => Food.fromJson(doc.data())).toList());
    }
  }

  Stream<List<Food>> searchFood(String search) {
    return FirebaseFirestore.instance
        .collection('Food')
        .where('nama', isGreaterThanOrEqualTo: search)
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => Food.fromJson(doc.data())).toList());
  }
}
