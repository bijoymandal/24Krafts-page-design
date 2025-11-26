// lib/bloc/nav_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';

enum NavItem { home, members, schedule, jobs }

class NavBloc extends Cubit<NavItem> {
  NavBloc() : super(NavItem.home);

  void setTab(NavItem item) => emit(item);
}
