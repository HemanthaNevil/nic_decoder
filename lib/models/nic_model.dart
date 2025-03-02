// lib/models/nic_model.dart

class NICModel {
  final DateTime dateOfBirth;
  final String weekday;
  final int age;
  final String gender;
  final String serialNumber;
  final String voteAbility;
  final String nicFormat; // New field for NIC format

  NICModel({
    required this.dateOfBirth,
    required this.weekday,
    required this.age,
    required this.gender,
    required this.serialNumber,
    required this.voteAbility,
    required this.nicFormat, // Initialize in constructor
  });
}
