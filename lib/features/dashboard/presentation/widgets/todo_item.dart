import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../shared/extensions/datetime_extensions.dart';
import '../../domain/entities/todo_entity.dart';

class TodoItem extends StatelessWidget {
  final TodoEntity todo;
  final Function(TodoEntity) onToggle;
  final Function(TodoEntity) onDelete;
  final Function(TodoEntity) onTap;

  TodoItem({
    required this.todo,
    required this.onToggle,
    required this.onDelete,
    required this.onTap,
  }) : super(key: ValueKey(todo.id));

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Card(
      color: isDark ? const Color(0xFF2C2C2C) : Colors.white,
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        onTap: () => onTap(todo),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: GestureDetector(
          onTap: () => onToggle(todo),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: todo.isCompleted
                  ? Colors.green.withValues(alpha: 0.1)
                  : null,
              border: Border.all(
                color: todo.isCompleted ? Colors.green : Colors.grey[400]!,
                width: 2,
              ),
            ),
            padding: const EdgeInsets.all(4),
            child: Icon(
              todo.isCompleted ? Icons.check : null,
              size: 20,
              color: Colors.green,
            ),
          ),
        ),
        title: Text(
          todo.title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            decoration: todo.isCompleted ? TextDecoration.lineThrough : null,
            color: todo.isCompleted ? Colors.grey : null,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (todo.description.isNotEmpty) ...[
              const SizedBox(height: 4),
              Text(
                todo.description,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: todo.isCompleted
                      ? (isDark ? Colors.grey[600] : Colors.grey[400])
                      : (isDark
                            ? AppColors.textSecondaryDark
                            : AppColors.textSecondaryLight),
                ),
              ),
            ],
            const SizedBox(height: 8),
            Text(
              todo.createdAt.toReadableDateTime(),
              style: TextStyle(fontSize: 12, color: Colors.grey[400]),
            ),
          ],
        ),
        trailing: IconButton(
          icon: const Icon(Icons.delete_outline, color: Colors.redAccent),
          onPressed: () => onDelete(todo),
        ),
      ),
    );
  }
}
