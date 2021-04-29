import 'package:easy_budget/user.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MovList extends StatefulWidget {
  List userList;
  MovList(List userList) {
    this.userList = userList;
    debugPrint(userList[0][2].toString());
  }
  @override
  State<StatefulWidget> createState() {
    return MovListState(userList);
  }
}

class MovListState extends State<MovList> {
  List userList;
  int totalPnl;
  MovListState(userList) {
    this.userList = userList;
    debugPrint(userList[0][3].toString());
    this.totalPnl = userList[2];
    debugPrint('==> ${totalPnl.toString()}');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              pinned: true,
              delegate: CustomSliverDelegate(
                expandedHeight: 120,
                userList: userList,
                totalPnl: totalPnl,
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  for (var i = 0; i < userList[0].length; i++)
                    latestProcess(
                      userList[0][userList[0].length - i - 1]['type'],
                      userList[0][userList[0].length - i - 1]['money'],
                      userList[0][userList[0].length - i - 1]['time'],
                    ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget latestProcess(movType, movMoney, movTime) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      margin: EdgeInsets.all(9),
      height: 75,
      decoration: BoxDecoration(
        // color: Colors.purple[200],
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300, width: 1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                movType,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              Text(movTime, style: TextStyle(fontWeight: FontWeight.w300))
            ],
          ),
          Text('$movMoney \$'),
        ],
      ),
    );
  }
}

class CustomSliverDelegate extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final bool hideTitleWhenExpanded;
  var userList;
  var totalPnl;

  CustomSliverDelegate({
    @required this.expandedHeight,
    this.hideTitleWhenExpanded = true,
    this.userList,
    this.totalPnl,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final appBarSize = expandedHeight - shrinkOffset;
    final cardTopPosition = expandedHeight / 2 - shrinkOffset;
    final proportion = 2 - (expandedHeight / appBarSize);
    final percent = proportion < 0 || proportion > 1 ? 0.0 : proportion;
    return SizedBox(
      height: expandedHeight + expandedHeight / 2,
      child: Stack(
        children: [
          SizedBox(
            height: appBarSize < kToolbarHeight ? kToolbarHeight : appBarSize,
            child: AppBar(
              backgroundColor: Colors.grey.shade300,
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              elevation: 0.0,
              title: Opacity(
                  opacity: hideTitleWhenExpanded ? 1.0 - percent : 1.0,
                  child: Text("İşlem Özeti")),
            ),
          ),
          Positioned(
            left: 0.0,
            right: 0.0,
            top: cardTopPosition > 0 ? cardTopPosition : 0,
            bottom: 0.0,
            child: Opacity(
              opacity: percent,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30 * percent),
                child: Card(
                  elevation: 20.0,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '30 gunluk PNL',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        Padding(
                          child: showTotalPnl(),
                          padding: EdgeInsets.only(top: 15),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => expandedHeight + expandedHeight / 2;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  Widget showTotalPnl() {
    Color win = Colors.green.shade400;
    Color lose = Colors.red.shade400;
    if (this.totalPnl >= 0) {
      return Text(
        '${totalPnl.toString()} \$',
        style: TextStyle(color: win, fontWeight: FontWeight.bold, fontSize: 45),
      );
    } else {
      return Text(
        '${totalPnl.toString()} \$',
        style:
            TextStyle(color: lose, fontWeight: FontWeight.bold, fontSize: 45),
      );
    }
  }
}
