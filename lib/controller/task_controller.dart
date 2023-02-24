import 'package:clander_mog/db/db_helper.dart';
import 'package:clander_mog/model/task_model.dart';
import 'package:get/get.dart';

class TaskController extends GetxController {
  @override
  void onReady() {
    super.onReady();
  }

  var taskList = <TaskModel>[].obs;

  Future<int> addTask({TaskModel? taskModel}) async {
    return await DBHelper.insert(taskModel);
  }

  Future<int> updateTask({TaskModel? taskModel}) async {
    return await DBHelper.updateData(taskModel);
  }

  void getTasks() async {
    List<Map<String, dynamic>> tasks = await DBHelper.query();
    taskList.assignAll(tasks.map((data) => TaskModel.fromJson(data)).toList());
  }

  void delete(TaskModel taskModel) async {
    await DBHelper.delete(taskModel);

    // refresh ဖြစ်အောငိလုပ်စော် getTasks class ကိုပြန်ခေါ်စော်
    getTasks();
  }

  void completedUpdate(int id) async {
    await DBHelper.completedUpdate(id);
    getTasks();
  }
}
