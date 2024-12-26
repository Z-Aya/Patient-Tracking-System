import 'package:flutter/material.dart';

class UpdatePatientScreen extends StatelessWidget {
  final Map<String, String> patient;

  UpdatePatientScreen({required this.patient});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController statusController = TextEditingController();
  final TextEditingController diagnosticController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController nicController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Initialiser les contrôleurs avec les données existantes
    nameController.text = patient['name']!;
    statusController.text = patient['status']!;
    diagnosticController.text = patient['diagnostic']!;
    emailController.text = patient['email']!;
    phoneController.text = patient['phone']!;
    dobController.text = patient['dob']!;
    nicController.text = patient['nic']!;
    genderController.text = patient['gender']!;
    addressController.text = patient['address']!;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.edit, color: Colors.white), // Icône pour le titre
            SizedBox(width: 10),
            Text(
              'Modifier le patient',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        backgroundColor: Color(0xFF85C1E9), // Couleur principale
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Color(0xFF85C1E9),
                  child: Icon(Icons.person, size: 50, color: Colors.white),
                ),
              ),
              SizedBox(height: 20),
              _buildTextField(nameController, 'Nom', Icons.person),
              SizedBox(height: 15),
              _buildTextField(statusController, 'Statut', Icons.thermostat),
              SizedBox(height: 15),
              _buildTextField(
                  diagnosticController, 'Diagnostic', Icons.medical_services),
              SizedBox(height: 15),
              _buildTextField(emailController, 'Email', Icons.email),
              SizedBox(height: 15),
              _buildTextField(phoneController, 'Téléphone', Icons.phone),
              SizedBox(height: 15),
              _buildTextField(dobController, 'Date de naissance', Icons.cake),
              SizedBox(height: 15),
              _buildTextField(nicController, 'NIC', Icons.credit_card),
              SizedBox(height: 15),
              _buildTextField(genderController, 'Genre', Icons.transgender),
              SizedBox(height: 15),
              _buildTextField(addressController, 'Adresse', Icons.location_on),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  // Créer une nouvelle carte de données mise à jour
                  final updatedPatient = {
                    'name': nameController.text,
                    'status': statusController.text,
                    'diagnostic': diagnosticController.text,
                    'email': emailController.text,
                    'phone': phoneController.text,
                    'dob': dobController.text,
                    'nic': nicController.text,
                    'gender': genderController.text,
                    'address': addressController.text,
                  };
                  Navigator.pop(context,
                      updatedPatient); // Retourner les données mises à jour
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF85C1E9), // Couleur principale
                  padding: EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Enregistrer',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
              SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // Retour sans enregistrer
                },
                style: TextButton.styleFrom(
                  foregroundColor: Color(0xFF85C1E9), // Couleur principale
                  padding: EdgeInsets.symmetric(vertical: 10),
                ),
                child: Text(
                  'Annuler',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
      TextEditingController controller, String label, IconData icon) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: Color(0xFF85C1E9)), // Couleur principale
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: Color(0xFF85C1E9), width: 2), // Couleur principale
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      style: TextStyle(fontSize: 16),
    );
  }
}
