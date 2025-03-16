import 'package:flutter/material.dart';

void main() {
  runApp(TimeTrackerApp());
}

class TimeTrackerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Time Tracker',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  List<String> timeEntries = []; // Empty list at the start
  List<String> projects = []; // Empty list for projects

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Time Tracker"),
        bottom: TabBar(
          controller: _tabController,
          tabs: [Tab(text: "Home"), Tab(text: "Projects")],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Home Screen (Time Entries)
          timeEntries.isEmpty
              ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.hourglass_empty, size: 100, color: Colors.grey),
                    SizedBox(height: 10),
                    Text(
                      "No time entries found.\nStart tracking your time!",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  ],
                ),
              )
              : ListView.builder(
                itemCount: timeEntries.length,
                itemBuilder: (context, index) {
                  return ListTile(title: Text(timeEntries[index]));
                },
              ),

          // Projects Tab (Empty State)
          projects.isEmpty
              ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.folder_open, size: 100, color: Colors.grey),
                    SizedBox(height: 10),
                    Text(
                      "No projects found.\nCreate your first project!",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  ],
                ),
              )
              : ListView.builder(
                itemCount: projects.length,
                itemBuilder: (context, index) {
                  return ListTile(title: Text(projects[index]));
                },
              ),
        ],
      ),
    );
  }
}
