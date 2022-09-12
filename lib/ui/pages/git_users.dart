import 'package:flutter/material.dart';
import 'package:flutter_application_1/blocs/user/user_bloc.dart';
import 'package:flutter_application_1/ui/themes/custom_theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

class GitUsersPage extends StatelessWidget {
  const GitUsersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();

    return Scaffold(
        appBar: AppBar(
            title: ListTile(
          title: const Text('Git Users'),
          trailing:
              BlocBuilder<UserBloc, UserState>(builder: ((context, state) {
            if (state is SearchUserSuccesState) {
              return Text("${state.currentPage}/${state.totalPage}");
            }
            return const Text('');
          })),
        )),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Expanded(
                      child: TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide(width: 2))),
                  )),
                  IconButton(
                      onPressed: () {
                        context
                            .read<UserBloc>()
                            .add(SearchUserEvent(searchController.text, 1, 20));
                      },
                      icon: const Icon(Icons.search))
                ],
              ),
            ),
            BlocBuilder<UserBloc, UserState>(
              builder: (context, state) {
                if (state is SearchUserLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is SearchUserErrorState) {
                  return Column(
                    children: [
                      Text(
                        state.errorMessage,
                        style: CustomTheme.errorMsgStyle,
                      )
                    ],
                  );
                } else if (state is SearchUserSuccesState) {
                  return Expanded(
                    child: LazyLoadScrollView(
                      onEndOfPage: () {
                        context.read<UserBloc>().add(NextPageEvent(
                            state.currentKeyword,
                            state.currentPage + 1,
                            state.pageSize,
                            state.listUsers));
                      },
                      child: ListView.separated(
                        itemBuilder: ((context, index) => ListTile(
                              title: Text(
                                state.listUsers.users[index].login,
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              ),
                              subtitle:
                                  Text(state.listUsers.users[index].htmlUrl),
                              leading: CircleAvatar(
                                backgroundImage: NetworkImage(
                                    state.listUsers.users[index].avatarUrl),
                                radius: 40,
                              ),
                              trailing: CircleAvatar(
                                child: Text(state.listUsers.users[index].score
                                    .toString()),
                              ),
                            )),
                        separatorBuilder: ((context, index) => const Divider(
                              height: 4,
                            )),
                        itemCount: state.listUsers.users.length,
                      ),
                    ),
                  );
                } else {
                  return Container();
                }
              },
            )
          ],
        ));
  }
}
