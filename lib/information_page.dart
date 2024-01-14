import 'package:flutter/material.dart';

class InformationPage extends StatelessWidget {
  const InformationPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 220, 20, 60),
        title: const Text('Hogwarts Houses'),
      ),
      body: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.black87,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildHouseInfo(
                  'Gryffindor',
                  'Values courage, bravery, nerve, and chivalry. Mascot fo Gryffindor is the lion, and its colours are scarlet red and gold',
                  'images/Gryffindor-Logo.png',
                  Color.fromARGB(255, 136, 5, 5),
                ),
                _buildHouseInfo(
                  'Hufflepuff',
                  'Values loyalty, patience, dedication, and a strong work ethic. Its mascot is the badger, and its colors are yellow and black.',
                  'images/hufflepuff-Logo.png',
                  Colors.amber,
                ),
                _buildHouseInfo(
                  'Ravenclaw',
                  'Values intelligence, wisdom, creativity, and a love for learning. Its mascot is the eagle, and its colors are blue and silver.',
                  'images/ravenclaw-Logo.png',
                  Colors.blue,
                ),
                _buildHouseInfo(
                  'Slytherin',
                  'Values ambition, cunning, leadership, and resourcefulness. Its mascot is the serpent, and its colours are green and silver',
                  'images/slytherin-Logo.png',
                  Colors.green,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHouseInfo(String houseName, String description, String imagePath,
      Color titleColor) {
    return Container(
      margin: EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(
            houseName,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: titleColor,
              fontSize: 20.00,
            ),
          ),
          SizedBox(height: 8.0),
          Image.asset(
            imagePath,
            width: 300.0, // Adjust the width as needed
            height: 300.0, // Adjust the height as needed
          ),
          SizedBox(height: 8.0),
          Text(
            description,
            style: TextStyle(
              color: Colors.white,
            ),
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}
