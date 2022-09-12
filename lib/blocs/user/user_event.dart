part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class SearchUserEvent extends UserEvent {
  final String keyword;
  final int currentPage;
  final int pageSize;

  SearchUserEvent(this.keyword, this.currentPage, this.pageSize);
}

class NextPageEvent extends SearchUserEvent {
  final ListUsers listUsers;

  NextPageEvent(
      super.keyword, super.currentPage, super.pageSize, this.listUsers);
}
