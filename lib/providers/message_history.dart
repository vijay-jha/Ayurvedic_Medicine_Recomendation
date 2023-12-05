import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';

class MessageHistory extends ChangeNotifier {
  final List<ChatMessage> _messages = [
    ChatMessage(
        user: ChatUser(id: '2'),
        createdAt: DateTime.now(),
        text:
            "नमस्कार, मी एक आयु-वीर आहे. मी तुम्हाला मदत करण्यासाठी येथे आहे."),
  ];

  List<ChatMessage> get messages => _messages;

  void addMessage(ChatMessage message) {
    _messages.add(message);
    notifyListeners();
  }

  void insertMessage(int index, ChatMessage message) {
    _messages.insert(index, message);
    notifyListeners();
  }
}
