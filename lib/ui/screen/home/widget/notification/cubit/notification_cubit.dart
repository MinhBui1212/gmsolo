import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cuemate/data/model/notification/notification.dart';
import 'package:cuemate/ui/screen/home/widget/notification/cubit/notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(NotificationInitial());

  // Add your methods and logic here

  //get list notification
  Future<void> getListNotification() async {
    try {
      emit(NotificationLoadding());
      //TODO: call api get list notification
      final List<NotificationResponse> listNotification = [];
      //TODO
      //time out 4s
      await Future.delayed(const Duration(seconds: 1));
      final response = [
        {
          'id': 1,
          'title': 'Thông báo 1',
          'content': 'Nội dung thông báo 1',
          'time': '2021-09-01 12:00:00',
          'image_path':
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQQphO1iGa3a8wJpd43zAbREvXa8q4DmAIKww&usqp=CAU',
          'is_readed': '0',
        },
        {
          'id': 2,
          'title': 'Thông báo 2',
          'content': 'Nội dung thông báo 2',
          'time': '2021-09-01 12:00:00',
          'image_path':
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQQphO1iGa3a8wJpd43zAbREvXa8q4DmAIKww&usqp=CAU',
          'is_readed': '0',
        },
        {
          'id': 3,
          'title': 'Thông báo 3',
          'content': 'Nội dung thông báo 3',
          'time': '2021-09-01 12:00:00',
          'image_path':
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQQphO1iGa3a8wJpd43zAbREvXa8q4DmAIKww&usqp=CAU',
          'is_readed': '1',
        },
        {
          'id': 4,
          'title': 'Thông báo 4',
          'content': 'Nội dung thông báo 4',
          'time': '2021-09-01 12:00:00',
          'image_path':
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQQphO1iGa3a8wJpd43zAbREvXa8q4DmAIKww&usqp=CAU',
          'is_readed': '0',
        },
        {
          'id': 5,
          'title': 'Thông báo 5',
          'content': 'Nội dung thông báo 5',
          'time': '2021-09-01 12:00:00',
          'image_path':
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQQphO1iGa3a8wJpd43zAbREvXa8q4DmAIKww&usqp=CAU',
          'is_readed': '1',
        },
        {
          'id': 6,
          'title': 'Thông báo 6',
          'content':
              'Nội dung thông báo 6 Nội dung thông báo 6Nội dung thông báo 6Nội dung thông báo 6Nội dung thông báo 6Nội dung thông báo 6Nội dung thông báo 6Nội dung thông báo 6Nội dung thông báo 6Nội dung thông báo 6Nội dung thông báo 6',
          'time': '2021-09-01 12:00:00',
          'image_path':
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQQphO1iGa3a8wJpd43zAbREvXa8q4DmAIKww&usqp=CAU',
          'is_readed': '1',
        }
      ];
      for (var element in response) {
        listNotification.add(NotificationResponse.fromJson(element));
      }
      emit(NotificationSuccess(listNotification, false));
    } catch (e) {
      emit(NotificationSuccess([] as List<NotificationResponse>, false));
    }
  }
}
