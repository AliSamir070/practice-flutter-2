
import 'package:flutter/material.dart';

class HomeFlowDelegate extends FlowDelegate{
  final Animation<double> animation;
  HomeFlowDelegate(this.animation):super(repaint: animation);
  @override
  void paintChildren(FlowPaintingContext context) {
    for(int i=0;i<context.childCount;i++){
      final offset = i * animation.value*50;
      context.paintChild(i,transform: Matrix4.translationValues(-offset, -offset, 0));
      
    }
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    return false ;
  }

}