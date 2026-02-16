import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:todo_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:todo_app/features/auth/presentation/bloc/auth_event.dart';
import 'package:todo_app/l10n/app_localizations.dart';
import '../../domain/entities/todo_entity.dart';
import '../bloc/dashboard_bloc.dart';
import '../bloc/dashboard_event.dart';
import '../bloc/dashboard_state.dart';
import '../widgets/todo_dialog.dart';
import '../widgets/todo_item.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late final DashboardBloc _dashboardBloc;

  /*
- Verified CRUD reactivity: **SUCCESS**

## Splash Screen and Redirection

I have introduced a `SplashScreen` and a global redirection system to provide a smoother and more robust entry experience.

### Key Changes
- **New Splash Screen**: A dedicated `SplashScreen` serves as the initial landing page.
- **Reactive Redirection**: Implemented `GoRouterRefreshStream` to make `GoRouter` reactively respond to `AuthBloc` state changes.
- **Global Auth Logic**: Centralized redirection logic in `AppRouter`, ensuring users are automatically moved to the appropriate screen (Dashboard or Login) once their authentication status is determined.
- **Cleaned Up Login Screen**: Removed manual redirection from `LoginScreen`, making the authentication flow more declarative and easier to maintain.

### Technical Implementation
- **Utility**: `GoRouterRefreshStream` to bridge BLoC streams with GoRouter's `refreshListenable`.
- **Router Configuration**: Set `initialLocation` to `RouteConstants.splashPath` and enhanced the `redirect` callback.

### Verification Results
- Ran `flutter analyze`: **SUCCESS** (Redirection logic is type-safe and consistent)
- Verified initial auth check: **SUCCESS**
- Verified post-login/logout redirection: **SUCCESS**
*/
  @override
  void initState() {
    super.initState();
    _dashboardBloc = Get.find<DashboardBloc>()..add(const DashboardStarted());
  }

  void _showTodoDialog({TodoEntity? todo}) {
    showDialog(
      context: context,
      builder: (context) => TodoDialog(
        todo: todo,
        onSave: (title, description) {
          if (todo == null) {
            final newTodo = TodoEntity(
              id: DateTime.now().millisecondsSinceEpoch.toString(),
              title: title,
              description: description,
              createdAt: DateTime.now(),
            );
            _dashboardBloc.add(DashboardEvent.addTodo(newTodo));
          } else {
            final updatedTodo = todo.copyWith(
              title: title,
              description: description,
            );
            _dashboardBloc.add(DashboardEvent.updateTodo(updatedTodo));
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return BlocProvider.value(
      value: _dashboardBloc,
      child: Scaffold(
        appBar: AppBar(
          title: Text(l10n.dashboard),
          actions: [
            IconButton(
              onPressed: () {
                context.read<AuthBloc>().add(AuthLogoutRequested());
              },
              icon: const Icon(Icons.logout),
            ),
          ],
        ),
        body: BlocBuilder<DashboardBloc, DashboardState>(
          builder: (context, state) {
            return state.when(
              initial: () => const Center(child: CircularProgressIndicator()),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (message) => Center(child: Text('Error: $message')),
              loaded: (todos) {
                if (todos.isEmpty) {
                  return const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.assignment_outlined,
                          size: 64,
                          color: Colors.grey,
                        ),
                        SizedBox(height: 16),
                        Text(
                          'No tasks yet. Add one!',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  );
                }
                return ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: todos.length,
                  itemBuilder: (context, index) {
                    final todo = todos[index];
                    return TodoItem(
                      todo: todo,
                      onToggle: (t) => _dashboardBloc.add(
                        DashboardEvent.updateTodo(
                          t.copyWith(isCompleted: !t.isCompleted),
                        ),
                      ),
                      onDelete: (t) =>
                          _dashboardBloc.add(DashboardEvent.deleteTodo(t.id)),
                      onTap: (t) => _showTodoDialog(todo: t),
                    );
                  },
                );
              },
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _showTodoDialog(),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
