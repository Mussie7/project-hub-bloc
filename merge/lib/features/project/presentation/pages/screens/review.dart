import 'package:flutter/material.dart';
import 'userProfile.dart';

void main() {
  runApp(const Review());
}

class Review extends StatelessWidget {
  const Review({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Applications',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfilePage()),
              );
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(Icons.account_circle),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: CustomSearchDelegate());
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromRGBO(83, 92, 145, 1),
              ),
              child: Text('Menu'),
            ),
            ListTile(
              title: const Text('Home'),
              onTap: () {
                // Handle home tap
              },
            ),
            ListTile(
              title: const Text('Logout'),
              onTap: () {
                // Handle logout tap
              },
            ),
            ListTile(
              title: const Text('Projects'),
              onTap: () {
                // Handle setting tap
              },
            ),
            ListTile(
              title: const Text('Setting'),
              onTap: () {
                // Handle setting tap
              },
            ),
            ListTile(
              title: const Text('FAQ'),
              onTap: () {
                // Handle FAQ tap
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CardWidget(
              title: 'Hospital management',
              description: const [
                'Languages: react,nodejs',
                'Duration: Two months',
                'Application deadline: March 2, 2024.',
                'Intake capacity: 2 developers',
              ],
              imageAssetPath: 'assets/hospital.jpg',
              editAction: () {
                // Handle edit action
              },
              deleteAction: () {
                // Handle delete action
              },
            ),
            CardWidget(
              title: 'Task management',
              description: const [
                'Languages: Angular,nodejs',
                'Duration: Five months',
                'Application deadline: August 23, 2024.',
                'Intake capacity: 3 software engineers',
              ],
              imageAssetPath: 'assets/task.jpg',
              editAction: () {
                // Handle edit action
              },
              deleteAction: () {
                // Handle delete action
              },
            ),
            CardWidget(
              title: 'Library management',
              description: const [
                'Languages: react,nodejs',
                'Duration: Two months',
                'Application deadline: Dec 4, 2024.',
                'Intake capacity: 1 UI designer 2 developers',
              ],
              imageAssetPath: 'assets/Library.jpg',
              editAction: () {
                // Handle edit action
              },
              deleteAction: () {
                // Handle delete action
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CardWidget extends StatelessWidget {
  final String title;
  final List<String> description;
  final String imageAssetPath;
  final Function editAction;
  final Function deleteAction;

  const CardWidget({
    super.key,
    required this.title,
    required this.description,
    required this.imageAssetPath,
    required this.editAction,
    required this.deleteAction,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      color: const Color.fromRGBO(255, 247, 252, 1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15.0),
              topRight: Radius.circular(15.0),
            ),
            child: Image.asset(
              imageAssetPath,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: description
                      .map(
                        (line) => Text(
                          '• $line',
                          style: const TextStyle(fontSize: 16),
                        ),
                      )
                      .toList(),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: editAction as void Function()?,
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromRGBO(83, 92, 145, 1),
                        ),
                      ),
                      child: const Text(
                        'Edit',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: deleteAction as void Function()?,
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromRGBO(83, 92, 145, 1),
                        ),
                      ),
                      child: const Text(
                        'Delete',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Handle search results display
    return Center(
      child: Text('Search results for: $query'),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Return empty list view to remove suggestions
    return ListView();
  }
}
