import 'package:flutter/material.dart';

void main() {
  runApp(KelasBebas());
}

class KelasBebas extends StatelessWidget {
  KelasBebas({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login/Register Switch',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: LoginRegisterSwitcher(),
    );
  }
}

class LoginRegisterSwitcher extends StatefulWidget {
  @override
  _LoginRegisterSwitcherState createState() => _LoginRegisterSwitcherState();
}

class _LoginRegisterSwitcherState extends State<LoginRegisterSwitcher> {
  bool isLogin = true; // Track if the current screen is Login or Register

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isLogin ? "Login" : "Register"),
        backgroundColor: Colors.yellow,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Simulate successful login/register and navigate to HomePage
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              child: Text(isLogin ? 'Sign In' : 'Register'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 48),
              ),
            ),
            SizedBox(height: 16.0),
            GestureDetector(
              onTap: () {
                // Toggle between Login and Register
                setState(() {
                  isLogin = !isLogin;
                });
              },
              child: Text(
                isLogin
                    ? "Don't have an account? Register"
                    : "Already have an account? Sign In",
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<Map<String, String>> items = List.generate(
    12,
    (index) => {
      "title": "Title",
      "updateDate": index % 3 == 0
          ? "Updated today"
          : index % 3 == 1
              ? "Updated yesterday"
              : "Updated 2 days ago"
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              // Add refresh functionality here
            },
          ),
          IconButton(
            icon: Icon(Icons.logout), // Logout icon
            onPressed: () {
              // Navigate to an empty page
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => EmptyPage()),
                (Route<dynamic> route) => false, // Remove all previous routes
              );
            },
          ),
        ],
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            // Add menu functionality here
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // Number of columns
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
            childAspectRatio: 0.75, // Adjust to make items look similar
          ),
          itemCount: items.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                // Navigate to detail page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPage(
                      title: items[index]['title']!,
                      updateDate: items[index]['updateDate']!,
                    ),
                  ),
                );
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Placeholder for the image
                      Container(
                        height: 80.0,
                        width: 80.0,
                        color: Colors.grey[300],
                        child: Icon(
                          Icons.image,
                          size: 40,
                          color: Colors.grey[600],
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        items[index]["title"]!,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 4.0),
                      Text(
                        items[index]["updateDate"]!,
                        style: TextStyle(color: Colors.grey, fontSize: 12.0),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final String title;
  final String updateDate;

  DetailPage({
    required this.title,
    required this.updateDate,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Placeholder for an image
            Container(
              height: 200,
              color: Colors.grey[300],
              child: Icon(
                Icons.image,
                size: 100,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              title,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'Published: $updateDate',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent at vehicula leo, in varius lorem. Sed id elementum leo, in laoreet est. Aenean nec sollicitudin ipsum. Pellentesque vel libero at neque tincidunt scelerisque.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 24.0),
            Text(
              "Other Posts",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(Icons.image, size: 50),
                    title: Text('Title'),
                    subtitle: Text('Description of the post here.'),
                    trailing: Text('Today • 23 min'),
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

// New empty page
class EmptyPage extends StatelessWidget {
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Logout'),
      ),
      body: Center(
        child: Text('Womp Womp.'),
      ),
    );
  }
}
