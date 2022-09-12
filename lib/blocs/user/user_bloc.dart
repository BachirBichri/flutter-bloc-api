import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/models/user_list.dart';
import 'package:flutter_application_1/riposirory/user_repository.dart';
import 'package:meta/meta.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(SearchUserInitialState()) {
    on<SearchUserEvent>((event, emit) async {
      try {
        emit(SearchUserLoadingState());
        ListUsers listUsers = await UserRepository.searchUsers(
            event.keyword, event.currentPage, event.pageSize);

        int totalPage = listUsers.totalCount ~/ event.pageSize;
        if (listUsers.totalCount % event.pageSize == 0) totalPage++;

        emit(SearchUserSuccesState(listUsers, event.currentPage, event.pageSize,
            totalPage, event.keyword));
      } catch (e) {
        print('*******Error Message *******');
        print(e);
        emit(SearchUserErrorState(e.toString()));
      }
    });
    // on<NextPageEvent>((event, emit) async {
    //   try {
    //     emit(SearchUserLoadingState());
    //     ListUsers listUsers = await UserRepository.searchUsers(
    //         event.keyword, event.currentPage, event.pageSize);

    //     int totalPage = listUsers.totalCount ~/ event.pageSize;
    //     if (listUsers.totalCount % event.pageSize == 0) totalPage++;

    //     event.listUsers.users.addAll(listUsers.users);
    //     print(event.listUsers.users.length);
    //     emit(SearchUserSuccesState(listUsers, event.currentPage, event.pageSize,
    //         totalPage, event.keyword));
    //   } catch (e) {
    //     print('*******Error Message*******');
    //     print(e);
    //     emit(SearchUserErrorState(e.toString()));
    //   }
    // });
  }
}
