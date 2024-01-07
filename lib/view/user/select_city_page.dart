import 'package:exam_project/bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectCityPage extends StatelessWidget {
  final bool fromWhere;
  const SelectCityPage({super.key, required this.fromWhere});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeAirportsCubit(),
      child: BlocBuilder<HomeAirportsCubit, AirportsStates>(
        builder: (context, state) => Scaffold(
          appBar: AppBar(
            title: TextFormField(
              onChanged: (value) {
                if (value.length > 2) {
                  context
                      .read<HomeAirportsCubit>()
                      .getAirports(cityName: value);
                }
              },
            ),
          ),
          body: Builder(
            builder: (context) {
              switch (state) {
                case AirportSuccessState():
                  return ListView.builder(
                      itemCount: state.airPorts.length,
                      itemBuilder: (context, index) => ListTile(
                            onTap: () {
                              context.read<UserBloc>().add(UpdateCityEvent(
                                  fromWhere, state.airPorts[index]));
                              Navigator.of(context).pop();
                            },
                            title: Text(state.airPorts[index].cityName ?? ""),
                          ));
                case AirportsErrorState():
                  return Center(child: Text(state.error));
                case AirportsLoadingState():
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                // unhandled state
                default:
                  return const SizedBox();
              }
            },
          ),
        ),
      ),
    );
  }
}
