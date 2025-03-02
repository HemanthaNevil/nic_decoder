// lib/utils/nic_decoder.dart
/// A utility class to decode Sri Lankan National Identity Card (NIC) numbers.
/// Supports both old (9 digits + 1 letter) and new (12 digits) formats.

class NICDecoder {
  /// Decodes the NIC number and returns a map of decoded data.
  ///
  /// Parameters:
  /// - [nic]: The NIC number as a String (10 or 12 characters).
  ///
  /// Returns:
  /// A `Map<String, dynamic>` containing:
  /// - `dateOfBirth`: The decoded date of birth as a `DateTime`.
  /// - `weekday`: The weekday of the birth date as a `String`.
  /// - `age`: The calculated age as an `int`.
  /// - `gender`: The decoded gender as a `String`.
  /// - `serialNumber`: The serial number as a `String`.
  /// - `voteAbility`: The vote eligibility as a `String`.
  /// - `nicFormat`: The NIC format as a `String` ("Old Format" or "New Format").
  ///
  /// Throws:
  /// - `FormatException`: If the NIC number is invalid.
  static Map<String, dynamic> decodeNIC(String nic) {
    bool isOldFormat = nic.length == 10; // Old format has 9 digits + 1 letter
    bool isNewFormat = nic.length == 12; // New format has 12 digits

    if (!isOldFormat && !isNewFormat) {
      throw FormatException("Invalid NIC format");
    }

    /// Determine NIC format
    String nicFormat = isOldFormat ? "Old Format" : "New Format";

    int birthYear;
    int dayOfYear;
    String gender;
    String serialNumber;
    String voteAbility;

    if (isOldFormat) {
      /// Old format: 9 digits + 1 letter
      birthYear = int.parse(nic.substring(0, 2)) + 1900;
      dayOfYear = int.parse(nic.substring(2, 5));
      serialNumber = nic.substring(5, 9);
      voteAbility = nic[9].toUpperCase() == 'V' ? "Eligible" : "Not Eligible";
    } else {
      /// New format: 12 digits
      birthYear = int.parse(nic.substring(0, 4));
      dayOfYear = int.parse(nic.substring(4, 7));
      serialNumber = nic.substring(7, 12);
      voteAbility = "Eligible"; // New format assumes eligibility
    }

    /// Determine gender
    if (dayOfYear >= 500) {
      gender = "Female";
      dayOfYear -= 500; // Subtract 500 for females
    } else {
      gender = "Male";
    }

    /// Calculate date of birth
    DateTime dateOfBirth =
        DateTime(birthYear, 1, 1).add(Duration(days: dayOfYear - 1));

    /// Calculate weekday
    String weekday = _getWeekday(dateOfBirth.weekday);

    /// Calculate age
    int age = DateTime.now().year - birthYear;

    return {
      "dateOfBirth": dateOfBirth,
      "weekday": weekday,
      "age": age,
      "gender": gender,
      "serialNumber": serialNumber,
      "voteAbility": voteAbility,
      "nicFormat": nicFormat, // Add NIC format to the result
    };
  }

  /// Helper function to get the weekday name from a weekday number.
  ///
  /// Parameters:
  /// - [weekday]: The weekday number (1 = Monday, 7 = Sunday).
  ///
  /// Returns:
  /// The weekday name as a `String`.
  static String _getWeekday(int weekday) {
    switch (weekday) {
      case 1:
        return "Monday";
      case 2:
        return "Tuesday";
      case 3:
        return "Wednesday";
      case 4:
        return "Thursday";
      case 5:
        return "Friday";
      case 6:
        return "Saturday";
      case 7:
        return "Sunday";
      default:
        return "Unknown";
    }
  }
}
