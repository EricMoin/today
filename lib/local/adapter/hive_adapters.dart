import 'package:hive_ce_flutter/adapters.dart';
import 'package:today/local/model/flow.dart';
import 'package:today/local/model/info.dart';
import 'package:today/local/model/plan.dart';
import 'package:today/local/model/todo.dart';

part 'hive_adapters.g.dart';

@GenerateAdapters([
  AdapterSpec<BaseInfo>(),
  AdapterSpec<BaseState>(),
  AdapterSpec<Todo>(),
  AdapterSpec<Flow>(),
  AdapterSpec<Plan>(),
  ])
void _(){}