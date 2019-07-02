import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class InputFieldsPage extends StatefulWidget {

  @override
  _InputFieldsPageSate createState() => _InputFieldsPageSate();

}

class _InputFieldsPageSate extends State<InputFieldsPage> {

  String _nombre = '';
  String _email = '';
  String _password = '';
  String _fecha = '';
  String _libro = 'Frankenstein';

  List<String> _libros = [
    'El futbol a sol y sombra',
    'El fantasma de la ópera',
    'Frankenstein',
    'Nacidos para correr',
    'Cien años de soledad'
  ];

  TextEditingController _fechaController = new TextEditingController();

  @override
  Widget build( BuildContext context ) {
    return Scaffold(
      appBar: AppBar(
        title: Text( 'Input fields' ),
      ),
      body: ListView(
        padding: EdgeInsets.all( 15.0 ),
        children: <Widget> [
          _createInput(),
          Divider( height: 30.0, color: Colors.blue ),
          _createEmail(),
          Divider( height: 30.0, color: Colors.blue ),
          _createPassword(),
          Divider( height: 30.0, color: Colors.blue ),
          _createDatePicker( context ),
          Divider( height: 40.0, color: Colors.blue ),
          _createDropDown(),
          Divider( height: 40.0, color: Colors.blue ),
          _createLabel()
        ]
      )
    );
  }

  Widget _createInput() {
    return TextField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular( 20.0 )
        ),
        counter: Text( 'Letras: ${_nombre.length}' ),
        labelText: 'Nombre',
        hintText: 'Nombre',
        helperText: 'Sólo se permiten letras',
        icon: Icon( Icons.account_circle ),
        suffixIcon: Icon( Icons.accessibility_new )
      ),
      onChanged: ( value ) {
        setState(() {
          _nombre = value;
        });
      },
    );
  }

  Widget _createEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular( 20.0 )
        ),
        labelText: 'Email',
        hintText: 'Email',
        icon: Icon( Icons.mail ),
        suffixIcon: Icon( Icons.alternate_email )
      ),
      onChanged: ( value ) {
        setState(() {
          _email = value;
        });
      },
    );
  }

  Widget _createPassword() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular( 20.0 )
        ),
        labelText: 'Password',
        hintText: 'Password',
        icon: Icon( Icons.lock ),
        suffixIcon: Icon( Icons.accessibility_new )
      ),
      onChanged: ( value ) {
        setState(() {
          _password = value;
        });
      },
    );
  }

  Widget _createDatePicker( BuildContext context ) {
    return TextField(
      controller: _fechaController,
      enableInteractiveSelection: false,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular( 20.0 )
        ),
        labelText: 'Fecha de nacimiento',
        hintText: 'Fecha de nacimiento',
        icon: Icon( Icons.calendar_today ),
        suffixIcon: Icon( Icons.perm_contact_calendar )
      ),
      onTap: () {
        FocusScope.of( context ).requestFocus( new FocusNode() );
        _showDatePickerWidget( context );
      },
    );
  }

  void _showDatePickerWidget( BuildContext context ) async {
    Duration threeMonths = new Duration( days: 90 );

    DateTime iniDate = new DateTime.now();
    DateTime endDate = iniDate.add( threeMonths );

    DateTime selectedDate = await showDatePicker(
      context: context,
      initialDate: iniDate,
      firstDate: iniDate,
      lastDate: endDate,
      locale: Locale( 'es' )
    );

    if( selectedDate != null ) {
      setState(() {
        _fecha = selectedDate.toString();
        _fechaController.text = _fecha;
      });
    }
  }

  Widget _createDropDown() {
    return DropdownButton(
      value: _libro,
      items: _getDropdownItems(),
      onChanged: ( value ) {
        setState(() {
          _libro = value;
        });
      },
    );
  }

  List<DropdownMenuItem<String>> _getDropdownItems() {
    List<DropdownMenuItem<String>> lista = new List();

    _libros.forEach(( libro ) {
      lista.add( new DropdownMenuItem(
        value: libro,
        child: Text( libro )
      ));
    });

    return lista;
  }

  Widget _createLabel() {
    String maskPassord = '*' * _password.length;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text( 'El nombre es: $_nombre' ),
        Text( 'El email es: $_email' ),
        Text( 'El password es: $maskPassord' ),
        Text( 'La fecha es: $_fecha' ),
        Text( 'El libro seleccionado es: $_libro' )
      ]
    );
  }
}