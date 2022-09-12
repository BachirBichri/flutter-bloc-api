part of 'user_bloc.dart';

@immutable
abstract class UserState {}

class SearchUserInitialState extends UserState {}

class SearchUserLoadingState extends UserState {}

class SearchUserSuccesState extends UserState {
  final ListUsers listUsers;
  final int currentPage;
  final int pageSize;
  final int totalPage;
  final String currentKeyword;

  SearchUserSuccesState(this.listUsers, this.currentPage, this.pageSize,
      this.totalPage, this.currentKeyword);
}

class SearchUserErrorState extends UserState {
  final String errorMessage;

  SearchUserErrorState(this.errorMessage);
}
