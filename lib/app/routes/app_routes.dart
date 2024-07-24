part of 'app_pages.dart';

abstract class Routes {
  Routes_();

  static const HOME = _Paths.HOME;
  static const USERS = _Paths.USERS;
  static const INDIVIDUAL_USER = _Paths.INDIVIDUAL_USER;
}

abstract class _Paths {
  static const HOME = '/home';
  static const USERS = '/users';
  static const INDIVIDUAL_USER = '/individual-user';
}