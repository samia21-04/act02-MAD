import 'package:flutter/material.dart';

void main() {
  runApp(const RunMyApp());
}

class RunMyApp extends StatefulWidget {
  const RunMyApp({super.key});

  @override
  State<RunMyApp> createState() => _RunMyAppState();
}

class _RunMyAppState extends State<RunMyApp> {
  ThemeMode _themeMode = ThemeMode.light; // start with a clear default

  void changeTheme(ThemeMode themeMode) {
    setState(() {
      _themeMode = themeMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Use YOUR state to know the mode (more reliable than Theme.of(context) here)
    final bool isDark = _themeMode == ThemeMode.dark;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Theme Demo',

      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        scaffoldBackgroundColor: Colors.white,
      ),
      darkTheme: ThemeData.dark(),

      themeMode: _themeMode,

      home: Scaffold(
        appBar: AppBar(
          title: const Text('Theme Demo'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Task 1 + Task 3: AnimatedContainer with 500ms duration
              AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                width: 300,
                height: 200,
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  // Animate this color change
                  color: isDark ? Colors.white : Colors.grey,
                  borderRadius: BorderRadius.circular(20),
                ),
                alignment: Alignment.center,
                child: const Text(
                  'Mobile App Development Testing',
                  style: TextStyle(fontSize: 18, color: Colors.black),
                  textAlign: TextAlign.center,
                ),
              ),

              const SizedBox(height: 20),

              const Text('Choose the Theme:', style: TextStyle(fontSize: 16)),

              const SizedBox(height: 10),

              // Task 2 + Task 4: Switch + dynamic icons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(isDark ? Icons.nightlight_round : Icons.wb_sunny),

                  const SizedBox(width: 12),

                  Switch(
                    value: isDark,
                    onChanged: (bool newValue) {
                      changeTheme(newValue ? ThemeMode.dark : ThemeMode.light);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
