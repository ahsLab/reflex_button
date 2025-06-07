
import 'package:flutter/material.dart';
import 'package:reflex_button/reflex_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reflex Button Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ButtonDemoPage(),
    );
  }
}

class ButtonDemoPage extends StatelessWidget {
  const ButtonDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reflex Button Demo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            BounceReflexButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Bounce Button Pressed')),
                );
              },
              label: 'Bounce Button',
            ),
            RippleReflexButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Ripple Button Pressed')),
                );
              },
              label: 'Ripple Button',
            ),
            LoadingReflexButton(
              onPressed: () async {
                await Future.delayed(const Duration(seconds: 1));
              },
              label: 'Loading Button',
            ),
            IconReflexButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Icon Button Pressed')),
                );
              },
              label: 'Icon Button',
              icon: Icons.thumb_up,
            ),
            ShadowedReflexButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Shadowed Button Pressed')),
                );
              },
              label: 'Shadowed Button',
            ),
          ],
        ),
      ),
    );
  }
}
