import 'package:eschool/data/models/announcement.dart';
import 'package:eschool/ui/widgets/studyMaterialWithDownloadButtonContainer.dart';
import 'package:flutter/material.dart';

import 'package:timeago/timeago.dart' as timeago;

class AnnouncementDetailsContainer extends StatelessWidget {
  final Announcement announcement;
  const AnnouncementDetailsContainer({Key? key, required this.announcement})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.circular(10.0),
      ),
      width: MediaQuery.of(context).size.width * (0.85),
      child: LayoutBuilder(
        builder: (context, boxConstraints) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                announcement.title,
                style: TextStyle(
                  height: 1.2,
                  color: Theme.of(context).colorScheme.secondary,
                  fontSize: 15.0,
                ),
              ),
              SizedBox(
                height: announcement.description.isEmpty ? 0 : 5,
              ),
              announcement.description.isEmpty
                  ? const SizedBox()
                  : Text(
                      announcement.description,
                      style: TextStyle(
                        height: 1.2,
                        color: Theme.of(context).colorScheme.secondary,
                        fontWeight: FontWeight.w400,
                        fontSize: 11.5,
                      ),
                    ),
              ...announcement.files
                  .map(
                    (studyMaterial) => StudyMaterialWithDownloadButtonContainer(
                      boxConstraints: boxConstraints,
                      studyMaterial: studyMaterial,
                    ),
                  )
                  .toList(),
              SizedBox(
                height: announcement.files.isNotEmpty ? 0 : 5,
              ),
              Text(
                timeago.format(announcement.createdAt),
                style: TextStyle(
                  color: Theme.of(context)
                      .colorScheme
                      .onBackground
                      .withOpacity(0.75),
                  fontWeight: FontWeight.w400,
                  fontSize: 10,
                ),
                textAlign: TextAlign.start,
              )
            ],
          );
        },
      ),
    );
  }
}
