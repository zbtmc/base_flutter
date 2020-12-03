
import 'package:flutter/material.dart';

enum ViewState {
  IDLE,
  LOADING,
  ERROR,
  FINISH
}

abstract class BaseViewModel with ChangeNotifier {

  ViewState _viewState = ViewState.IDLE;

  BaseViewModel();


  void setViewState(ViewState viewState) {
    this._viewState = viewState;
    notifyListeners();
  }

  ViewState get viewState => _viewState;
}