import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:today/router/route_data.dart';

class EditSelectScreen extends ConsumerWidget {
  const EditSelectScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Edit Type', style: theme.textTheme.titleLarge),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 16,
          children: [
            EditOptionCard(
              title: 'Todo',
              description: 'Create a Todo.',
              icon: Icons.task_alt,
              color: Colors.blue,
              onTap: () => EditTodoRoute().push(context),
            ),
            EditOptionCard( 
              title: 'Flow',
              description: 'Create a Flow with multiple todos.',
              icon: Icons.account_tree,
              color: Colors.green,
              onTap: () => EditFlowRoute().push(context),
            ),
            EditOptionCard(
              title: 'Plan',
              description: 'Create a periodic plan.',
              icon: Icons.calendar_today,
              color: Colors.orange,
              onTap: () => EditPlanRoute().push(context),
            ),
          ],
        ),
      ),
    );
  }

} 
class EditOptionCard extends StatelessWidget{
  late ThemeData theme;
  String title;
  String description;
  IconData icon;
  Color color;
  void Function()? onTap;
  EditOptionCard({
    super.key,required this.title,
    required this.description,
    required this.icon,
    required this.color,
    required this.onTap});
  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context);
    return Card(
      elevation: 0,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: color, size: 32),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      description,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
              const Icon(Icons.arrow_forward_ios, size: 16),
            ],
          ),
        ),
      ),
    );
  }
}