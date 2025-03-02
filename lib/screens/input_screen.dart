// lib/screens/input_screen.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/nic_controller.dart';

class InputScreen extends StatelessWidget {
  final NICController nicController = Get.put(NICController());
  final TextEditingController nicInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "NIC Decoder",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue.shade800,
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue.shade800, Colors.blue.shade400],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Enter Your NIC Number",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: TextField(
                    controller: nicInputController,
                    decoration: InputDecoration(
                      labelText: "NIC Number",
                      labelStyle: TextStyle(
                        color: Colors.blue.shade800,
                        fontWeight: FontWeight.bold,
                      ),
                      border: InputBorder.none,
                      hintText: "e.g., 853400937V or 198534000937",
                      hintStyle: TextStyle(
                        color: Colors.grey.shade600,
                      ),
                    ),
                    style: TextStyle(
                      color: Colors.blue.shade900,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  if (nicInputController.text.isEmpty) {
                    Get.snackbar(
                      "Error",
                      "Please enter a NIC number",
                      backgroundColor: Colors.red.shade400,
                      colorText: Colors.white,
                      snackPosition: SnackPosition.BOTTOM,
                    );
                  } else if (nicInputController.text.length != 10 &&
                      nicInputController.text.length != 12) {
                    Get.snackbar(
                      "Error",
                      "Invalid NIC format. Must be 10 or 12 characters.",
                      backgroundColor: Colors.red.shade400,
                      colorText: Colors.white,
                      snackPosition: SnackPosition.BOTTOM,
                    );
                  } else {
                    nicController.decodeNIC(nicInputController.text);
                    Get.toNamed('/result');
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 5,
                  shadowColor: Colors.black.withOpacity(0.3),
                ),
                child: Text(
                  "Decode NIC",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue.shade800,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
