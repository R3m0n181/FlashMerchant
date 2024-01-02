import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_merchant/SE/SE_Checkout.dart';
import 'package:flutter/material.dart';

class SE_Cart extends StatefulWidget {
  const SE_Cart({Key? key}) : super(key: key);

  @override
  State<SE_Cart> createState() => _SE_CartState();
}

class _SE_CartState extends State<SE_Cart> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("user-cart-items").doc(FirebaseAuth.instance.currentUser!.email).collection("items").snapshots(),
          builder: (BuildContext, AsyncSnapshot <QuerySnapshot> snapshot){
            if(snapshot.hasData){
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (_, index){
                  DocumentSnapshot _documentSnapshot = snapshot.data!.docs[index];
                  return Card(
                    elevation: 3,
                    child: ListTile(
                      leading: Text(_documentSnapshot['name'],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                      title: Text("৳ ${_documentSnapshot['price']}",style: TextStyle(fontWeight: FontWeight.bold, color: Colors.deepPurple),),
                      trailing: GestureDetector(
                        child: CircleAvatar(
                          child: Icon(Icons.remove_circle_sharp),
                        ),
                        onTap: (){
                          FirebaseFirestore.instance.collection("user-cart-items").doc(FirebaseAuth.instance.currentUser!.email).collection("items").doc(_documentSnapshot.id).delete();
                        },
                      ),
                    ),
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
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>SE_Checkout()),);
        },
        label: const Text('Checkout'),
        icon: const Icon(Icons.shopping_cart),
        backgroundColor: Colors.deepPurpleAccent,
      ),
    );
  }
}
