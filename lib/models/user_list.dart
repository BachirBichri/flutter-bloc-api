class ListUsers {
  ListUsers({
    required this.totalCount,
    required this.incompleteResults,
    required this.users,
  });
  late final int totalCount;
  late final bool incompleteResults;
  late final List<User> users;

  ListUsers.fromJson(Map<String, dynamic> json) {
    totalCount = json['total_count'];
    incompleteResults = json['incomplete_results'];
    users = List.from(json['items']).map((e) => User.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['total_count'] = totalCount;
    _data['incomplete_results'] = incompleteResults;
    _data['items'] = users.map((e) => e.toJson()).toList();
    return _data;
  }
}

class User {
  User(
      {required this.login,
      required this.id,
      required this.avatarUrl,
      required this.url,
      required this.htmlUrl,
      required this.score});
  late final String login;
  late final int id;
  late final String avatarUrl;
  late final String url;
  late final String htmlUrl;

  late final double score;

  User.fromJson(Map<String, dynamic> json) {
    login = json['login'];
    id = json['id'];
    avatarUrl = json['avatar_url'];
    url = json['url'];
    htmlUrl = json['html_url'];

    score = json['score'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['login'] = login;
    _data['id'] = id;
    _data['avatar_url'] = avatarUrl;
    _data['url'] = url;
    _data['html_url'] = htmlUrl;
    _data['score'] = score;
    return _data;
  }
}
