import 'package:task_l7/controllers/services/database/database_sqlite.dart';

class Validation {
  String text;

  String fieldName;
  //rules
  bool _length = true;
  bool _unique = true;
  bool _required = true;
  bool _numeric = true;
  bool _email = true;
  
  // validation results :
    // => errors
  List<String> _errors =[];
    //
  bool _isValid = false;

  Validation(this.text, {this.fieldName = ''});

  Validation length({required int minLength, int? maxLength}) {
    if (maxLength != null) {
      _length = text.length >= minLength && text.length <= maxLength;
      _length 
          ? null
          : _errors.add('$fieldName length must be $minLength ~ $maxLength');
    } else {
      _length = text.length >= minLength;
      _length ? null : _errors.add('$fieldName length must be $minLength');
    }
    return this;
  }

  Validation numeric() {
    try {
      int.parse(text);
    } catch (e) {
      _numeric = false;
      _numeric ? null : _errors.add('$fieldName must be numeric only');
    }
    return this;
  }

  Future<Validation> unique(String table, String column) async {

    await DatabaseSqlite.appDatabase
        .table(table)
        .selectWhere('$column  = ?' , [text])
        .then((queryResult) {
      _unique = queryResult.isEmpty;
      _unique ? null : _errors.add('$fieldName already exist');
    });
    return this;
  }

  Validation required() {
    _required = text.isNotEmpty;
    _required ? null : _errors.add('$fieldName is required');
    return this;
  }

  Validation email() {
    _email = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$', caseSensitive: false)
        .hasMatch(text);
    _email ? null : _errors.add('$fieldName is invalid email address');
    return this;
  }

  Validation validate() {
    _isValid  = (_length && _unique && _required && _numeric && _email);
    return this; 
  }

  List<String>  get errors {
    return _errors;     
  }
  bool get isValid {
    return _isValid; 
  }
}
