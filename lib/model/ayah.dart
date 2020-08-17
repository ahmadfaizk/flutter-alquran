import 'package:alquran/model/sajda.dart';
import 'package:equatable/equatable.dart';

class Ayah extends Equatable {
  final int number;
  final String text;
  final int numberInSurah;
  final int juz;
  final int manzil;
  final int page;
  final int ruku;
  final int hizbQuarter;
  final dynamic sajda;

  const Ayah(
      {this.number,
      this.text,
      this.numberInSurah,
      this.juz,
      this.manzil,
      this.page,
      this.ruku,
      this.hizbQuarter,
      this.sajda});

  factory Ayah.fromJson(Map<String, dynamic> json) {
    if (!(json['sajda'] is bool)) {
      json['sajda'] = Sajda.fromJson(json['sajda']);
    }
    return Ayah(
        number: json['number'],
        text: json['text'],
        numberInSurah: json['numberInSurah'],
        juz: json['juz'],
        manzil: json['manzil'],
        page: json['page'],
        ruku: json['ruku'],
        hizbQuarter: json['hizbQuarter'],
        sajda: json['sajda']);
  }

  @override
  List<Object> get props => [
        number,
        text,
        numberInSurah,
        juz,
        manzil,
        page,
        ruku,
        hizbQuarter,
        sajda
      ];
}
