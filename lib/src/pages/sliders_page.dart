import 'package:flutter/material.dart';

class SlidersPage extends StatefulWidget {

  @override
  _SlidersPageState createState() => _SlidersPageState();

}

class _SlidersPageState extends State<SlidersPage> {
  double _selectedValue = 100.00;

  bool _disableSlider = false;

  @override
  Widget build( BuildContext context ) {
    return Scaffold(
      appBar: AppBar(
        title: Text( 'Sliders - Checks' ),
      ),
      body: Container(
        padding: EdgeInsets.only( top: 50.0 ),
        child: Column(
          children: <Widget>[
            _createSlider(),
            _createCheckbox(),
            _createSwicth(),
            Divider( height: 30.0, color: Colors.blue ),
            Expanded(
              child: _createImage()
            )
          ]
        )
      ),
    );
  }

  Widget _createSlider() {
    return Slider(
      min: 0.0,
      max: 300.0,
      value: _selectedValue,
      label: 'Tamaño de la imagen',
      onChanged: ( _disableSlider ) ? null : ( double value ) {
        setState(() {
          _selectedValue = value;
        });
      }
    );
  }

  Widget _createCheckbox() {
    /*return Checkbox(
      value: _disableSlider,
      onChanged: ( value ) {
        setState(() {
          _disableSlider = value;
        });
      }
    );*/
    return CheckboxListTile(
      title: Text ( 'Deshabilitar slider' ),
      value: _disableSlider,
      onChanged: ( value ) {
        setState(() {
          _disableSlider = value;
        });
      }
    );
  }

  Widget _createSwicth() {
    /*return Switch(
      value: _disableSlider,
      onChanged: ( value ) {
        setState(() {
          _disableSlider = value;
        });
      }
    );*/
    return SwitchListTile(
      title: Text ( 'Deshabilitar slider' ),
      value: _disableSlider,
      onChanged: ( value ) {
        setState(() {
          _disableSlider = value;
        });
      }
    );
  }

  Widget _createImage() {
    return Image(
      image: AssetImage( 'assets/img/taz.jpg' ),
      width: _selectedValue,
      fit: BoxFit.contain
    );
  }
}