import 'package:app/screens/upcoming_screen/bloc/upcoming_event.dart';
import 'package:app/screens/upcoming_screen/bloc/upcoming_state.dart';
import 'package:app/screens/upcoming_screen/upcoming_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpcomingBloc extends Bloc<UpcomingEvent, UpcomingState> {
  final UpcomingRepository _repository = UpcomingRepository.instance;
  UpcomingBloc() : super(UpcomingLoadingState()) {
    _initState();
    on<UpcomingUpdateDataEvent>((event, state) async {
      _updateList();
    });
  }

  Future<void> _initState() async {
    await Future.delayed(const Duration(seconds: 1));
    _updateList();
  }

  void _updateList(){
    emit(
      UpcomingDataLoaded(_repository.getToDo),
    );
  }

}