class NotificationResponse {
  int? id;
  String? title;
  String? content;
  DateTime? time;
  String? imagePath;
  int? isReaded;

  NotificationResponse({this.id, this.title});

  NotificationResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    content = json['content'];
    time = DateTime.parse(json['time']);
    imagePath = json['image_path'];
    isReaded = int.parse(json['is_readed']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['content'] = content;
    data['time'] = time.toString();
    data['image_path'] = imagePath;
    data['is_readed'] = isReaded;
    return data;
  }
}
