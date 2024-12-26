import 'package:flutter/material.dart';
import 'patient_details_screen.dart';
import 'create_patient_screen.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final List<Map<String, String>> patients = [
    {
      'name': 'Mohammed Elfatihi',
      'status': 'Critique',
      'diagnostic': 'Hypertension',
      'email': 'mohammed.elfatihi@example.com',
      'phone': '+212 6 12 34 56 78',
      'dob': '12/05/1980',
      'nic': '123456789',
      'gender': 'Homme',
      'address': 'Marrakesh, Maroc',
    },
    {
      'name': 'Jane Smith',
      'status': 'Critique',
      'diagnostic': 'Diabète',
      'email': 'jane.smith@example.com',
      'phone': '+212 6 98 76 54 32',
      'dob': '22/08/1990',
      'nic': '987654321',
      'gender': 'Femme',
      'address': '45 Avenue de Lyon, Lyon, France',
    },
    {
      'name': 'Fatima Zahra Bennani',
      'status': 'Stable',
      'diagnostic': 'Anémie',
      'email': 'fatima.bennani@example.com',
      'phone': '+212 6 45 67 89 01',
      'dob': '15/03/1978',
      'nic': '765432198',
      'gender': 'Femme',
      'address': 'Casablanca, Maroc',
    },
    {
      'name': 'Omar Amrani',
      'status': 'Critique',
      'diagnostic': 'Insuffisance cardiaque',
      'email': 'omar.amrani@example.com',
      'phone': '+212 6 54 32 10 98',
      'dob': '22/11/1965',
      'nic': '112233445',
      'gender': 'Homme',
      'address': 'Rabat, Maroc',
    },
    {
      'name': 'Sara El Idrissi',
      'status': 'Stable',
      'diagnostic': 'Asthme',
      'email': 'sara.elidrissi@example.com',
      'phone': '+212 6 33 22 44 55',
      'dob': '10/07/1992',
      'nic': '998877665',
      'gender': 'Femme',
      'address': 'Fès, Maroc',
    },
    {
      'name': 'Youssef Belkadi',
      'status': 'Stable',
      'diagnostic': 'Diabète de type 2',
      'email': 'youssef.belkadi@example.com',
      'phone': '+212 6 77 88 99 00',
      'dob': '05/06/1970',
      'nic': '334455667',
      'gender': 'Homme',
      'address': 'Tanger, Maroc',
    },
    {
      'name': 'Khadija Outaleb',
      'status': 'Critique',
      'diagnostic': 'Cancer du sein',
      'email': 'khadija.outaleb@example.com',
      'phone': '+212 6 21 43 65 87',
      'dob': '29/09/1985',
      'nic': '556677889',
      'gender': 'Femme',
      'address': 'Oujda, Maroc',
    },
    {
      'name': 'Reda El Othmani',
      'status': 'Stable',
      'diagnostic': 'Hypertension',
      'email': 'reda.elothmani@example.com',
      'phone': '+212 6 12 78 34 56',
      'dob': '17/01/1982',
      'nic': '223344556',
      'gender': 'Homme',
      'address': 'Agadir, Maroc',
    },
    {
      'name': 'Zineb Chakir',
      'status': 'Critique',
      'diagnostic': 'Insuffisance rénale',
      'email': 'zineb.chakir@example.com',
      'phone': '+212 6 34 56 78 90',
      'dob': '30/08/1995',
      'nic': '889977665',
      'gender': 'Femme',
      'address': 'Meknès, Maroc',
    },
    {
      'name': 'Hassan Bouzid',
      'status': 'Stable',
      'diagnostic': 'Diabète et hypertension',
      'email': 'hassan.bouzid@example.com',
      'phone': '+212 6 99 88 77 66',
      'dob': '01/12/1960',
      'nic': '667788990',
      'gender': 'Homme',
      'address': 'Essaouira, Maroc',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste des Patients',
            style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Color(0xFF85C1E9),
        actions: [
          IconButton(
            icon: Icon(Icons.add, size: 28),
            onPressed: () async {
              final newPatient = await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CreatePatientScreen()),
              );

              if (newPatient != null) {
                setState(() {
                  patients.add(newPatient);
                });
              }
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: patients.length,
        itemBuilder: (context, index) {
          final patient = patients[index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Color(0xFF85C1E9),
                child: Icon(Icons.person, color: Colors.white),
              ),
              title: Text(
                patient['name']!,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'Diagnostic : ${patient['diagnostic']}\nÉtat : ${patient['status']}',
                style: TextStyle(color: Colors.grey[600]),
              ),
              trailing: ElevatedButton(
                onPressed: () async {
                  final updatedPatient = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PatientDetailsScreen(
                        patient: patient,
                      ),
                    ),
                  );

                  if (updatedPatient != null) {
                    setState(() {
                      patients[index] = updatedPatient;
                    });
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF85C1E9),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                ),
                child: Text('Détails', style: TextStyle(fontSize: 14)),
              ),
            ),
          );
        },
      ),
    );
  }
}
