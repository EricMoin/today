import 'package:flutter/material.dart';
import 'package:tiny_weather/constant/theme.dart';
import 'package:tiny_weather/local/model/info.dart';

class TodoProgressIndicator extends StatelessWidget {
  late ThemeData theme;
  int startAt;
  int endAt;
  BaseState state;
  TodoProgressIndicator({this.startAt=0,this.endAt=0, required this.state});
  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context);
    var progress = ( DateTime.now().millisecondsSinceEpoch - startAt ) / (endAt - startAt);
    progress = progress < 0 ? 0 : progress;
    progress = progress > 1 ? 1 : progress;
    final width = MediaQuery.sizeOf(context).width;
    var color = theme.colorScheme.primary;
    switch (state.state) {
      case BaseState.fail:
        color = theme.colorScheme.error;
        break;
      case BaseState.finish:
        color = ZExtraTheme.finishedColor;
    }
    return SizedBox(
      height: width * 0.6,
      width: width * 0.6,
      child: TweenAnimationBuilder(
        tween: Tween<double>(begin: 0, end: progress),
        duration: Duration(seconds: 1),
        curve: Curves.easeInOut,
        builder: (context, value, child) {
          return Stack(
            children: [
              Positioned.fill(
                child: CircularProgressIndicator.adaptive(
                  value: value,
                  backgroundColor: theme.colorScheme.surfaceDim,
                  valueColor: AlwaysStoppedAnimation(color),
                ),
              ),
              Center(
                child: Builder(
                  builder: (context) {
                    var value = "";
                    var unit = "";
                    switch(state.state){
                      case BaseState.initial:
                        var day = DateTime.now().difference(DateTime.fromMillisecondsSinceEpoch(startAt)).inDays;
                        value = day.toString();
                        unit = 'Day';
                        break;
                      case BaseState.enable:
                        value = progress.toStringAsFixed(0);
                        unit = '%';
                      case BaseState.finish:
                        return Icon(
                          Icons.check,
                          color: ZExtraTheme.finishedColor,
                          size: theme.textTheme.displayLarge?.fontSize,
                        );
                      case BaseState.fail:
                        return Icon(
                          Icons.cancel_rounded,
                          size: theme.textTheme.displaySmall?.fontSize,
                        );
                    }
                    return Text.rich(
                      TextSpan(
                        text: value,
                        children: [
                          TextSpan(
                            text: unit,
                            style: theme.textTheme.displaySmall?.copyWith(
                              color: color,
                            ),
                          ),
                        ],
                      ),
                      style: theme.textTheme.displayLarge?.copyWith(
                        color: color,
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
