import 'package:app/screens/add_project/bloc/add_project_bloc.dart';
import 'package:app/screens/add_project/bloc/add_project_event.dart';
import 'package:app/screens/add_project/bloc/add_project_state.dart';
import 'package:app/screens/add_project/projects_list.dart';
import 'package:app/screens/home/home_screen.dart';
import 'package:app/styles/colors.dart';
import 'package:app/styles/styles.dart';
import 'package:app/widgets/button.dart';
import 'package:app/widgets/color_circle.dart';
import 'package:app/widgets/text_fields.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddNewProject extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  AddNewProject({Key? key}) : super(key: key);

  Color circleColor = Colors.white;
  TextEditingController? _controller;


  Color _getColor(index) {
    Color color;
    switch (index) {
      case 0:
        color = Colors.yellow;
        break;
      case 1:
        color = Colors.green;
        break;
      case 2:
        color = color = Colors.red;
        break;
      case 3:
        color = Colors.orange;
        break;
      case 4:
        color = Colors.purple;
        break;
      case 5:
        color = Colors.lightBlueAccent;
        break;
      case 6:
        color = Colors.blue;
        break;
      case 7:
        color = Colors.pink;
        break;
      default:
        color = Colors.white;
        break;
    }
    return color;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.background,
        centerTitle: true,
        leading: const Icon(
          Icons.close,
          color: Colors.white,
        ),
        title: const Text(
          'Add new project',
          style: CustomStyles.title,
        ),
      ),
      body: BlocProvider(
        create: (context) => ProjectBloc(),
        child: BlocBuilder<ProjectBloc, ProjectState>(
            builder: (context, state) {
          return Container(
            color: CustomColors.background,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Stack(
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 16),
                          child: Text(
                            'NAME',
                            style: CustomStyles.grey14,
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextFieldWidget(
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.done,
                            onChanged: (text) => context.read<ProjectBloc>().add(TextChanged(text: text)),
                            validator: null,
                          controller: _controller,
                        ),
                        const SizedBox(height: 24),
                        const Padding(
                          padding: EdgeInsets.only(left: 16),
                          child: Text(
                            'COLOR',
                            style: CustomStyles.grey14,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(8, (index) {
                            return ColorCircleWidget(
                              onTap: () {
                                //context.read<NewProjectBloc>().add(ColorChangedEvent(index: index));
                                 },
                              color: _getColor(index),
                              icon: Icons.access_time,
                              //state.changeIcon,
                              index: index,
                            );
                          }),
                        )

                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      child: ButtonWidget(
                        onPressed: state.isEmpty ? null : ()
                        {
                          context.read<ProjectBloc>().add(AddProject(Project(text: state.text, icon: Icons.done)));
                          // Navigator.of(context).push(MaterialPageRoute(
                          //   builder: (context) =>  HomeScreen(),
                          // ));
                          Navigator.pop(context);
                        },
                        text: 'ADD PROJECT',
                      ),
                      width: double.infinity,
                    ),
                  )
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
