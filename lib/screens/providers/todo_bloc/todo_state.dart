abstract class ToDoState {}

class ToDoTextState extends ToDoState {

  ToDoTextState({ this.text = '', });

  final String text;

  bool get isEmpty {
    return text.isEmpty ? true : false;
  }

  ToDoTextState copyWith({
    String? text,
  }) {
    return ToDoTextState(
      text: text ?? this.text,
    );
  }

}