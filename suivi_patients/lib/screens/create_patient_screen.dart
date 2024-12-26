import 'package:flutter/material.dart';

class CreatePatientScreen extends StatelessWidget {
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
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Ajouter un Patient',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(0xFF85C1E9),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Color(0xFF85C1E9),
                  child: Icon(
                    Icons.person_add,
                    size: 50,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 20),
              _buildTextField(
                  nameController, 'Nom', Icons.person, TextInputType.text),
              SizedBox(height: 15),
              _buildTextField(statusController, 'Statut', Icons.thermostat,
                  TextInputType.text),
              SizedBox(height: 15),
              _buildTextField(diagnosticController, 'Diagnostic',
                  Icons.medical_services, TextInputType.text),
              SizedBox(height: 15),
              _buildTextField(emailController, 'Email', Icons.email,
                  TextInputType.emailAddress),
              SizedBox(height: 15),
              _buildTextField(phoneController, 'Téléphone', Icons.phone,
                  TextInputType.phone),
              SizedBox(height: 15),
              _buildTextField(dobController, 'Date de naissance', Icons.cake,
                  TextInputType.datetime),
              SizedBox(height: 15),
              _buildTextField(nicController, 'NIC', Icons.credit_card,
                  TextInputType.number),
              SizedBox(height: 15),
              _buildTextField(genderController, 'Genre', Icons.transgender,
                  TextInputType.text),
              SizedBox(height: 15),
              _buildTextField(addressController, 'Adresse', Icons.location_on,
                  TextInputType.streetAddress),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  final newPatient = {
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
                  Navigator.pop(
                      context, newPatient); // Retourne le nouveau patient
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF2980B9),
                  padding: EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  'Ajouter',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label,
      IconData icon, TextInputType inputType) {
    return TextField(
      controller: controller,
      keyboardType: inputType,
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
      style: TextStyle(fontSize: 16),
    );
  }
}
