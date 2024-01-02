import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class D_User extends StatefulWidget {
  const D_User({Key? key}) : super(key: key);

  @override
  State<D_User> createState() => _D_UserState();
}

class _D_UserState extends State<D_User> {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8.0),
      children: [

        CircleAvatar(
          radius: 150,
          backgroundColor: Colors.white,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(150),
            child: Image.asset('assets/images/Remon.jpg'),
          ),
        ),

        SizedBox(
          height: 350,
          width: 100,
          child: Container(
            color: Colors.grey.shade200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Name: Md Wahidullah Remon',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: '',
                    fontSize: 20,
                  ),
                ),

                SizedBox(
                  height: 10,
                ),

                const Text('Age: 25',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),

                SizedBox(
                  height: 10,
                ),

                const Text('ID: 181014111',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),

                SizedBox(
                  height: 25,
                ),

                ButtonBar(
                  alignment: MainAxisAlignment.center,
                  children: <Widget>[
                    MaterialButton(
                      onPressed:(){
                        FirebaseAuth.instance.signOut();
                      },
                      color: Colors.blueAccent,
                      child: const Text('Sign Out',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
