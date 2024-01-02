import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_merchant/SE/SE_Order.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SE_User extends StatefulWidget {
  const SE_User({Key? key}) : super(key: key);

  @override
  State<SE_User> createState() => _SE_UserState();
}

class _SE_UserState extends State<SE_User> {
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
                const Text('Md Wahidullah Remon',
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

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: SizedBox(
                    width: 1.sw,
                    height: 56.h,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                        MaterialPageRoute(builder: (context)=>SE_Order()),);},
                      child: Text(
                        "My Order",
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
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: SizedBox(
                    width: 1.sw,
                    height: 56.h,
                    child: ElevatedButton(
                      onPressed: () =>FirebaseAuth.instance.signOut(),
                      child: Text(
                        "Sign Out",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.sp,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.deepPurpleAccent,
                        elevation: 5,
                      ),
                    ),
                  )
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
