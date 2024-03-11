import 'package:dotted_border/dotted_border.dart';
import 'package:eschool/data/models/studyMaterial.dart';
import 'package:eschool/ui/widgets/downloadFileButton.dart';
import 'package:eschool/utils/uiUtils.dart';
import 'package:flutter/material.dart';

class StudyMaterialWithDownloadButtonContainer extends StatelessWidget {
  final BoxConstraints boxConstraints;
  final StudyMaterial studyMaterial;
  const StudyMaterialWithDownloadButtonContainer({
    Key? key,
    required this.boxConstraints,
    required this.studyMaterial,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, bottom: 10),
      child: GestureDetector(
        onTap: () {
          UiUtils.viewOrDownloadStudyMaterial(
            context: context,
            storeInExternalStorage: true,
            studyMaterial: studyMaterial,
          );
        },
        child: DottedBorder(
          borderType: BorderType.RRect,
          dashPattern: const [10, 10],
          radius: const Radius.circular(10.0),
          color: Theme.of(context).colorScheme.onBackground.withOpacity(0.25),
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 7.5, vertical: 7.5),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: Row(
              children: [
                SizedBox(
                  width: boxConstraints.maxWidth * (0.7),
                  child: Text(
                    studyMaterial.fileName,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const Spacer(),
                DownloadFileButton(
                  studyMaterial: studyMaterial,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
