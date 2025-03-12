import 'package:hive_ce_flutter/adapters.dart';
import 'package:tiny_weather/local/model/flow.dart';
import 'package:tiny_weather/local/model/todo.dart';

part 'hive_adapters.g.dart';

@GenerateAdapters([AdapterSpec<Todo>(),AdapterSpec<Flow>()])
void _(){}