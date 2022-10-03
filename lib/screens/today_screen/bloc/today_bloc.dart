import 'package:app/screens/today_screen/bloc/today_event.dart';
import 'package:app/screens/today_screen/bloc/today_state.dart';
import 'package:app/screens/today_screen/today_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodayBloc extends Bloc<TodayEvent, TodayState> {
  final TodayRepository _repository = TodayRepository.instance;
  TodayBloc() : super(TodayLoadingState()) {
    _initState();
    on<TodayUpdateDataEvent>((event, state) async {
      _updateList();
    });
  }

  Future<void> _initState() async {
    await Future.delayed(const Duration(seconds: 1));
    _updateList();
  }

  void _updateList(){
    emit(
      TodayDataLoaded(_repository.getToDo),
    );
  }

}