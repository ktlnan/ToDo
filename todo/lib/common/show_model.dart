import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:todo/constants/app_style.dart';
import 'package:todo/provider/date_time_provider.dart';
import 'package:todo/provider/radio_provider.dart';
import 'package:todo/widget/date_time_widget.dart';
import 'package:todo/widget/radio_widget.dart';
import 'package:todo/widget/textfield_widget.dart';

class AddNewTaskModel extends ConsumerWidget {
  const AddNewTaskModel({
    super.key,
  });

  @override
  Widget build(BuildContext context,  WidgetRef ref) {
    final dateProvid = ref.watch(dateProvider);
    return Container(
      padding: const EdgeInsets.all(30),
      height: MediaQuery.of(context).size.height * 0.90,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            width: double.infinity,
            child: Text(
              'New task ToDo',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Divider(
            thickness: 1.2,
            color: Color.fromARGB(255, 206, 198, 198),
          ),
          const Gap(12),
          const Text(
            'Title task',
            style: AppStyle.headingOne,
          ),
          const Gap(6),
          TextFieldWidget(
            maxLine: 1,
            hintText: 'Add task name',
          ),
          Gap(12),
          Text('Description', style: AppStyle.headingOne),
          Gap(6),
          TextFieldWidget(maxLine: 5, hintText: 'Add descriptions'),
          Gap(12),
          Text('Category', style: AppStyle.headingOne),

          Row(
            children: [
              Expanded(
                child: RadioWidget(
                    categColor: Colors.pink.shade200, titleRadio: 'learn', valueInput: 1, onChangedValue: () => ref.read(radioProvider.notifier).update((state) => 1),
                    ),
              ),
              Expanded(
                child: RadioWidget(
                    categColor: Colors.blue.shade200, titleRadio: 'working', valueInput: 2, onChangedValue: () => ref.read(radioProvider.notifier).update((state) => 2),),
              ),
              Expanded(
                child: RadioWidget(
                    categColor: Colors.purple.shade200, titleRadio: 'general', valueInput: 3,onChangedValue: () => ref.read(radioProvider.notifier).update((state) => 3),),
              ),
            ],
          ),

          //date n time
          const Gap(12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DateTimeWidget(
                titleText: 'Date',
                valueText: dateProvid,
                iconSection: CupertinoIcons.calendar,
                onTap: ()  async{
                  final getValue = await showDatePicker(
                    context: context, 
                    initialDate: DateTime.now() , 
                    lastDate: DateTime(2027), 
                    firstDate: DateTime(2024),);

                    if(getValue != null) {
                      final format = DateFormat.yMd();
                      ref.read(dateProvider.notifier).update((state) => format.format(getValue));
                    }
                }
              ),
              const Gap(22),
              DateTimeWidget(
                titleText: 'Time',
                valueText: ref.watch(timeProvider),
                iconSection: CupertinoIcons.clock,
                onTap: () async{ 
                  final getTime = await showTimePicker(
                  context: context, 
                  initialTime: TimeOfDay.now(),);
                  
if(getTime != null) {
  ref.read(timeProvider.notifier).update((state) => getTime.format(context));
}

                  }
              ),
            ],
          ),
          const Gap(12),
// button
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.pink.shade400,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    side: BorderSide(
                      color: Colors.pink.shade400,
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                  onPressed: () => Navigator.pop(context),
                  child: Text('Cancel'),
                ),
              ),
              const Gap(20),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink.shade400,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                  onPressed: () {},
                  child: Text('Create'),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
