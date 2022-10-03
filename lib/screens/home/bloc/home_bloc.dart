import 'package:app/screens/add_project/projects_list.dart';
import 'package:app/screens/home/bloc/home_event.dart';
import 'package:app/screens/home/bloc/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final ProjectRepository _repository = ProjectRepository.instance;
  HomeBloc() : super(LoadingState()) {
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
      DataLoaded(_repository.getProjects),
    );
  }



}