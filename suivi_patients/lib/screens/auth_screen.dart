import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final String validEmail = "fadwatoumi21@gmail.com";
  final String validPassword = "fadwa";

  void login() {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email == validEmail && password == validPassword) {
      Navigator.pushNamed(context, '/dashboard');
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Row(
              children: [
                Icon(Icons.error, color: Colors.red),
                SizedBox(width: 8),
                Text("Erreur de connexion"),
              ],
            ),
            content: Text("Email ou mot de passe incorrect."),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F8FA), // Couleur douce pour le fond
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Section supérieure avec un design attrayant
            Container(
              height: 300,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF85C1E9),
                    Color(0xFF2980B9)
                  ], // Dégradé bleu
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.local_hospital,
                      size: 50,
                      color: Color(0xFF85C1E9),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Suivi Patients",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Connectez-vous pour continuer",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            // Champs de connexion
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  _buildTextField(
                    controller: emailController,
                    label: "Email",
                    icon: Icons.email,
                    isPassword: false,
                  ),
                  SizedBox(height: 20),
                  _buildTextField(
                    controller: passwordController,
                    label: "Mot de passe",
                    icon: Icons.lock,
                    isPassword: true,
                  ),
                  SizedBox(height: 40),
                  // Bouton de Connexion
                  ElevatedButton(
                    onPressed: login,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF2980B9), // Couleur du bouton
                      padding: EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      'Se connecter',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  // Lien d'aide ou de support
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Besoin d'aide ? Contactez-nous",
                      style: TextStyle(
                        color: Color(0xFF2980B9),
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    required bool isPassword,
  }) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Color(0xFF2980B9)),
        prefixIcon: Icon(icon, color: Color(0xFF2980B9)),
        filled: true,
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Colors.grey[300]!),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Color(0xFF2980B9), width: 2),
        ),
      ),
    );
  }
}
