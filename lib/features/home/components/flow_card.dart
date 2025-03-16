import 'package:flutter/material.dart' hide Flow;
import 'package:today/constant/theme.dart';
import 'package:today/features/components/ink_container.dart';
import 'package:today/local/model/flow.dart';
import 'package:today/local/model/info.dart';

class FlowCard extends StatefulWidget {
  final Flow flow;
  bool isSelected;
  bool isFinished;
  ValueChanged? onChanged;
  void Function()? onTap;
  void Function()? onLongPress;
  bool isExpanded = false;
  FlowCard({
    required this.flow,
    required this.isSelected,
    required this.isFinished,
    this.onChanged,
    this.onTap,
    this.onLongPress,
  });

  @override
  State<StatefulWidget> createState() => _FlowCardState();
}

class _FlowCardState extends State<FlowCard> {
  late ThemeData theme;
  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context);
    var containerColor = theme.colorScheme.outline;
    switch (widget.flow.state.state) {
      case BaseState.finish:
        containerColor = ZExtraTheme.finishedColor;
        break;
      case BaseState.fail:
        containerColor = theme.colorScheme.errorContainer;
      case BaseState.enable:
        containerColor = theme.colorScheme.primaryContainer;
      default:
        containerColor = theme.colorScheme.surfaceContainerHigh;
    }
    if (widget.isSelected) {
      containerColor = theme.colorScheme.tertiaryContainer;
    }
    return InkContainer(
      onTap: widget.onTap,
      onLongPress: widget.onLongPress,
      padding: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              widget.flow.state.isFailed
                  ? IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.cancel_outlined,
                      color: theme.colorScheme.error,
                    ),
                  )
                  : Checkbox.adaptive(
                    value: widget.isFinished,
                    activeColor: containerColor,
                    checkColor: widget.flow.state.isFinished ? Colors.white : null,
                    onChanged: (value) {
                      widget.onChanged?.call(value);
                    },
                  ),
              Expanded(
                child: Text(
                  widget.flow.title,
                  style: theme.textTheme.titleMedium?.copyWith(
                    color:
                        widget.flow.state.isFinished
                            ? Colors.white
                            : theme.textTheme.titleMedium?.color,
                  ),
                ),
              ),
              ExpandIcon(
                isExpanded: widget.isExpanded,
                color:
                    widget.flow.state.isFinished
                        ? Colors.white
                        : theme.textTheme.titleMedium?.color,
                onPressed: (value) {
                  setState(() {
                    widget.isExpanded = !widget.isExpanded;
                  });
                },
              ),
            ],
          ),
          AnimatedSize(
            duration: Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            child:AnimatedOpacity(
                      opacity: widget.isExpanded ? 1 : 0,
                      duration: Duration(milliseconds: 400),
                      curve: Curves.easeInOut,
                      child: widget.isExpanded ? Column(
                        children:
                            widget.flow.todos.map((e) {
                              return ListTile(
                                // contentPadding: EdgeInsets.all(0),
                                leading: Icon(Icons.adjust_rounded,color: widget.flow.state.isFinished ? Colors.white : null,),
                                title: Text(
                                  e.title,
                                  style: theme.textTheme.titleMedium?.copyWith(
                                    color: widget.flow.state.isFinished ? Colors.white : null,
                                  ),
                                ),
                              );
                            }).toList(),
                      ) : SizedBox.shrink(),
                    ),
          ),
        ],
      ),
    );
  }
}
