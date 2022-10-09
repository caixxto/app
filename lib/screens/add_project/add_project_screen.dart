import 'package:app/screens/add_project/bloc/add_project_bloc.dart';
import 'package:app/screens/add_project/bloc/add_project_event.dart';
import 'package:app/screens/add_project/bloc/add_project_state.dart';
import 'package:app/screens/home/home_screen.dart';
import 'package:app/styles/colors.dart';
import 'package:app/styles/styles.dart';
import 'package:app/widgets/button.dart';
import 'package:app/widgets/color_circle.dart';
import 'package:app/widgets/text_fields.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:string_to_color/string_to_color.dart';

class AddNewProject extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  AddNewProject({Key? key}) : super(key: key);

  Color circleColor = Colors.white;
  final TextEditingController _controller = TextEditingController();
  Color _color = Colors.white12;


  Color _getColor(index) {
    Color color;
    switch (index) {
      case 0:
        color = Color(0xFFFFEB3B);
        break;
      case 1:
        color = Color(0xFF4CAF50);
        break;
      case 2:
        color = Color(0xFFF44336);
        break;
      case 3:
        color = Color(0xFFFF9800);
        break;
      case 4:
        color = Color(0xFF9C27B0);
        break;
      case 5:
        color = Color(0xFF40C4FF);
        break;
      case 6:
        color = Color(0xFF2196F3);
        break;
      case 7:
        color = Color(0xFFE91E63);
        break;
      default:
        color = Color(0xB3FFFFFF);
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
      body: BlocBuilder<AddProjectBloc, AddProjectState>(
          builder: (context, state) {
        return BlocListener<AddProjectBloc, AddProjectState>(
          listener: (context, state) {
            if (state is NewProjectAdded) {
              Navigator.of(context).pop();
            }
        },
          child: Container(
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
                            onChanged: (text) => context.read<AddProjectBloc>().add(DataChangeEvent()),
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
                              isChecked: _color == _getColor(index) ? true : false,
                              onTap: () {
                                _color = _getColor(index);
                                context.read<AddProjectBloc>().add(DataChangeEvent());
                                 },
                              color: _getColor(index),
                              //icon: Icons.circle_rounded,
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
                        onPressed: _controller.text.isEmpty ? null : () {
                            context
                                .read<AddProjectBloc>()
                                .add(AddProject(_controller.text, _color));
                        },
                        text: 'ADD PROJECT',
                      ),
                      width: double.infinity,
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
