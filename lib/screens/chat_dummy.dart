// import 'package:flutter/material.dart';
// import 'package:grouped_list/grouped_list.dart';
// import 'package:intl/intl.dart';
// import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';

// import '../utilities/message.dart';

// class ChatbotScreen extends StatefulWidget {
//   ChatbotScreen({super.key});

//   String route = '/chatbot';

//   @override
//   State<ChatbotScreen> createState() => _ChatbotScreenState();
// }

// class _ChatbotScreenState extends State<ChatbotScreen> {
//   List<Message> messages = [
//     Message(
//       text: 'I am Ayu-Veer, how can i help you??',
//       date: DateTime.now().subtract(const Duration(minutes: 1)),
//       isSentByMe: false,
//     ),
//   ].reversed.toList();


//   @override
//   Widget build(BuildContext context) {
//     TextEditingController _controller = TextEditingController();

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Chatbot'),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: GroupedListView<Message, DateTime>(
//               reverse: true,
//               order: GroupedListOrder.DESC,
//               useStickyGroupSeparators: true,
//               floatingHeader: true,
//               padding: const EdgeInsets.all(8),
//               elements: messages,
//               groupBy: (message) => DateTime(
//                 message.date.year,
//                 message.date.month,
//                 message.date.day,
//               ),
//               groupHeaderBuilder: (Message message) => SizedBox(
//                 height: 40,
//                 child: Center(
//                   child: Card(
//                     color: Theme.of(context).primaryColor,
//                     child: Padding(
//                       padding: const EdgeInsets.all(8),
//                       child: Text(
//                         DateFormat.yMMMd().format(message.date),
//                         style: const TextStyle(color: Colors.white),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               itemBuilder: (context, message) => Align(
//                 alignment: message.isSentByMe
//                     ? Alignment.centerRight
//                     : Alignment.centerLeft,
//                 child: Card(
//                   elevation: 8,
//                   child: Padding(
//                     padding: const EdgeInsets.all(12),
//                     child: Text(message.text),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           Container(
//             color: Colors.lightGreen,
//             child: TextField(
//               controller: _controller,
//               decoration: InputDecoration(
//                 contentPadding: const EdgeInsets.all(15),
//                 hintText: 'Type something',
//                 suffixIcon: IconButton(
//                   onPressed: () {
//                     String text = _controller.text;
//                     final message = Message(
//                       text: text,
//                       date: DateTime.now(),
//                       isSentByMe: true,
//                     );
//                     setState(() {
//                       messages.add(message);
//                     });
//                     _controller.clear();
//                   },
//                   icon: const Icon(Icons.send),
//                 ),
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
