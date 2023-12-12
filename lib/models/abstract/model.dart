
import 'package:task_l7/controllers/services/database/database_json.dart';

abstract class Model<T>  {
  Map<String,String>? currentRow; 
  Model({this.currentRow}); 

  List<T> createQueryModelList(List<Map<String,dynamic>> query); 

  //CRUD 
  // Future<bool> create ( Map<String ,String> row)async{
  Future<bool> create ()async{
    return await DatabaseJson.create(currentRow!); 
  }

  List<T> read ({int? id}) {
      List<Map<String , dynamic>> query =  DatabaseJson.read(id:id);
      return createQueryModelList(query); 
  }

  Future<bool> update ( int id)async{
    return await DatabaseJson.update(currentRow!, id); 
  }

  Future<bool> delete ({int? id})async{
    return await DatabaseJson.delete(id: id); 
  }
}