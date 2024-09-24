// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

abstract class SplashState extends Equatable {
  @override
  List<Object> get props => [];
}

class SplashInitial extends SplashState {}

class SplashCheckSession extends SplashState {
  List<Object> data;
  bool isSessionExpired;
  SplashCheckSession(this.data, this.isSessionExpired);
  @override
  List<Object> get props => data;
}
