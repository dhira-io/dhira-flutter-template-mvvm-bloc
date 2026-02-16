// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DashboardEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(TodoEntity todo) addTodo,
    required TResult Function(TodoEntity todo) updateTodo,
    required TResult Function(String id) deleteTodo,
    required TResult Function(List<TodoEntity> todos) todosUpdated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(TodoEntity todo)? addTodo,
    TResult? Function(TodoEntity todo)? updateTodo,
    TResult? Function(String id)? deleteTodo,
    TResult? Function(List<TodoEntity> todos)? todosUpdated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(TodoEntity todo)? addTodo,
    TResult Function(TodoEntity todo)? updateTodo,
    TResult Function(String id)? deleteTodo,
    TResult Function(List<TodoEntity> todos)? todosUpdated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DashboardStarted value) started,
    required TResult Function(AddTodoEvent value) addTodo,
    required TResult Function(UpdateTodoEvent value) updateTodo,
    required TResult Function(DeleteTodoEvent value) deleteTodo,
    required TResult Function(TodosUpdated value) todosUpdated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DashboardStarted value)? started,
    TResult? Function(AddTodoEvent value)? addTodo,
    TResult? Function(UpdateTodoEvent value)? updateTodo,
    TResult? Function(DeleteTodoEvent value)? deleteTodo,
    TResult? Function(TodosUpdated value)? todosUpdated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DashboardStarted value)? started,
    TResult Function(AddTodoEvent value)? addTodo,
    TResult Function(UpdateTodoEvent value)? updateTodo,
    TResult Function(DeleteTodoEvent value)? deleteTodo,
    TResult Function(TodosUpdated value)? todosUpdated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardEventCopyWith<$Res> {
  factory $DashboardEventCopyWith(
          DashboardEvent value, $Res Function(DashboardEvent) then) =
      _$DashboardEventCopyWithImpl<$Res, DashboardEvent>;
}

/// @nodoc
class _$DashboardEventCopyWithImpl<$Res, $Val extends DashboardEvent>
    implements $DashboardEventCopyWith<$Res> {
  _$DashboardEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$DashboardStartedImplCopyWith<$Res> {
  factory _$$DashboardStartedImplCopyWith(_$DashboardStartedImpl value,
          $Res Function(_$DashboardStartedImpl) then) =
      __$$DashboardStartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DashboardStartedImplCopyWithImpl<$Res>
    extends _$DashboardEventCopyWithImpl<$Res, _$DashboardStartedImpl>
    implements _$$DashboardStartedImplCopyWith<$Res> {
  __$$DashboardStartedImplCopyWithImpl(_$DashboardStartedImpl _value,
      $Res Function(_$DashboardStartedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$DashboardStartedImpl implements DashboardStarted {
  const _$DashboardStartedImpl();

  @override
  String toString() {
    return 'DashboardEvent.started()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DashboardStartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(TodoEntity todo) addTodo,
    required TResult Function(TodoEntity todo) updateTodo,
    required TResult Function(String id) deleteTodo,
    required TResult Function(List<TodoEntity> todos) todosUpdated,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(TodoEntity todo)? addTodo,
    TResult? Function(TodoEntity todo)? updateTodo,
    TResult? Function(String id)? deleteTodo,
    TResult? Function(List<TodoEntity> todos)? todosUpdated,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(TodoEntity todo)? addTodo,
    TResult Function(TodoEntity todo)? updateTodo,
    TResult Function(String id)? deleteTodo,
    TResult Function(List<TodoEntity> todos)? todosUpdated,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DashboardStarted value) started,
    required TResult Function(AddTodoEvent value) addTodo,
    required TResult Function(UpdateTodoEvent value) updateTodo,
    required TResult Function(DeleteTodoEvent value) deleteTodo,
    required TResult Function(TodosUpdated value) todosUpdated,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DashboardStarted value)? started,
    TResult? Function(AddTodoEvent value)? addTodo,
    TResult? Function(UpdateTodoEvent value)? updateTodo,
    TResult? Function(DeleteTodoEvent value)? deleteTodo,
    TResult? Function(TodosUpdated value)? todosUpdated,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DashboardStarted value)? started,
    TResult Function(AddTodoEvent value)? addTodo,
    TResult Function(UpdateTodoEvent value)? updateTodo,
    TResult Function(DeleteTodoEvent value)? deleteTodo,
    TResult Function(TodosUpdated value)? todosUpdated,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class DashboardStarted implements DashboardEvent {
  const factory DashboardStarted() = _$DashboardStartedImpl;
}

/// @nodoc
abstract class _$$AddTodoEventImplCopyWith<$Res> {
  factory _$$AddTodoEventImplCopyWith(
          _$AddTodoEventImpl value, $Res Function(_$AddTodoEventImpl) then) =
      __$$AddTodoEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({TodoEntity todo});

  $TodoEntityCopyWith<$Res> get todo;
}

/// @nodoc
class __$$AddTodoEventImplCopyWithImpl<$Res>
    extends _$DashboardEventCopyWithImpl<$Res, _$AddTodoEventImpl>
    implements _$$AddTodoEventImplCopyWith<$Res> {
  __$$AddTodoEventImplCopyWithImpl(
      _$AddTodoEventImpl _value, $Res Function(_$AddTodoEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? todo = null,
  }) {
    return _then(_$AddTodoEventImpl(
      null == todo
          ? _value.todo
          : todo // ignore: cast_nullable_to_non_nullable
              as TodoEntity,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $TodoEntityCopyWith<$Res> get todo {
    return $TodoEntityCopyWith<$Res>(_value.todo, (value) {
      return _then(_value.copyWith(todo: value));
    });
  }
}

/// @nodoc

class _$AddTodoEventImpl implements AddTodoEvent {
  const _$AddTodoEventImpl(this.todo);

  @override
  final TodoEntity todo;

  @override
  String toString() {
    return 'DashboardEvent.addTodo(todo: $todo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddTodoEventImpl &&
            (identical(other.todo, todo) || other.todo == todo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, todo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddTodoEventImplCopyWith<_$AddTodoEventImpl> get copyWith =>
      __$$AddTodoEventImplCopyWithImpl<_$AddTodoEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(TodoEntity todo) addTodo,
    required TResult Function(TodoEntity todo) updateTodo,
    required TResult Function(String id) deleteTodo,
    required TResult Function(List<TodoEntity> todos) todosUpdated,
  }) {
    return addTodo(todo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(TodoEntity todo)? addTodo,
    TResult? Function(TodoEntity todo)? updateTodo,
    TResult? Function(String id)? deleteTodo,
    TResult? Function(List<TodoEntity> todos)? todosUpdated,
  }) {
    return addTodo?.call(todo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(TodoEntity todo)? addTodo,
    TResult Function(TodoEntity todo)? updateTodo,
    TResult Function(String id)? deleteTodo,
    TResult Function(List<TodoEntity> todos)? todosUpdated,
    required TResult orElse(),
  }) {
    if (addTodo != null) {
      return addTodo(todo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DashboardStarted value) started,
    required TResult Function(AddTodoEvent value) addTodo,
    required TResult Function(UpdateTodoEvent value) updateTodo,
    required TResult Function(DeleteTodoEvent value) deleteTodo,
    required TResult Function(TodosUpdated value) todosUpdated,
  }) {
    return addTodo(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DashboardStarted value)? started,
    TResult? Function(AddTodoEvent value)? addTodo,
    TResult? Function(UpdateTodoEvent value)? updateTodo,
    TResult? Function(DeleteTodoEvent value)? deleteTodo,
    TResult? Function(TodosUpdated value)? todosUpdated,
  }) {
    return addTodo?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DashboardStarted value)? started,
    TResult Function(AddTodoEvent value)? addTodo,
    TResult Function(UpdateTodoEvent value)? updateTodo,
    TResult Function(DeleteTodoEvent value)? deleteTodo,
    TResult Function(TodosUpdated value)? todosUpdated,
    required TResult orElse(),
  }) {
    if (addTodo != null) {
      return addTodo(this);
    }
    return orElse();
  }
}

abstract class AddTodoEvent implements DashboardEvent {
  const factory AddTodoEvent(final TodoEntity todo) = _$AddTodoEventImpl;

  TodoEntity get todo;
  @JsonKey(ignore: true)
  _$$AddTodoEventImplCopyWith<_$AddTodoEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateTodoEventImplCopyWith<$Res> {
  factory _$$UpdateTodoEventImplCopyWith(_$UpdateTodoEventImpl value,
          $Res Function(_$UpdateTodoEventImpl) then) =
      __$$UpdateTodoEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({TodoEntity todo});

  $TodoEntityCopyWith<$Res> get todo;
}

/// @nodoc
class __$$UpdateTodoEventImplCopyWithImpl<$Res>
    extends _$DashboardEventCopyWithImpl<$Res, _$UpdateTodoEventImpl>
    implements _$$UpdateTodoEventImplCopyWith<$Res> {
  __$$UpdateTodoEventImplCopyWithImpl(
      _$UpdateTodoEventImpl _value, $Res Function(_$UpdateTodoEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? todo = null,
  }) {
    return _then(_$UpdateTodoEventImpl(
      null == todo
          ? _value.todo
          : todo // ignore: cast_nullable_to_non_nullable
              as TodoEntity,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $TodoEntityCopyWith<$Res> get todo {
    return $TodoEntityCopyWith<$Res>(_value.todo, (value) {
      return _then(_value.copyWith(todo: value));
    });
  }
}

/// @nodoc

class _$UpdateTodoEventImpl implements UpdateTodoEvent {
  const _$UpdateTodoEventImpl(this.todo);

  @override
  final TodoEntity todo;

  @override
  String toString() {
    return 'DashboardEvent.updateTodo(todo: $todo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateTodoEventImpl &&
            (identical(other.todo, todo) || other.todo == todo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, todo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateTodoEventImplCopyWith<_$UpdateTodoEventImpl> get copyWith =>
      __$$UpdateTodoEventImplCopyWithImpl<_$UpdateTodoEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(TodoEntity todo) addTodo,
    required TResult Function(TodoEntity todo) updateTodo,
    required TResult Function(String id) deleteTodo,
    required TResult Function(List<TodoEntity> todos) todosUpdated,
  }) {
    return updateTodo(todo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(TodoEntity todo)? addTodo,
    TResult? Function(TodoEntity todo)? updateTodo,
    TResult? Function(String id)? deleteTodo,
    TResult? Function(List<TodoEntity> todos)? todosUpdated,
  }) {
    return updateTodo?.call(todo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(TodoEntity todo)? addTodo,
    TResult Function(TodoEntity todo)? updateTodo,
    TResult Function(String id)? deleteTodo,
    TResult Function(List<TodoEntity> todos)? todosUpdated,
    required TResult orElse(),
  }) {
    if (updateTodo != null) {
      return updateTodo(todo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DashboardStarted value) started,
    required TResult Function(AddTodoEvent value) addTodo,
    required TResult Function(UpdateTodoEvent value) updateTodo,
    required TResult Function(DeleteTodoEvent value) deleteTodo,
    required TResult Function(TodosUpdated value) todosUpdated,
  }) {
    return updateTodo(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DashboardStarted value)? started,
    TResult? Function(AddTodoEvent value)? addTodo,
    TResult? Function(UpdateTodoEvent value)? updateTodo,
    TResult? Function(DeleteTodoEvent value)? deleteTodo,
    TResult? Function(TodosUpdated value)? todosUpdated,
  }) {
    return updateTodo?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DashboardStarted value)? started,
    TResult Function(AddTodoEvent value)? addTodo,
    TResult Function(UpdateTodoEvent value)? updateTodo,
    TResult Function(DeleteTodoEvent value)? deleteTodo,
    TResult Function(TodosUpdated value)? todosUpdated,
    required TResult orElse(),
  }) {
    if (updateTodo != null) {
      return updateTodo(this);
    }
    return orElse();
  }
}

abstract class UpdateTodoEvent implements DashboardEvent {
  const factory UpdateTodoEvent(final TodoEntity todo) = _$UpdateTodoEventImpl;

  TodoEntity get todo;
  @JsonKey(ignore: true)
  _$$UpdateTodoEventImplCopyWith<_$UpdateTodoEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteTodoEventImplCopyWith<$Res> {
  factory _$$DeleteTodoEventImplCopyWith(_$DeleteTodoEventImpl value,
          $Res Function(_$DeleteTodoEventImpl) then) =
      __$$DeleteTodoEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$DeleteTodoEventImplCopyWithImpl<$Res>
    extends _$DashboardEventCopyWithImpl<$Res, _$DeleteTodoEventImpl>
    implements _$$DeleteTodoEventImplCopyWith<$Res> {
  __$$DeleteTodoEventImplCopyWithImpl(
      _$DeleteTodoEventImpl _value, $Res Function(_$DeleteTodoEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$DeleteTodoEventImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DeleteTodoEventImpl implements DeleteTodoEvent {
  const _$DeleteTodoEventImpl(this.id);

  @override
  final String id;

  @override
  String toString() {
    return 'DashboardEvent.deleteTodo(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteTodoEventImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteTodoEventImplCopyWith<_$DeleteTodoEventImpl> get copyWith =>
      __$$DeleteTodoEventImplCopyWithImpl<_$DeleteTodoEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(TodoEntity todo) addTodo,
    required TResult Function(TodoEntity todo) updateTodo,
    required TResult Function(String id) deleteTodo,
    required TResult Function(List<TodoEntity> todos) todosUpdated,
  }) {
    return deleteTodo(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(TodoEntity todo)? addTodo,
    TResult? Function(TodoEntity todo)? updateTodo,
    TResult? Function(String id)? deleteTodo,
    TResult? Function(List<TodoEntity> todos)? todosUpdated,
  }) {
    return deleteTodo?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(TodoEntity todo)? addTodo,
    TResult Function(TodoEntity todo)? updateTodo,
    TResult Function(String id)? deleteTodo,
    TResult Function(List<TodoEntity> todos)? todosUpdated,
    required TResult orElse(),
  }) {
    if (deleteTodo != null) {
      return deleteTodo(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DashboardStarted value) started,
    required TResult Function(AddTodoEvent value) addTodo,
    required TResult Function(UpdateTodoEvent value) updateTodo,
    required TResult Function(DeleteTodoEvent value) deleteTodo,
    required TResult Function(TodosUpdated value) todosUpdated,
  }) {
    return deleteTodo(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DashboardStarted value)? started,
    TResult? Function(AddTodoEvent value)? addTodo,
    TResult? Function(UpdateTodoEvent value)? updateTodo,
    TResult? Function(DeleteTodoEvent value)? deleteTodo,
    TResult? Function(TodosUpdated value)? todosUpdated,
  }) {
    return deleteTodo?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DashboardStarted value)? started,
    TResult Function(AddTodoEvent value)? addTodo,
    TResult Function(UpdateTodoEvent value)? updateTodo,
    TResult Function(DeleteTodoEvent value)? deleteTodo,
    TResult Function(TodosUpdated value)? todosUpdated,
    required TResult orElse(),
  }) {
    if (deleteTodo != null) {
      return deleteTodo(this);
    }
    return orElse();
  }
}

abstract class DeleteTodoEvent implements DashboardEvent {
  const factory DeleteTodoEvent(final String id) = _$DeleteTodoEventImpl;

  String get id;
  @JsonKey(ignore: true)
  _$$DeleteTodoEventImplCopyWith<_$DeleteTodoEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TodosUpdatedImplCopyWith<$Res> {
  factory _$$TodosUpdatedImplCopyWith(
          _$TodosUpdatedImpl value, $Res Function(_$TodosUpdatedImpl) then) =
      __$$TodosUpdatedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<TodoEntity> todos});
}

/// @nodoc
class __$$TodosUpdatedImplCopyWithImpl<$Res>
    extends _$DashboardEventCopyWithImpl<$Res, _$TodosUpdatedImpl>
    implements _$$TodosUpdatedImplCopyWith<$Res> {
  __$$TodosUpdatedImplCopyWithImpl(
      _$TodosUpdatedImpl _value, $Res Function(_$TodosUpdatedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? todos = null,
  }) {
    return _then(_$TodosUpdatedImpl(
      null == todos
          ? _value._todos
          : todos // ignore: cast_nullable_to_non_nullable
              as List<TodoEntity>,
    ));
  }
}

/// @nodoc

class _$TodosUpdatedImpl implements TodosUpdated {
  const _$TodosUpdatedImpl(final List<TodoEntity> todos) : _todos = todos;

  final List<TodoEntity> _todos;
  @override
  List<TodoEntity> get todos {
    if (_todos is EqualUnmodifiableListView) return _todos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_todos);
  }

  @override
  String toString() {
    return 'DashboardEvent.todosUpdated(todos: $todos)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TodosUpdatedImpl &&
            const DeepCollectionEquality().equals(other._todos, _todos));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_todos));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TodosUpdatedImplCopyWith<_$TodosUpdatedImpl> get copyWith =>
      __$$TodosUpdatedImplCopyWithImpl<_$TodosUpdatedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(TodoEntity todo) addTodo,
    required TResult Function(TodoEntity todo) updateTodo,
    required TResult Function(String id) deleteTodo,
    required TResult Function(List<TodoEntity> todos) todosUpdated,
  }) {
    return todosUpdated(todos);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(TodoEntity todo)? addTodo,
    TResult? Function(TodoEntity todo)? updateTodo,
    TResult? Function(String id)? deleteTodo,
    TResult? Function(List<TodoEntity> todos)? todosUpdated,
  }) {
    return todosUpdated?.call(todos);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(TodoEntity todo)? addTodo,
    TResult Function(TodoEntity todo)? updateTodo,
    TResult Function(String id)? deleteTodo,
    TResult Function(List<TodoEntity> todos)? todosUpdated,
    required TResult orElse(),
  }) {
    if (todosUpdated != null) {
      return todosUpdated(todos);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DashboardStarted value) started,
    required TResult Function(AddTodoEvent value) addTodo,
    required TResult Function(UpdateTodoEvent value) updateTodo,
    required TResult Function(DeleteTodoEvent value) deleteTodo,
    required TResult Function(TodosUpdated value) todosUpdated,
  }) {
    return todosUpdated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DashboardStarted value)? started,
    TResult? Function(AddTodoEvent value)? addTodo,
    TResult? Function(UpdateTodoEvent value)? updateTodo,
    TResult? Function(DeleteTodoEvent value)? deleteTodo,
    TResult? Function(TodosUpdated value)? todosUpdated,
  }) {
    return todosUpdated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DashboardStarted value)? started,
    TResult Function(AddTodoEvent value)? addTodo,
    TResult Function(UpdateTodoEvent value)? updateTodo,
    TResult Function(DeleteTodoEvent value)? deleteTodo,
    TResult Function(TodosUpdated value)? todosUpdated,
    required TResult orElse(),
  }) {
    if (todosUpdated != null) {
      return todosUpdated(this);
    }
    return orElse();
  }
}

abstract class TodosUpdated implements DashboardEvent {
  const factory TodosUpdated(final List<TodoEntity> todos) = _$TodosUpdatedImpl;

  List<TodoEntity> get todos;
  @JsonKey(ignore: true)
  _$$TodosUpdatedImplCopyWith<_$TodosUpdatedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
