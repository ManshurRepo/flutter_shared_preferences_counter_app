import 'package:fic4_shared_preferences/counter_shared_preferences.dart';
import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int counterValue = 0;

  void getCounterValue() async {
    counterValue = await CounterSharedPreferences().getCounter();
    setState(() {});
  }

  @override
  void initState() {
    getCounterValue();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Counter PAge'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$counterValue',
              style: TextStyle(fontSize: 30),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    await CounterSharedPreferences()
                        .saveCounter(counterValue - 1);
                    getCounterValue();
                  },
                  child: const Text('Kurangi'),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () async {
                    await CounterSharedPreferences()
                        .saveCounter(counterValue + 1);
                    getCounterValue();
                  },
                  child: const Text('Tambah'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
