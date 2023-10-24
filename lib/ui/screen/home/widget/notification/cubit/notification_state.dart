import 'package:equatable/equatable.dart';
import 'package:cuemate/data/model/notification/notification.dart';

class NotificationState extends Equatable {
  @override
  List<Object> get props => [];

  bool get isLoading => true;

  get listNotification => [];
}

class NotificationInitial extends NotificationState {}

class NotificationLoadding extends NotificationState {}

class NotificationSuccess extends NotificationState {
  @override
  final List<NotificationResponse> listNotification;
  @override
  final bool isLoading;
  NotificationSuccess(this.listNotification, this.isLoading);
  @override
  List<Object> get props => [listNotification, isLoading];
}
