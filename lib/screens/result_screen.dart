import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/nic_controller.dart';

class ResultScreen extends StatelessWidget {
  final NICController nicController = Get.find<NICController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "NIC Details",
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
            colors: [Colors.blue.shade200, Colors.blue.shade50],
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Obx(() => Column(
                  children: [
                    _buildDetailBox(
                        "NIC Format", nicController.nicData.value.nicFormat),
                    SizedBox(height: 15),
                    _buildDetailBox("Date of Birth",
                        nicController.nicData.value.dateOfBirth.toString()),
                    SizedBox(height: 15),
                    _buildDetailBox(
                        "Weekday", nicController.nicData.value.weekday),
                    SizedBox(height: 15),
                    _buildDetailBox(
                        "Age", nicController.nicData.value.age.toString()),
                    SizedBox(height: 15),
                    _buildDetailBox(
                        "Gender", nicController.nicData.value.gender),
                    SizedBox(height: 15),
                    _buildDetailBox("Serial Number",
                        nicController.nicData.value.serialNumber),
                    SizedBox(height: 15),
                    _buildDetailBox("Vote Ability",
                        nicController.nicData.value.voteAbility),
                  ],
                )),
          ),
        ),
      ),
    );
  }

  Widget _buildDetailBox(String label, String value) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.center, // Center-align text horizontally
        mainAxisAlignment:
            MainAxisAlignment.center, // Center-align text vertically
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.blue.shade900,
            ),
            textAlign:
                TextAlign.center, // Center-align text within the Text widget
          ),
          SizedBox(height: 5),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              color: Colors.blue.shade800,
            ),
            textAlign:
                TextAlign.center, // Center-align text within the Text widget
          ),
        ],
      ),
    );
  }
}
