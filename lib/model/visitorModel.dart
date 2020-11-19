class Visitor {
  String name;
  String email;
  String company;
  String dateOfVisit;
  String phoneNumber;
  Visitor(
      {this.name,
      this.email,
      this.company,
      this.dateOfVisit,
      this.phoneNumber});

  Map<String, String> toMap() {
    return {
      'name': name,
      'email': email,
      'company': company,
      'dateOfVisit': dateOfVisit,
      'phoneNumber': phoneNumber
    };
  }
}
