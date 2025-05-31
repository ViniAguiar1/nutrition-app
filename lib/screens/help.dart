import 'package:flutter/material.dart';

class HelpScreen extends StatelessWidget {
  final List<Map<String, String>> _faqs = [
    {
      "question": "Como redefinir minha senha?",
      "answer":
          "Para redefinir sua senha, vá até a tela de login e clique em 'Esqueci minha senha'. Siga as instruções enviadas para o seu e-mail.",
    },
    {
      "question": "Como acessar meus treinos?",
      "answer":
          "Você pode acessar seus treinos na aba 'Treinos' no menu principal. Clique no treino desejado para visualizar os exercícios.",
    },
    {
      "question": "Como entrar em contato com o suporte?",
      "answer":
          "Você pode entrar em contato conosco pelo e-mail suporte@coelhoapp.com ou pelo telefone +55 11 99999-9999.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Clean white background
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Ajuda",
          style: TextStyle(
            color: Color(0xFF125c52), // Primary color
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Color(0xFF125c52)), // Primary color
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section
            Center(
              child: Column(
                children: [
                  Icon(
                    Icons.help_outline,
                    size: 80,
                    color: Color(0xFF24b5a1), // Secondary color
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Precisa de Ajuda?",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF125c52), // Primary color
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Estamos aqui para ajudar você.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF676664), // Neutral color
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 32),

            // Contact Options
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              elevation: 2,
              child: ListTile(
                leading: CircleAvatar(
                  radius: 24,
                  backgroundColor: Color(
                    0xFFdbdad5,
                  ).withOpacity(0.5), // Neutral color
                  child: Icon(
                    Icons.email,
                    color: Color(0xFF125c52), // Primary color
                  ),
                ),
                title: Text(
                  "E-mail",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF125c52), // Primary color
                  ),
                ),
                subtitle: Text(
                  "suporte@coelhoapp.com",
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF676664), // Neutral color
                  ),
                ),
                onTap: () {
                  // Handle email tap
                },
              ),
            ),
            SizedBox(height: 16),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              elevation: 2,
              child: ListTile(
                leading: CircleAvatar(
                  radius: 24,
                  backgroundColor: Color(
                    0xFFdbdad5,
                  ).withOpacity(0.5), // Neutral color
                  child: Icon(
                    Icons.phone,
                    color: Color(0xFF125c52), // Primary color
                  ),
                ),
                title: Text(
                  "Telefone",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF125c52), // Primary color
                  ),
                ),
                subtitle: Text(
                  "+55 11 99999-9999",
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF676664), // Neutral color
                  ),
                ),
                onTap: () {
                  // Handle phone tap
                },
              ),
            ),
            SizedBox(height: 16),

            // FAQ Section
            Text(
              "Perguntas Frequentes",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF125c52), // Primary color
              ),
            ),
            SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: _faqs.length,
                itemBuilder: (context, index) {
                  final faq = _faqs[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    elevation: 2,
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ExpansionTile(
                      leading: Icon(
                        Icons.question_answer,
                        color: Color(0xFF125c52), // Primary color
                      ),
                      title: Text(
                        faq["question"]!,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF125c52), // Primary color
                        ),
                      ),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            faq["answer"]!,
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xFF676664), // Neutral color
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
