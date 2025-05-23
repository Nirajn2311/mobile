import 'package:flutter/material.dart';
import 'package:freecodecamp/enums/panel_type.dart';
import 'package:freecodecamp/models/learn/challenge_model.dart';
import 'package:freecodecamp/ui/views/learn/challenge/challenge_viewmodel.dart';
import 'package:freecodecamp/ui/views/learn/widgets/dynamic_panel/panels/description/description_widget_view.dart';
import 'package:freecodecamp/ui/views/learn/widgets/dynamic_panel/panels/hint/hint_widget_view.dart';
import 'package:freecodecamp/ui/views/learn/widgets/dynamic_panel/panels/pass/pass_widget_view.dart';
import 'package:phone_ide/phone_ide.dart';

class DynamicPanel extends StatelessWidget {
  const DynamicPanel({
    super.key,
    required this.challenge,
    required this.model,
    required this.panel,
    required this.maxChallenges,
    required this.challengesCompleted,
    required this.editor,
  });

  final Challenge challenge;
  final ChallengeViewModel model;
  final PanelType panel;
  final int maxChallenges;
  final int challengesCompleted;

  final Editor editor;

  Widget panelHandler(PanelType panel) {
    switch (panel) {
      case PanelType.instruction:
        return DescriptionView(
          description: challenge.description,
          instructions: challenge.instructions,
          challengeModel: model,
          maxChallenges: maxChallenges,
          title: challenge.title,
        );
      case PanelType.pass:
        return PassWidgetView(
          challengeModel: model,
          challengesCompleted: challengesCompleted,
          maxChallenges: maxChallenges,
        );
      case PanelType.hint:
        return HintWidgetView(
          hint: model.hint,
          challengeModel: model,
          editor: editor,
        );
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.45,
      color: const Color(0xFF0a0a23),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 5, 0, 16),
        child: panelHandler(panel),
      ),
    );
  }
}
