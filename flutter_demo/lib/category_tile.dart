import 'package:flutter/material.dart';
import 'category.dart';
import 'unit_converter.dart';
import 'package:meta/meta.dart';

const _rowHeight = 100.0;
final _borderRadius = BorderRadius.circular(_rowHeight / 2);

class CategoryTile extends StatelessWidget {
  final Category category;
  final ValueChanged<Category> onTap;

  const CategoryTile({
    Key key,
    @required this.category,
    @required this.onTap,
  })  : assert(category != null),
        assert(onTap != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      color: Colors.transparent, //Theme.of(context).scaffoldBackgroundColor,
      child: Container(
        height: _rowHeight,
        child: InkWell(
          borderRadius: _borderRadius,
          highlightColor: category.color['highlight'],
          splashColor: category.color['splash'],
          onTap: () => onTap(category),
//        onTap: () {
//            print('I was Tapped !!');
//            _navigateToConverter(context);
//          },
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: category.iconLocation != null
                      ? Image.asset(
                          category.iconLocation,
                          fit: BoxFit.contain,
                          width: 60.0,
                        )
                      : null,
                ),
                Center(
                    child: Text(
                  category.name,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline,
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _navigateToConverter(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          elevation: 1.0,
          title: Text(
            category.name,
            style: Theme.of(context).textTheme.display1,
          ),
          centerTitle: true,
          backgroundColor: category.color,
        ),
        body: UnitConverter(
          category: category,
        ),
        resizeToAvoidBottomPadding: false,
      );
    }));
  }
}
