import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/language.dart';

part 'global_event.dart';
part 'global_state.dart';

class GlobalBloc extends Bloc<GlobalEvent, GlobalState> {
  GlobalBloc() : super(GlobalState.idle()) {
    on<SetNavigationBarIndexEvent>((event, emit) {
      emit(state.copyWith(navigationBarIndex: event.index));
    });

    on<SetLanguageEvent>((event, emit) {
      emit(state.copyWith(language: event.language));
    });

    on<SetThemeEvent>((event, emit) {
      emit(state.copyWith(theme: event.theme));
    });
  }
}
