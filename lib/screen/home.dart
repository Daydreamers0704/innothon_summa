import 'package:flutter/material.dart';
import 'package:router/constant/color.dart';
import 'package:router/screen/about.dart';
import 'package:router/screen/dashboard.dart';
import 'package:router/screen/support.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Home> {
  String inputtext = "";
  String _gender = "";
  String selectedMonth = 'Month';
  String selectedYear = 'Year';
  bool _isSubmitEnabled = false;
  bool _isInputValid = false;

  List<String> months = [
    'Month',
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];

  List<String> years = [
    'Year',
    for (var i = 1950; i <= DateTime.now().year; i++) i.toString()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      drawer: _buildDrawer(),
      body: _buildBody(),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: tdGrey,
            ),
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.support_agent),
            title: const Text('Support'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        MoodMotionApp()), // Navigate to Main() page
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('About'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        MyAppa()), // Navigate to Main() page
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildBody() {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Padding(
              padding: EdgeInsets.only(
                left: 30.0,
                right: 30.0,
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'Let`s get to know you',
                    style: TextStyle(fontSize: 35,),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    onChanged: (text) {
                      setState(() {
                        inputtext = text;
                        _isInputValid =
                            inputtext.length >= 2; // Minimum length check
                        _updateSubmitButtonState();
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'What would you like to be called',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                          color: _isInputValid
                              ? Colors.green
                              : Colors.red, // Change border color
                          width: 2,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                          color: _isInputValid
                              ? Colors.green
                              : Colors.red, // Change focused border color
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Gender',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _buildGenderOption('Male'),
                      const SizedBox(width: 10),
                      _buildGenderOption('Female'),
                      const SizedBox(width: 10),
                      _buildGenderOption('Other'),
                    ],
                  ),
                  const SizedBox(height: 40),
                  const Text(
                    "Your date of Birth",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          const Text('Select Month'),
                          const SizedBox(height: 20),
                          DropdownButton<String>(
                            value: selectedMonth,
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedMonth = newValue!;
                                _updateSubmitButtonState();
                              });
                            },
                            items: months
                                .map<DropdownMenuItem<String>>((String month) {
                              return DropdownMenuItem<String>(
                                value: month,
                                child: Text(month),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Text('Select Year'),
                          const SizedBox(height: 20),
                          DropdownButton<String>(
                            value: selectedYear,
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedYear = newValue!;
                                _updateSubmitButtonState();
                              });
                            },
                            items: years
                                .map<DropdownMenuItem<String>>((String year) {
                              return DropdownMenuItem<String>(
                                value: year,
                                child: Text(year),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _isSubmitEnabled
                        ? () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Main(
                                        selectedIndex: 2, name: inputtext,
                                      )), // Navigate to Main() page
                            );
                          }
                        : null, // Disable the button if not all fields are valid
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text('Submit'),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildGenderOption(String gender) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _gender = (_gender == gender) ? '' : gender;
            _updateSubmitButtonState();
            FocusScope.of(context).unfocus();
          });
        },
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
                color: _gender == gender ? Colors.blue : Colors.grey),
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.symmetric(vertical: 10),
          alignment: Alignment.center,
          child: Text(
            gender,
            style: TextStyle(
              color: _gender == gender ? Colors.blue : Colors.black,
              fontWeight:
                  _gender == gender ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }

  void _updateSubmitButtonState() {
    setState(() {
      _isSubmitEnabled = inputtext.length >= 2 &&
          _gender.isNotEmpty &&
          selectedMonth != 'Month' &&
          selectedYear != 'Year';
    });
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'MoodMotion',
            style: TextStyle(
              fontSize: 25,
            ),
          ),
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset('assets/image/logo.jpg'),
            ),
          )
        ],
      ),
      iconTheme: const IconThemeData(color: Colors.black),
    );
  }
}
