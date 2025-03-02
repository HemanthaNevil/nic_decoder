// lib/controllers/nic_controller.dart

import 'package:flutter/material.dart'; // Add this import
import 'package:get/get.dart';
import '../models/nic_model.dart';
import '../utils/nic_decoder.dart';

class NICController extends GetxController {
  var nicData = NICModel(
    dateOfBirth: DateTime.now(),
    weekday: "",
    age: 0,
    gender: "",
    serialNumber: "",
    voteAbility: "",
    nicFormat: "", // Initialize nicFormat
  ).obs;

  void decodeNIC(String nic) {
    try {
      var decodedData = NICDecoder.decodeNIC(nic);
      nicData.value = NICModel(
        dateOfBirth: decodedData["dateOfBirth"],
        weekday: decodedData["weekday"],
        age: decodedData["age"],
        gender: decodedData["gender"],
        serialNumber: decodedData["serialNumber"],
        voteAbility: decodedData["voteAbility"],
        nicFormat: decodedData["nicFormat"], // Add NIC format
      );
    } catch (e) {
      Get.snackbar(
        "Error",
        "Invalid NIC format",
        backgroundColor: Colors.red.shade400, // Colors is now recognized
        colorText: Colors.white, // Colors is now recognized
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
