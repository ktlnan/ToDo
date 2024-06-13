import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CardToDoListWidget extends StatelessWidget {
  const CardToDoListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 120,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.pink.shade200,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ),
            ),
            width: 15,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text('Learning web вумуд'),
                    subtitle: Text('leraning topical html'),
                    trailing: Transform.scale(
                        scale: 1.5,
                        child: Checkbox(
                          activeColor: Colors.pink,
                          shape: const CircleBorder(),
                          value: true,
                          onChanged: (value) => print(value),
                        )),
                  ),
                  Transform.translate(
                    offset: Offset(0, -12),
                    child: Container(
                      child: Column(
                        children: [
                          const Divider(
                            thickness: 1.5,
                            color: Color.fromARGB(255, 243, 239, 239),
                          ),
                          Row(
                            children: [
                              Text('today'),
                              const Gap(12),
                              Text('09:15am - 11:12am')
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
