import 'dart:convert';

import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class GifModel extends Equatable {
  String id;
  String url;

  GifModel({
    required this.id,
    required this.url,
  });

  @override
  List<Object> get props => [id, url];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'url': url,
    };
  }

  static GifModel fromMap(Map<String, dynamic> map) {
    return GifModel(
      id: map['id'] ?? '',
      url: map['images']['downsized']['url'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  static GifModel fromJson(String source) => fromMap(json.decode(source));
}
