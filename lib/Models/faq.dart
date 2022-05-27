import 'dart:convert';

import 'package:flutter/cupertino.dart';

class FAQ {
  String title;
  String subtitle;
  FAQ({
    required this.title,
    required this.subtitle,
  });


  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'subtitle': subtitle,
    };
  }

  factory FAQ.fromMap(Map<String, dynamic> map) {
    return FAQ(
      title: map['title'] ?? '',
      subtitle: map['subtitle'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory FAQ.fromJson(String source) => FAQ.fromMap(json.decode(source));
}
