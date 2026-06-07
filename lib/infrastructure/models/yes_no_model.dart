import 'dart:convert';

import 'package:cero_a_experto/domain/entities/message.dart';

class YesNoModel {
  String answer;
  bool forced;
  String image;

  YesNoModel({
    required this.answer,
    required this.forced,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return {
      'answer': answer,
      'forced': forced,
      'image': image,
    };
  }

  factory YesNoModel.fromMap(Map<String, dynamic> map) {
    return YesNoModel(
      answer: map['answer'] ?? '',
      forced: map['forced'] ?? false,
      image: map['image'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory YesNoModel.fromJson(String source) => YesNoModel.fromMap(json.decode(source));

  Message toMessageEntity() {
    return Message(
      text: answer,
      fromWho: FromWho.her,
      imageUrl: image,
    );
  }
}
