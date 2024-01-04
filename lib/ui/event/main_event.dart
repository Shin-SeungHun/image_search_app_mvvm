import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'main_event.freezed.dart';

@freezed
sealed class MainEvent with _$MainEvent {
  const factory MainEvent.success(String message) = ShowSnackBar;
  const factory MainEvent.error(String message) = ShowDialog;
}