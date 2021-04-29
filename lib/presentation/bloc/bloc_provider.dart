import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'base_bloc.dart';

class BlocProvider<T extends BaseBloc> extends InheritedWidget {
  final T bloc;

  const BlocProvider({Key key, @required this.bloc, @required Widget child})
      : assert(bloc != null),
        assert(child != null),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(BlocProvider oldWidget) => bloc != oldWidget.bloc;

  static Type _typeOf<T>() => T;

  static T of<T extends BaseBloc>(BuildContext context) {
    final Type type = _typeOf<BlocProvider<T>>();
    final viewModel = (context.dependOnInheritedWidgetOfExactType(aspect: type)
    as BlocProvider<T>) ??
        context
            .getElementForInheritedWidgetOfExactType<BlocProvider<T>>()
            ?.widget as BlocProvider<T>;
    if (viewModel == null) throw('Context does not containe bloc $T');
    return viewModel?.bloc;
  }
}
