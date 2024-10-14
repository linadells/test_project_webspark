import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project_webspark/core/styles.dart';
import 'package:test_project_webspark/presentation/bloc/bloc/find_route_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController urlController=TextEditingController();
    return Scaffold(
      appBar: AppBar(title: Text('Home screen')),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Set valid API base URL in order to continue',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                Row(
                  children: [
                    const Icon(Icons.sync_alt),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 30),
                        child: TextField(
                          controller: urlController,
                          decoration: const InputDecoration(
                            label: Text('Enter URL'),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Container(width: double.infinity,
              child: TextButton(
                onPressed: () {
                },
                child: Text('Start counting process'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
