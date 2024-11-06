import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smart_bazar/utils/formatters/formatter.dart';

class UserModel {
String id;
  String firstName;
  String lastName;
  String username;
  String email;
  String phoneNumber;
  String profilePicture;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.profilePicture,
  });

  ///Helper function to get full name
String get fullName => '$firstName $lastName';
/// Helper function to format phone number
 String get formatPhoneNumber => TFormatter.formatPhoneNumber(phoneNumber);

 ///static function to split full name into first and last name.
static  List<String> nameParts(fullName) => fullName.split('');
///Static function to generate a username form fullname

/// Static function to generate a unique user ID
static String generateUserName(fullName){
  List<String> nameParts = fullName.split('');
  String firstName = nameParts[0].toLowerCase();
  String lastName = nameParts.length > 1 ?  nameParts[1].toLowerCase() : "";
  String camelCaseUsername = '$firstName$lastName';
  String userNameWihPrefix = "cwt_$camelCaseUsername";
  return userNameWihPrefix;
}

///Static function to create an empty user model
static UserModel empty( )=> UserModel(id: '', firstName: '', lastName: '', username: '', email: '', phoneNumber: '', profilePicture: '');
  /// Factory constructor to create a UserModel from a JSON map


  factory UserModel.fromJson(DocumentSnapshot<Map<String, dynamic>> document) {
    if(document.data() != null) {
      final json = document.data()!;
      return UserModel(
        id: document.id,
        firstName: json['FirstName'] ?? '',
        lastName: json['LastName']?? '',
        username: json['Username']?? '',
        email: json['Email']?? '',
        phoneNumber: json['PhoneNumber']?? '',
        profilePicture: json['ProfilePicture']?? '',
      );
    }else {
      /// Return an empty UserModel when the document data is null
      return UserModel.empty();
    }
  }

  /// Method to convert the UserModel to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'FirstName': firstName,
      'LastName': lastName,
      'Username': username,
      'Email': email,
      'PhoneNumber': phoneNumber,
      'ProfilePicture': profilePicture,
    };
  }
}
