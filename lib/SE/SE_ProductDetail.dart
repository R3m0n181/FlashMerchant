import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'SE_Menu.dart';

class SE_ProductDetail extends StatefulWidget {
  var _product;

  SE_ProductDetail(this._product);

  @override
  State<SE_ProductDetail> createState() => _SE_ProductDetailState();
}

class _SE_ProductDetailState extends State<SE_ProductDetail> {

  final TabStyle _tabStyle = TabStyle.reactCircle;

  get val => null;
  Future addToCart() async{
    final FirebaseAuth _auth = FirebaseAuth.instance;
    var currentUser = _auth.currentUser;
    CollectionReference _collectionRef = FirebaseFirestore.instance.collection("user-cart-items");
    return _collectionRef
        .doc(currentUser!.email)
        .collection("items")
        .doc()
        .set(
        {
          "name":widget._product["product_Name"],
          "price":widget._product["product_Price"],
          "image":widget._product["product_Image"],
        }
    ).then((value) => Navigator.push(context, MaterialPageRoute(builder: (context)=>SE_Menu()),),);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AspectRatio(aspectRatio:1,
                child: Image.network(widget._product["product_Image"])),
            SizedBox(height: 25),
            Text("${widget._product['product_Name']}",style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: Colors.black,
            ),),
            SizedBox(height: 5),
            Text("৳${widget._product['product_Price']}",style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.black,
              fontStyle: FontStyle.italic,
            ),),
            SizedBox(height: 20),
            Text("${widget._product['product_Description']}",style: TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),),
            Divider(),

          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        width: 1.sw,
        height: 56.h,
        child: ElevatedButton(
          onPressed: () =>addToCart(),
          child: Text(
            "Add to Cart",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.sp,
            ),
          ),
          style: ElevatedButton.styleFrom(
            primary: Colors.blueAccent,
            elevation: 5,
          ),
        ),
      )
    );
  }
}
