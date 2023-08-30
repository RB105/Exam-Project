import 'package:exam_project/core/extension/size_build_context_ext.dart';
import 'package:exam_project/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeProvider(),
      builder: (context, child) => _myScaffold(),
    );
  }

  Scaffold _myScaffold() {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Builder(
        builder: (context) {
          // loading state
          if (context.watch<HomeProvider>().isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (context.watch<HomeProvider>().error.isNotEmpty) {
            // error state
            return Center(
                child: InkWell(
              borderRadius: BorderRadius.circular(24),
              // refresh state
              onTap: context.watch<HomeProvider>().getAll,
              child: SizedBox(
                width: context.width * 0.6,
                height: context.height * 0.2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(context.watch<HomeProvider>().error),
                     const Icon(Icons.refresh_rounded)
                  ],
                ),
              ),
            ));
          } else {
            // success state
            return ListView(
              children: [
                // users
                ExpansionTile(
                  title: const Text('Users'),
                  children: <Widget>[
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      itemCount: context.watch<HomeProvider>().users.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(context
                              .watch<HomeProvider>()
                              .users[index]
                              .name
                              .toString()),
                        );
                      },
                    )
                  ],
                ),
                // posts
                ExpansionTile(
                  title: const Text("Posts"),
                  children: <Widget>[
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      itemCount: context.watch<HomeProvider>().posts.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(context
                              .watch<HomeProvider>()
                              .posts[index]
                              .title
                              .toString()),
                        );
                      },
                    )
                  ],
                )
                // todos
                ,
                ExpansionTile(
                  title: const Text("Todos"),
                  children: <Widget>[
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      itemCount: context.watch<HomeProvider>().todos.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(context
                              .watch<HomeProvider>()
                              .todos[index]
                              .title
                              .toString()),
                        );
                      },
                    )
                  ],
                )
              ],
            );
          }
        },
      ),
    );
  }
}
