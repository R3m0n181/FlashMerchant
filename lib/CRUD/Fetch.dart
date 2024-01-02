import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  final CollectionReference ProductList = 
      FirebaseFirestore.instance.collection('Product');

  Future<void> CreateProductData(
      String name, String unit_price, String uid) async {
        return await ProductList.doc(uid).set({'Name': name, 'Unit Price': unit_price});
      }

  Future getProductList() async{
    List itemsList = [];

    try{
      await ProductList.get().then(
         (query) {
            query.docs.forEach(
              (element) {
                itemsList.add(element.data());
              }
            );
         }
      );
      return itemsList;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}