import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Text(
              "Welcome Back",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            Spacer(),
            CircleAvatar(
              backgroundImage: NetworkImage('https://example.com/user_profile.jpg'),
              radius: 20,
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Recent activity",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Expanded(
              child: ListView(
                children: [
                  ActivityCard(
                    title: "Astha App Redesign",
                    description: "One more week",
                    progress: 0.75,
                    color: Colors.blue[100]!,
                  ),
                  SizedBox(height: 8),
                  ActivityCard(
                    title: "Slack App Redesign",
                    description: "Wed, 22 Nov 2024",
                    progress: 0.50,
                    color: Colors.yellow[100]!,
                  ),
                  SizedBox(height: 8),
                  ActivityCard(
                    title: "Gideon Project",
                    description: "Wed, 22 Nov 2024",
                    progress: 0.25,
                    color: Colors.purple[100]!,
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Text(
              "Today's task",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            TaskCard(
              title: "Banking App Design",
              teamMembers: ['https://example.com/user1.jpg', 'https://example.com/user2.jpg'],
              deadline: "6d",
              progress: 0.46,
            ),
            SizedBox(height: 8),
            TaskCard(
              title: "Wallet App Design",
              teamMembers: ['https://example.com/user3.jpg', 'https://example.com/user4.jpg'],
              deadline: "3d",
              progress: 0.30,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(icon: Icon(Icons.home), onPressed: () {}),
            IconButton(icon: Icon(Icons.calendar_today), onPressed: () {}),
            SizedBox(width: 48), // Espacio para el botón central flotante
            IconButton(icon: Icon(Icons.notifications), onPressed: () {}),
            IconButton(icon: Icon(Icons.settings), onPressed: () {}),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
        backgroundColor: Colors.black,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class ActivityCard extends StatelessWidget {
  final String title;
  final String description;
  final double progress;
  final Color color;

  const ActivityCard({
    required this.title,
    required this.description,
    required this.progress,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 4),
          Text(
            description,
            style: TextStyle(color: Colors.black54),
          ),
          SizedBox(height: 8),
          LinearProgressIndicator(
            value: progress,
            backgroundColor: Colors.white,
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}

class TaskCard extends StatelessWidget {
  final String title;
  final List<String> teamMembers;
  final String deadline;
  final double progress;

  const TaskCard({
    required this.title,
    required this.teamMembers,
    required this.deadline,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Row(
                  children: teamMembers.map((url) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 4.0),
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(url),
                        radius: 12,
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
          Column(
            children: [
              Text(deadline, style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 4),
              CircularProgressIndicator(
                value: progress,
                backgroundColor: Colors.grey[300],
                color: Colors.blue,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

