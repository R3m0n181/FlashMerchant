import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'SE_Menu.dart';

class SE_Checkout extends StatefulWidget {
  const SE_Checkout({Key? key}) : super(key: key);

  @override
  State<SE_Checkout> createState() => _SE_CheckoutState();
}

class _SE_CheckoutState extends State<SE_Checkout> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child:
          StreamBuilder(
          stream: FirebaseFirestore.instance.collection("user-cart-items").doc(FirebaseAuth.instance.currentUser!.email).collection("items").snapshots(),
          builder: (BuildContext, AsyncSnapshot <QuerySnapshot> snapshot){
            if(snapshot.hasData){
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (_, index){
                  DocumentSnapshot _documentSnapshot = snapshot.data!.docs[index];

                  return ListTile(
                    leading: Text(_documentSnapshot['name'],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                    trailing: Text("৳ ${_documentSnapshot['price']}",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.redAccent),),

                  );
                },

              );
            }
            else if(snapshot.hasError){
              const Text("No data");
            }
            return Center(
                child: CircularProgressIndicator()
            );
          },


        ),

      ),

      bottomNavigationBar: SizedBox(
      width: 1.sw,
      height: 56.h,
      child: ElevatedButton.icon(
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_)=>SE_Menu()),),
        label: const Text('Place Order           ৳'),
        style: ElevatedButton.styleFrom(
          primary: Colors.blueAccent,
          elevation: 5,
        ),
        icon: const Icon(Icons.shopping_cart),
      ),
    ),
    );
  }
}
