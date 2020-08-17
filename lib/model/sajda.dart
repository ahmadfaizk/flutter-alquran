import 'package:equatable/equatable.dart';

class Sajda extends Equatable {
  final int id;
  final bool recommended;
  final bool obligatory;

  const Sajda({this.id, this.recommended, this.obligatory});

  factory Sajda.fromJson(Map<String, dynamic> json) {
    return Sajda(
        id: json['id'],
        recommended: json['recommended'],
        obligatory: json['obligatory']);
  }

  @override
  List<Object> get props => [id];
}
