import 'package:flutter/foundation.dart';

class Todos {
  final String category;
  final String datetime;
  final String deskripsi;
  final bool isdone;
  final List<String> userEmail;
  Todos({
    @required this.category,
    @required this.datetime,
    this.deskripsi,
    this.isdone,
    this.userEmail,
  });
  // Add the document ID to the Todos model when serialising.
  static Todos fromMap(Map<String, dynamic> map, String documentId) {
    if (map == null) return null;
    return Todos(
      category: map['category'],
      datetime: map['datetime'],
      deskripsi: map['deskripsi'],
      isdone: map['isdone'],
      userEmail: map['userEmail']
    );
  }
}