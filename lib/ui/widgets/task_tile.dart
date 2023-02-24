import 'package:clander_mog/model/task_model.dart';
import 'package:clander_mog/ui/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TaskTile extends StatelessWidget {
  final TaskModel? taskModel;
  const TaskTile(this.taskModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(bottom: 12),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
        color: _getBGclr(taskModel?.color??0),
        ),
        child: Row(
          children: [
            Expanded(child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  taskModel?.title??"",
                  style: GoogleFonts.lato(
                    textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: white
                    )
                  ),
                ),
               const SizedBox(height: 12,),
               Row(
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                   Icon(
                     Icons.access_time_outlined,
                     color: Colors.grey[200],
                     size: 18,
                   ),
                  const SizedBox(width: 4,),
                   Text("${taskModel?.startTime} - ${taskModel?.endTime}",
                   style: GoogleFonts.lato(
                     textStyle: TextStyle(fontSize: 13, color: Colors.grey[100]),
                   ),),

                 ],
               ),
               const SizedBox(height: 12,),
                Text(
                  taskModel?.note??"",
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(
                      fontSize: 12, color: Colors.grey[100]
                    ),
                  ),
                )
              ],
            )),
            Container(
              margin:const EdgeInsets.symmetric(horizontal: 10),
              height: 60,
              width: 0.5,
              color: Colors.grey[200]!.withOpacity(0.7)
            ),
            RotatedBox(
                quarterTurns: 3,
              child: Text(
                taskModel?.isCompleted == 1 ? "COMPLETED" : "TODO",
                style: GoogleFonts.lato(
                  textStyle: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: white
                  )
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _getBGclr(int no){
    switch(no){
      case 0:
        return primaryClr;
      case 1:
        return pinkClr;
      case 2:
        return yellowClr;
      default:
        return primaryClr;
    }
  }
}
