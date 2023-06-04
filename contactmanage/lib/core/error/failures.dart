import 'dart:io';

import 'package:equatable/equatable.dart';

import 'package:dio/dio.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class Failure extends Equatable {
  @override
  List<Object> get props => [];

  String displayErrorMessage();
}

// General failures
class ServerFailure extends Failure {
  String? message;
  ServerFailure({this.message});
  @override
  displayErrorMessage() {
    return message ?? "An error Occured,try again later";
  }
}

class InternetConnectFailure extends Failure {
  @override
  displayErrorMessage() {
    return "You are disconnected from the internet.";
  }
}

class ServerStatus {
  final bool status;
  Failure? failure;

  ServerStatus({required this.status, required this.failure});
}

Future<bool> isInternetAvailable() async {
  final bool isConnected = await InternetConnectionChecker().hasConnection;
  if (isConnected) {
    return true;
  } else {
    throw const SocketException("You are disconnected from the internet.");
  }
}

Future<ServerStatus> hanldeStatusCode(Response<dynamic> result) async {
  if (result.statusCode == 201 || result.statusCode == 200) {
    return ServerStatus(status: true, failure: null);
  } else {
    return ServerStatus(status: false, failure: ServerFailure());
  }
}

handleThrownException(dynamic e) {
  if (e is SocketException) {
    throw InternetConnectFailure();
  } else if (e.toString().contains("You are disconnected from the internet.")) {
    throw InternetConnectFailure();
  } else {
    throw ServerFailure();
  }
}
