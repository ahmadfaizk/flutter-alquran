import 'package:equatable/equatable.dart';

class TranslatedName extends Equatable {
  final String languageName;
  final String name;

  const TranslatedName({this.languageName, this.name});

  factory TranslatedName.fromJson(Map<String, dynamic> json) {
    return TranslatedName(
        languageName: json['language_name'], name: json['name']);
  }

  @override
  List<Object> get props => [languageName, name];
}
