import 'package:exam_project/bloc/user_bloc.dart';
import 'package:exam_project/core/extension/size_build_context_ext.dart';
import 'package:exam_project/view/user/select_city_page.dart';
import 'package:exam_project/view/user/tickets_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserBloc, UserState>(
        listener: (context, state) {
          if (state is TicketsErrorState) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.error)));
          } else if (state is TicketsSuccessState) {
            Navigator.of(context).push(ModalBottomSheetRoute(
              useSafeArea: true,
                builder: (context) =>
                    TicketsPage(recommedationsModel: state.recommedationsModel),
                isScrollControlled: true));
          }
        },
        builder: (context, state) => Scaffold(
              appBar: AppBar(
                title: const Text("User"),
              ),
              body: Builder(
                builder: (context) {
                  if (state is TicketsLoadingState) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    const SelectCityPage(fromWhere: true),
                              ));
                            },
                            child: Container(
                              width: double.infinity,
                              height: context.height * 0.1,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.circular(12)),
                              child: Center(
                                  child: Text(context
                                          .watch<UserBloc>()
                                          .fromWhere
                                          .cityName ??
                                      "")),
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(RawDialogRoute(
                                pageBuilder:
                                    (context, animation, secondaryAnimation) =>
                                        const SelectCityPage(fromWhere: false),
                              ));
                            },
                            child: Container(
                              width: double.infinity,
                              height: context.height * 0.1,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blue),
                                  borderRadius: BorderRadius.circular(12)),
                              child: Center(
                                  child: Text(context
                                          .watch<UserBloc>()
                                          .toWhere
                                          .cityName ??
                                      "")),
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                },
              ),
              floatingActionButton: state is TicketsLoadingState
                  ? Container()
                  : FloatingActionButton(
                      onPressed: () {
                        context.read<UserBloc>().add(TicketSearchEvent());
                      },
                      child: const Icon(Icons.search),
                    ),
            ));
  }
}
