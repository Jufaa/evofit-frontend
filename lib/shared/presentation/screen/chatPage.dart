import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Header
          Container(
            height: 180,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFB9AFCB), Colors.white],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Chat",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Chip(label: Text("Notifications")),
                    SizedBox(width: 8),
                    Chip(label: Text("Pinned")),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),

          // Toggle Buttons for Me / Work Chat
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ToggleButtons(
              isSelected: [true, false],
              onPressed: (index) {},
              selectedColor: Colors.white,
              fillColor: Color(0xFF002B0E),
              color: Colors.black,
              borderRadius: BorderRadius.circular(20),
              children: const [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text('Me'),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text('Work Chat'),
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),

          const Text(
            "My chats",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 10),

          // Static list of chats
          Expanded(
            child: ListView(
              children: [
                _ChatListTile(
                  sender: "Sender 1",
                  message: "Chat message",
                  time1: "12m",
                  time2: "1m",
                ),
                _ChatListTile(
                  sender: "Sender 2",
                  message: "Chat message",
                  time1: "1h",
                  time2: "1h",
                ),
                _ChatListTile(
                  sender: "Sender 2",
                  message: "Chat message?",
                  time1: "12h",
                  time2: "2h",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ChatListTile extends StatelessWidget {
  final String sender;
  final String message;
  final String time1;
  final String time2;

  const _ChatListTile({
    required this.sender,
    required this.message,
    required this.time1,
    required this.time2,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(backgroundColor: Colors.grey),
      title: Text(sender),
      subtitle: Text(message),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(time1),
          Text(time2, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder:
                (_) => ChatConversationPage(
                  chatId: sender,
                ), // puede cambiarse a un ID dinámico
          ),
        );
      },
    );
  }
}

class ChatConversationPage extends StatelessWidget {
  final String
  chatId; // <- parte dinámica a modificar por ID real en implementación futura

  const ChatConversationPage({super.key, required this.chatId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat with $chatId"),
        backgroundColor: const Color(0xFF002B0E),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Sender: Hello!", style: TextStyle(fontSize: 16)),
            SizedBox(height: 8),
            Text("You: Hi there!", style: TextStyle(fontSize: 16)),
            SizedBox(height: 8),
            Text("Sender: How's the progress?", style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
