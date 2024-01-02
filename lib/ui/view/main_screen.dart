import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const FlutterLogo(),
        title: const Text('image search app'),
      ),
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              labelText: '검색',
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(
                  width: 2,
                  color: Colors.green,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(
                  width: 2,
                  color: Colors.green,
                ),
              ),
              suffixIcon: IconButton(
                icon: const Icon(
                  Icons.search,
                  color: Colors.cyan,
                ),
                onPressed: () {},
              ),
            ),
          )
        ],
      ),
    );
  }
}
