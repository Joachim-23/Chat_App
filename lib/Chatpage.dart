import 'package:chat_counter_app/models/chat_message_entity.dart';
import 'package:chat_counter_app/widgets/Chatbubble.dart';
import 'package:chat_counter_app/widgets/Chatinput.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    final username = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Hi $username!'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/');
                print('Icon pressed!');
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: Column(
        children: [
          Expanded(
              //TODO: Create a dynamic sized list
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return ChatBubble(
                        alignment: index % 2 == 0
                            ? Alignment.centerLeft
                            : Alignment.centerRight,
                        entity: ChatMessageEntity(
                            id: '1234',
                            text: 'Hello this is Pooja!!!!!',
                            createdAt: DateTime.now().millisecondsSinceEpoch,
                            author: Author(userName: 'poojab26')));
                  })),
          ChatInput(),
        ],
      ),
    );
  }
}
