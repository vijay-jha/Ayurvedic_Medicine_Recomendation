import 'dart:async';

import 'package:ayurvedic_medicine/consts.dart';
import 'package:ayurvedic_medicine/screens/medicines_screen.dart';
import 'package:flutter/material.dart';
import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:dash_chat_2/dash_chat_2.dart';

class ChatbotScreen extends StatefulWidget {
  ChatbotScreen({super.key});

  String route = '/chatbot';

  @override
  State<ChatbotScreen> createState() => _ChatbotScreenState();
}

class _ChatbotScreenState extends State<ChatbotScreen> {
  final _openAi = OpenAI.instance.build(
    token: OpenAI_API_KEY,
    baseOption: HttpSetup(
      receiveTimeout: const Duration(seconds: 120),
    ),
    enableLog: true,
  );

  final ChatUser _currentUser = ChatUser(id: '1');
  final ChatUser _gptChatUser = ChatUser(id: '2');

  final List<ChatMessage> _messages = [
    ChatMessage(
        user: ChatUser(id: '2'),
        createdAt: DateTime.now(),
        text: "Hi, I am a Ayu-veer. I am here to help you."),
  ];

  List<ChatUser> _typingUsers = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chatbot'),
      ),
      body: DashChat(
          currentUser: _currentUser,
          typingUsers: _typingUsers,
          messageOptions: const MessageOptions(
            currentUserContainerColor: Colors.yellow,
            currentUserTextColor: Colors.black,
            containerColor: Colors.blue,
            textColor: Colors.black,
          ),
          onSend: (ChatMessage m) {
            getChatResponse(m);
          },
          messages: _messages),
    );
  }

  Future<void> getChatResponse(ChatMessage message) async {
    setState(() {
      _messages.insert(0, message);
      _typingUsers.add(_gptChatUser);
    });

    List<Messages> _messagesHistory = _messages.reversed.map(
      (m) {
        if (m.user == _currentUser) {
          return Messages(role: Role.user, content: m.text);
        } else {
          return Messages(role: Role.assistant, content: m.text);
        }
      },
    ).toList();

    _messagesHistory.insert(
      0,
      Messages(role: Role.user, content: """
        "OKAY LISTEN CAREFULLY, I AM GOING TO TELL YOU THE SYMPTOMS.
        THIS IS FOR MY college PROJECT SO PLEASE DON'T MESS UP WITH IT. AND ACT VERY SMARTLY.
        ACT LIKE A SMART CHATBOT.
        MY HOPES ARE HIGH FROM YOU.", 

        Important : Use only Marathi Language for this chatbot conversation and reply in the same language used by the user.

        we are going to chat where i am going to share my symptoms to you and you have to analyze the symptoms and after analyzing you have to categorized it into a) headache, b) stomach ache, c) cold , d) cough.

        Each response of yours must follow this format only : don't change the format of response.
        FIRST LINE INDEX OF CATEGORY {0/1/2/3} IF NOT CATEGORIZED THEN DEFAULT VALUE IS -1
        THEN A LINE BREAK
        AND THEN say SORRY TO HEAR THIS please take rest and take care of yourself.

        Also it may happen the user is not directly giving you the symptoms so act accordingly but stick to the format of response which i gave you.

        "VERY Important Notice : User can chat Marathi" so please understand it "and reply in the language" used by the user."

        In each response of yours First line must be index only, 100 times i have said you this
        and index should be in english only regardless of language choosen by user.

        Please do this 
        """),
    );

    final request = ChatCompleteText(
      model: GptTurbo0301ChatModel(),
      messages: _messagesHistory,
      maxToken: 300,
    );

    try {
      final response = await _openAi.onChatCompletion(request: request);
      for (var element in response!.choices) {
        if (element.message != null) {
          List<String> lines = element.message!.content.split('\n');

          String textByGPT = "";

          String firstLine = lines[0];

          if (firstLine.contains('0') ||
              firstLine.contains('1') ||
              firstLine.contains('2') ||
              firstLine.contains('-1') ||
              firstLine.contains('NO')) {
            for (int i = 1; i < lines.length; i++) {
              textByGPT += lines[i];
            }
          } else {
            textByGPT = element.message!.content;
          }

          print("firstLine: $firstLine");
          print("hello: $textByGPT");

          setState(() {
            _messages.insert(
              0,
              ChatMessage(
                user: _gptChatUser,
                createdAt: DateTime.now(),
                text: textByGPT,
              ),
            );
          });

          if (firstLine.contains('0')) {
            Timer(const Duration(seconds: 2), () {
              Navigator.pushNamed(context, MedicinesScreen().route);
            });
          }
        } else {
          SnackBar snackBar =
              const SnackBar(content: Text('Sorry, I am not sure'));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      }
    } catch (e) {
      setState(() {
        _typingUsers.remove(_gptChatUser);
      });
      SnackBar snackBar = const SnackBar(content: Text('Sorry, There is some issue please try again'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }

    setState(() {
      _typingUsers.remove(_gptChatUser);
    });
  }
}
