
import 'package:app/screens/inbox_screen/bloc/inbox_event.dart';
import 'package:app/screens/inbox_screen/bloc/inbox_state.dart';
import 'package:app/screens/inbox_screen/inbox_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InboxBloc extends Bloc<InboxEvent, InboxState> {
  final InboxRepository _repository = InboxRepository.instance;
  InboxBloc() : super(InboxLoadingState()) {
    _initState();
    on<UpdateDataEvent>((event, state) async {
      _updateList();
    });
  }

  Future<void> _initState() async {
    await Future.delayed(const Duration(seconds: 1));
    _updateList();
  }

  void _updateList(){
    emit(
      InboxDataLoaded(_repository.getToDo),
    );
  }

}