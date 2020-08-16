import 'package:equatable/equatable.dart';

class Edition extends Equatable {
  final String identifier;
  final String language;
  final String name;
  final String englishName;
  final String format;
  final String type;
  final String direction;

  Edition(
      {this.identifier,
      this.language,
      this.name,
      this.englishName,
      this.format,
      this.type,
      this.direction});

  factory Edition.fromJson(Map<String, dynamic> json) {
    return Edition(
        identifier: json['identifier'],
        language: json['language'],
        name: json['name'],
        englishName: json['englishName'],
        format: json['format'],
        type: json['type'],
        direction: json['direction']);
  }

  @override
  List<Object> get props =>
      [identifier, language, name, englishName, format, type, direction];
}
