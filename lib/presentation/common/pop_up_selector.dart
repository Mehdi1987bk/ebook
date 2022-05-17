import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import 'package:kango/presentation/common/dropdown.dart' as dropdown;

import '../resourses/app_colors.dart';

class DropDownSelector<T> extends StatefulWidget {
  final T? initialValue;
  final ValueChanged<T> onChanged;
  final String? error;
  final String? hint;
  final List<DropDownItem<T>> items;
  final TextStyle? style;
  final double? iconRightPadding;
  final double height;

  @override
  DropDownSelectorState createState() => DropDownSelectorState<T>();

  DropDownSelector(
      {Key? key,
      required this.items,
      required this.onChanged,
      this.hint,
      this.error,
      this.iconRightPadding,
      this.initialValue,
      this.style,
      this.height = 48})
      : super(key: key);
}

class DropDownSelectorState<T> extends State<DropDownSelector<T>> {
  T? _selectedValue;
  bool showError = false;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[_selector(), showError ? _error() : Container()],
    );
  }

  _onChanged(T newValue) {
    if (widget.onChanged != null) {
      widget.onChanged(newValue);
    }
    setState(() {
      _selectedValue = newValue;
      showError = false;
    });
  }

  bool validate() {
    _forceRebuild();
    return _selectedValue != null;
  }

  void _forceRebuild() {
    setState(() {
      showError = _selectedValue == null;
    });
  }

  Widget _selector() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: AppColors.appColor,
              blurRadius: 4.0,
              spreadRadius: 0.0,
              offset: Offset(
                0.0,
                2.0,
              ),
            )
          ],
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          border: Border.all(color: AppColors.traficButtonBorder)),
      height: widget.height,
      child: Padding(
        padding: const EdgeInsetsDirectional.only(start: 8.0),
        child: Listener(
          onPointerDown: (_) => FocusScope.of(context).unfocus(),
          child: dropdown.DropdownButton<T>(
              showUnderline: false,
              isExpanded: true,
              iconRightPadding: widget.iconRightPadding,
              icon: const Icon(
                Icons.keyboard_arrow_down,
                color: AppColors.appColor,
              ),
              style: widget.style ?? Theme.of(context).textTheme.bodyText2,
              onChanged: _onChanged,
              value: _selectedValue,
              hint: widget.hint != null
                  ? Text(
                      widget.hint!,
                      style: Theme.of(context).textTheme.bodyText2?.copyWith(
                          color: AppColors.traficButtonBorder.withOpacity(0.6)),
                    )
                  : null,
              items: _generateItems()),
        ),
      ),
    );
  }

  Widget _error() {
    return widget.error != null
        ? Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.error!,
              style: TextStyle(color: AppColors.appColor, fontSize: 13.0),
            ),
          )
        : Container();
  }

  List<dropdown.DropdownMenuItem<T>> _generateItems() {
    return widget.items
        .map((item) => dropdown.DropdownMenuItem<T>(
              value: item.value,
              child: Text(
                item.text,
              ),
            ))
        .toList();
  }
}

class DropDownItem<T> {
  T value;
  String text;

  DropDownItem({required this.value, required this.text});
}
