import 'package:equatable/equatable.dart';

class SingleResponse<T> extends Equatable {
  final int code;
  final String status;
  final T data;

  SingleResponse({this.code, this.status, this.data});

  factory SingleResponse.fromJson(Map<String, dynamic> json) {
    return SingleResponse(
        code: json['code'], status: json['status'], data: json['data']);
  }

  @override
  List<Object> get props => [code, status, data];
}
