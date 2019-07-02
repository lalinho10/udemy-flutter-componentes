import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {

  @override
  _ListPageState createState() => _ListPageState();

}

class _ListPageState extends State<ListPage> {

  int _lastItem = 300;
  bool _isLoading = false;
  List<int> _listIDS = new List();
  ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    super.initState();
    _add10ItemsToList();
    _scrollController.addListener(() {
      if( _scrollController.position.pixels == _scrollController.position.maxScrollExtent ) {
        //_add10ItemsToList();
        _fetchDelayedData();
      }
    });
  }

  @override
  Widget build( BuildContext context ) {
    return Scaffold(
      appBar: AppBar(
        title: Text( 'Listas - Scroll' ),
      ),
      body: Stack(
        children: <Widget>[
          _createList(),
          _createLoading()
        ],
      )
    );
  }

  @override
  void dispose() { 
    super.dispose();
    _scrollController.dispose();
  }

  Widget _createList() {
    return RefreshIndicator(
      onRefresh: _reloadListData,
      child: ListView.builder(
        controller: _scrollController,
        padding: EdgeInsets.all( 15.0 ),
        itemCount: _listIDS.length,
        itemBuilder: ( BuildContext context, int index ) {
          final imageID = _listIDS[ index ];

          return Column(
              children:<Widget>[
                FadeInImage(
                  placeholder: AssetImage( 'assets/img/jar-loading.gif' ),
                  image: NetworkImage( 'https://picsum.photos/id/$imageID/500/300' )
                ),
                SizedBox( height: 15.0 )
              ]
          );
        }
      )
    );
  }

  Widget _createLoading() {
    if( _isLoading ) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator()
            ],
          )
        ],
      );
    } else {
      return Container();
    }
  }

  Future _reloadListData() async {
    final random = Random();
    Duration delay = new Duration( seconds: 3 );

    Timer( delay, () {
      _lastItem = random.nextInt( 800 );
      _listIDS.clear();
      _add10ItemsToList();
    });

    return Future.delayed( delay );
  }

  Future<Null> _fetchDelayedData() async {
    _isLoading = true;
    setState( () {} );
    Duration delay = new Duration( seconds: 3 );
    return new Timer( delay, _getSimulatedHTTPResponse );
  }

  void _getSimulatedHTTPResponse() {
    _isLoading = false;

    _scrollController.animateTo(
      _scrollController.position.pixels + 150.0,
      curve: Curves.fastOutSlowIn,
      duration: Duration( milliseconds: 250 )
    );

    _add10ItemsToList();
  }

  void _add10ItemsToList() {
    for ( var i = 0; i < 10; i++ ) {
      _lastItem++;
      _listIDS.add( _lastItem );
    }

    setState( () {} );
  }
}