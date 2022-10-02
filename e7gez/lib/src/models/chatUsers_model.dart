class  ChatUsers {

  late String name;
  late String messageText;
  late String time;

  ChatUsers.fromJson(Map<String, dynamic> parsedJson) {
    name = parsedJson['name'];
    messageText = parsedJson['messageText'];
    time = parsedJson['time'];
  }

  ChatUsers({required this.name,required this.messageText,required this.time}); 

}

class ChatMessage {
  late String messageContent;
  late String messageType;
  ChatMessage({required this.messageContent,required this.messageType});
}