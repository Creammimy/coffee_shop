// ignore_for_file: prefer_const_constructors

import 'package:coffee_shop/const.dart';
import 'package:coffee_shop/screens/Shop.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Column(
           //mainAxisAlignment: MainAxisAlignment.center,
          
          children: [
            // เพิ่มรูปภาพตรงนี้
            SizedBox(height: 150),
            Image.asset(
              'lib/images/home.png',  // เปลี่ยนเป็นที่ตั้งของรูปภาพของคุณ
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16),
            
            Text(
              'Coffee Shop',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
             SizedBox(height: 10),
             Text(
              'Good days start with Coffee <3',
              style: TextStyle(fontSize: 15),
            ),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                // นำผู้ใช้ไปยังหน้าถัดไป
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Shop()),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20), // ปรับขนาดปุ่ม
                primary: Color.fromARGB(255, 86, 66, 59), // สีน้ำตาล
                onPrimary: Colors.white, // สีตัวอักษรในปุ่ม
              ),
              child: Text('Buy Now'),
            ),
          ],
        ),
      ),
    );
  }
}
