import 'package:UNNKONET/screen/test.dart';
import 'package:flutter/material.dart';
import '../style.dart';

class TextSection extends StatelessWidget {
  final Color _color;
  final String _body;

  final String _title;
  static const double _hpad = 16.0;
  TextSection(this._color, this._title, this._body);
  // TextSection(Color color){
  //   this._color = color;
  // }

  @override
  Widget build(BuildContext context) {
    String escapebody = _body.replaceAll('<br>', '');
    //escapebody = TestString.validate(escapebody);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.fromLTRB(_hpad, 32.0, _hpad, 4.0),
          child: Center(
            child: Text(_title, style: TitleTextStyle),
          ),
          color: _color,
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(_hpad, 10.0, _hpad, _hpad),
          child: TestString(escapebody),
        ),
      ],
    );
  }
}
