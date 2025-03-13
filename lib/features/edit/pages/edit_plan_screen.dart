import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiny_weather/local/model/info.dart';
import 'package:tiny_weather/local/model/plan.dart';
import 'package:uuid/uuid.dart';

class EditPlanScreen extends ConsumerStatefulWidget {
  const EditPlanScreen({super.key});

  @override
  ConsumerState<EditPlanScreen> createState() => _EditPlanScreenState();
}

class _EditPlanScreenState extends ConsumerState<EditPlanScreen> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
} 