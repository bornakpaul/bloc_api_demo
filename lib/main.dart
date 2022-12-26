import 'package:bloc_api_demo/bloc/app_bloc.dart';
import 'package:bloc_api_demo/bloc/app_event.dart';
import 'package:bloc_api_demo/bloc/app_state.dart';
import 'package:bloc_api_demo/model/user_model.dart';
import 'package:bloc_api_demo/repos/repositories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Bloc Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: RepositoryProvider(
          create: (context) => UserRepository(),
          child: const Home(),
        ));
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          UserBloc(RepositoryProvider.of<UserRepository>(context))
            ..add(LoadUserEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Bloc Demo"),
        ),
        body: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is UserLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is UserLoadedState) {
              List<UserModel> userList = state.users;
              return ListView.builder(
                itemCount: userList.length,
                itemBuilder: (_, index) {
                  return Card(
                    child: ListTile(
                      title: Text(userList[index].firstName),
                      subtitle: Text(userList[index].lastName),
                      trailing: CircleAvatar(
                        backgroundImage: NetworkImage(userList[index].avatar),
                      ),
                    ),
                  );
                },
              );
            }
            if (state is UserErrorState) {
              return Center(
                child: Text(state.error),
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
