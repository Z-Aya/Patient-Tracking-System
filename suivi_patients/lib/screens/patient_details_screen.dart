import 'package:flutter/material.dart';
import 'update_patient_screen.dart';

class PatientDetailsScreen extends StatefulWidget {
  final Map<String, String> patient;

  PatientDetailsScreen({required this.patient});

  @override
  _PatientDetailsScreenState createState() => _PatientDetailsScreenState();
}

class _PatientDetailsScreenState extends State<PatientDetailsScreen> {
  late Map<String, String> patientDetails;

  @override
  void initState() {
    super.initState();
    patientDetails = Map.from(widget.patient);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.person, color: Colors.white, size: 24),
            SizedBox(width: 10),
            Text(
              'Détails du Patient',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        backgroundColor: Color(0xFF85C1E9),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Color(0xFF85C1E9),
                  child: Icon(Icons.person, size: 50, color: Colors.white),
                ),
              ),
              SizedBox(height: 20),
              _buildDetailCard('Nom', patientDetails['name']!, Icons.person),
              _buildDetailCard('Diagnostic', patientDetails['diagnostic']!,
                  Icons.medical_services),
              _buildDetailCard('Email', patientDetails['email']!, Icons.email),
              _buildDetailCard(
                  'Téléphone', patientDetails['phone']!, Icons.phone),
              _buildDetailCard(
                  'Date de naissance', patientDetails['dob']!, Icons.cake),
              _buildDetailCard(
                  'NIC', patientDetails['nic']!, Icons.credit_card),
              _buildDetailCard(
                  'Adresse', patientDetails['address']!, Icons.location_on),
              SizedBox(height: 30),
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    final updatedPatient = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            UpdatePatientScreen(patient: patientDetails),
                      ),
                    );

                    if (updatedPatient != null) {
                      setState(() {
                        patientDetails = updatedPatient;
                      });
                      Navigator.pop(context, updatedPatient);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Modifier les informations',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF85C1E9),
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Retour',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailCard(String title, String value, IconData icon) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 5,
      child: ListTile(
        leading: Icon(icon, color: Color(0xFF85C1E9), size: 30),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.grey[600],
          ),
        ),
        subtitle: Text(
          value,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
