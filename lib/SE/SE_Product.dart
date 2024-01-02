import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_merchant/SE/SE_ProductDetail.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class SE_Product extends StatefulWidget {
  const SE_Product({Key? key}) : super(key: key);

  @override

  State<SE_Product> createState() => _SE_ProductState();
}

class _SE_ProductState extends State<SE_Product> {


  List _products = [];
  fetchProducts() async {
    var _firestoreInstance = FirebaseFirestore.instance;
    QuerySnapshot qn = await _firestoreInstance.collection("products").get();
    setState(() {
      for(int i=0; i<qn.docs.length;i++) {
        _products.add(
            {
              "product_Name": qn.docs[i]["name"],
              "product_Price": qn.docs[i]["price"],
              "product_Unit": qn.docs[i]["unit"],
              "product_Description": qn.docs[i]["description"],
              "product_Image": qn.docs[i]["img"],
            }
        );
      };
    });
  }

  @override
  void initState() {
    fetchProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Container(
            child: Column(
              children: [
                Expanded(
                    child: GridView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: _products.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 1),
                        itemBuilder: (_, index){
                          return GestureDetector(
                            onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (_)=>SE_ProductDetail(_products[index]))),
                            child: Card(
                              elevation: 5,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(24.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        AspectRatio(aspectRatio:2,
                                            child: Image.network(_products[index]["product_Image"])),
                                        SizedBox(height: 15),
                                        Text("${_products[index]["product_Name"]}",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        Text("৳"+_products[index]["product_Price"],
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                          ),
                                        ),

                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }
                    ),
                ),

              ],
            ),
          ),
        )
    );
  }
}

