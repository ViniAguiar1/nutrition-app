import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<Map<String, String>> interactions = [
    {
      "type": "Mensagem",
      "date": "10/06/2023",
      "details": "Nutricionista: 'Como está indo com o plano alimentar?'",
      "sender": "nutri",
    },
    {
      "type": "Mensagem",
      "date": "10/06/2023",
      "details":
          "Você: 'Estou seguindo bem, mas tenho dúvidas sobre o jantar.'",
      "sender": "user",
    },
  ];

  final TextEditingController _messageController = TextEditingController();

  void _sendMessage() {
    if (_messageController.text.isNotEmpty) {
      setState(() {
        interactions.add({
          "type": "Mensagem",
          "date": DateTime.now().toString().substring(0, 16), // Current date
          "details": "Você: '${_messageController.text}'",
          "sender": "user",
        });
      });
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat"),
        backgroundColor: Color(0xFF402819), // Primary color
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: interactions.length,
                itemBuilder: (context, index) {
                  final interaction = interactions[index];
                  final isUser = interaction["sender"] == "user";

                  return Align(
                    alignment:
                        isUser ? Alignment.centerRight : Alignment.centerLeft,
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 8.0),
                      padding: const EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        color:
                            isUser
                                ? Color(0xFF402819).withOpacity(
                                  0.8,
                                ) // Darker primary for user
                                : Color(
                                  0xFFdfccb2,
                                ).withOpacity(0.8), // Light secondary for nutri
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12.0),
                          topRight: Radius.circular(12.0),
                          bottomLeft:
                              isUser ? Radius.circular(12.0) : Radius.zero,
                          bottomRight:
                              isUser ? Radius.zero : Radius.circular(12.0),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            interaction["details"]!,
                            style: TextStyle(
                              color: isUser ? Colors.white : Color(0xFF402819),
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            interaction["date"]!,
                            style: TextStyle(
                              fontSize: 12,
                              color: isUser ? Colors.white70 : Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 16),
            // Input Section for New Messages
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: "Digite sua mensagem...",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      filled: true,
                      fillColor: Color(
                        0xFFdfccb2,
                      ).withOpacity(0.2), // Light secondary color
                    ),
                  ),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: _sendMessage,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF402819), // Primary color
                    padding: EdgeInsets.all(16.0),
                    shape: CircleBorder(),
                  ),
                  child: Icon(
                    Icons.send,
                    color: Color(0xFFdfccb2),
                  ), // Secondary color
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
