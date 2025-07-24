import 'package:flutter/material.dart';

class IssuesPage extends StatefulWidget {
  const IssuesPage({Key? key}) : super(key: key);

  @override
  State<IssuesPage> createState() => _IssuesPageState();
}

class _IssuesPageState extends State<IssuesPage> {
  final _issueTitleController = TextEditingController();
  final _issueDescriptionController = TextEditingController();

  void _submitIssue() {
    if (_issueTitleController.text.isNotEmpty &&
        _issueDescriptionController.text.isNotEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Issue reported successfully")));
      _issueTitleController.clear();
      _issueDescriptionController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Report an Issue"), leading: BackButton()),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.report_problem_outlined,
              size: 60,
              color: Colors.redAccent,
            ),
            SizedBox(height: 10),
            Text(
              "Report an Issue",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "Found a bug or issue in the system? Help us fix it by providing details.",
              style: TextStyle(color: Colors.grey[700]),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _issueTitleController,
              decoration: InputDecoration(
                labelText: "Issue Title",
                prefixIcon: Icon(Icons.title),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _issueDescriptionController,
              maxLines: 6,
              decoration: InputDecoration(
                labelText: "Describe the issue",
                prefixIcon: Icon(Icons.description),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 25),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: _submitIssue,
                icon: Icon(Icons.report),
                label: Text("Submit Issue"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
