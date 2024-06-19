import 'package:flutter/material.dart';

class UAS extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Leap Year Finder',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LeapYearFinderPage(),
    );
  }
}

class LeapYearFinderPage extends StatefulWidget {
  @override
  _LeapYearFinderPageState createState() => _LeapYearFinderPageState();
}

class _LeapYearFinderPageState extends State<LeapYearFinderPage> {
  final TextEditingController startYearController = TextEditingController();
  final TextEditingController endYearController = TextEditingController();
  List<int> leapYears = [];

  void findLeapYears() {
    int? startYear = int.tryParse(startYearController.text);
    int? endYear = int.tryParse(endYearController.text);

    if (startYear != null && endYear != null && startYear <= endYear) {
      List<int> years = [];
      for (int year = startYear; year <= endYear; year++) {
        if (isLeapYear(year)) {
          years.add(year);
        }
      }
      setState(() {
        leapYears = years;
      });
    } else {
      setState(() {
        leapYears = [];
      });
    }
  }

  bool isLeapYear(int year) {
    if (year % 4 == 0) {
      if (year % 100 == 0) {
        if (year % 400 == 0) {
          return true;
        } else {
          return false;
        }
      } else {
        return true;
      }
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Leap Year Finder'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: startYearController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Start Year',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: endYearController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'End Year',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: findLeapYears,
              child: Text('Submit'),
            ),
            SizedBox(height: 16),
            if (leapYears.isNotEmpty)
              Expanded(
                child: ListView.builder(
                  itemCount: leapYears.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('${leapYears[index]}'),
                    );
                  },
                ),
              ),
            if (leapYears.isEmpty)
              Text(
                'No leap years found in the given range.',
                style: TextStyle(color: Colors.red),
              ),
          ],
        ),
      ),
    );
  }
}
