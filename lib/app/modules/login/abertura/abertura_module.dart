import 'package:tap_visual_app/app/modules/login/abertura/abertura_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:tap_visual_app/app/modules/login/abertura/abertura_page.dart';

class AberturaModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => AberturaBloc()),
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => AberturaPage();

  static Inject get to => Inject<AberturaModule>.of();
}
