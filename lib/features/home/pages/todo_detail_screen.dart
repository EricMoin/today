import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TodoDetailScreen extends ConsumerWidget {
  String uuid;
  TodoDetailScreen({super.key,required this.uuid});
  @override
  Widget build(BuildContext context, WidgetRef ref){
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail'),
      ),
    );
  }

}