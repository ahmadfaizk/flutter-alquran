import 'package:equatable/equatable.dart';

class MultipleResponse<T> extends Equatable {
  final int code;
  final String status;
  final List<T> data;

  MultipleResponse({this.code, this.status, this.data});

  factory MultipleResponse.fromJson(Map<String, dynamic> json) {
    return MultipleResponse(
        code: json['code'], status: json['status'], data: json['data']);
  }

  @override
  List<Object> get props => [code, status, data];
}
