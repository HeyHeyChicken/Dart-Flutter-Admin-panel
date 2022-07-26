import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:responsive_grid/responsive_grid.dart';
import '../Helpers/MyWidget.dart';
import '../Model/Index/Report.dart';
import '../Model/Index/Transaction.dart';
import 'package:fl_chart/fl_chart.dart';

class RecapBox{
  double number;
  IconData icon;
  String text;

  RecapBox(this.number, this.icon, this.text);
}

class Index extends StatefulWidget {
  List<Transaction> historiqueTransaction = [];
  List<Report> monthlyReports = [];
  List<PlutoColumnGroup> columnGroups = [];
  List<PlutoRow> rows = [];
  List<PlutoColumn> columns = [];
  List<RecapBox> boxes = [];

  Index({Key? key}) : super(key: key){
    historiqueTransaction = [
      Transaction("images/user.jpeg", "Loyers", "Fonchia", 69.99),
      Transaction("images/user.jpeg", "Salaires", "Safran", -550),
      Transaction("images/user.jpeg", "Référencement", "Google", -138.25),
      Transaction("images/user.jpeg", "Sécurité", "SécuPlus", -22.47),
      Transaction("images/user.jpeg", "Cantine", "GoodFood", -85.29)
    ];

    boxes = [
      RecapBox(1499934.62, Icons.account_balance_wallet, "Votre compte en banque"),
      RecapBox(1234, Icons.pie_chart, "Un chiffre au pif"),
      RecapBox(1475, Icons.work, "Salariés présent sur site"),
      RecapBox(3287.49, Icons.credit_card, "Dépensés cette semaine"),
    ];

    historiqueTransaction = [
      Transaction("images/user.jpeg", "Loyers", "Fonchia", 69.99),
      Transaction("images/user.jpeg", "Salaires", "Safran", -550),
      Transaction("images/user.jpeg", "Référencement", "Google", -138.25),
      Transaction("images/user.jpeg", "Sécurité", "SécuPlus", -22.47),
      Transaction("images/user.jpeg", "Cantine", "GoodFood", -85.29)
    ];

    monthlyReports = [
      Report(1, 590, 390),
      Report(2, 850, 600),
      Report(3, 500, 450),
      Report(4, 750, 380)
    ];

    columnGroups = [
      PlutoColumnGroup(title: 'Id', fields: ['id'], expandedColumn: true),
      PlutoColumnGroup(title: 'User information', fields: ['name', 'age']),
      PlutoColumnGroup(title: 'Status', children: [
        PlutoColumnGroup(title: 'A', fields: ['role'], expandedColumn: true),
        PlutoColumnGroup(title: 'Etc.', fields: ['joined', 'working_time']),
      ]),
    ];

    rows = [];

    for(int x = 0; x < 10000; x++){
      rows.add(
          PlutoRow(
            cells: {
              'id': PlutoCell(value: "User $x"),
              'name': PlutoCell(value: 'Mike'),
              'age': PlutoCell(value: 20 + x),
              'role': PlutoCell(value: 'Programmer'),
              'joined': PlutoCell(value: '2021-01-01'),
              'working_time': PlutoCell(value: '09:00'),
            }
          )
      );
    }

    columns = [
      PlutoColumn(
        title: 'Id',
        field: 'id',
        type: PlutoColumnType.text(),
      ),
      PlutoColumn(
        title: 'Nom',
        field: 'name',
        type: PlutoColumnType.text(),
      ),
      PlutoColumn(
        title: 'Age',
        field: 'age',
        type: PlutoColumnType.number(),
      ),
      PlutoColumn(
        title: 'Rôle',
        field: 'role',
        type: PlutoColumnType.select(<String>[
          'Programmer',
          'Designer',
          'Owner',
        ]),
      ),
      PlutoColumn(
        title: 'Date',
        field: 'joined',
        type: PlutoColumnType.date(),
      ),
      PlutoColumn(
        title: 'Working time',
        field: 'working_time',
        type: PlutoColumnType.time(),
      ),
    ];
  }

  @override
  State<Index> createState() => _IndexState();
}

class _IndexState extends State<Index> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1f1f1f),
      body: Container(
        color: const Color(0xFF1f1f1f),
        child: SingleChildScrollView(
          child: ResponsiveGridRow(
            children: [
              ResponsiveGridCol(
                xl: 5,
                lg: 6,
                md: 8,
                sm: 12,
                xs: 12,
                child: Column(
                  children: [
                    MyWidget(
                      title:"Rapports mensuels",
                      height: 350,
                      child: BarChart(
                        BarChartData(
                          barGroups: _getGraphData(),
                          titlesData: FlTitlesData(
                            rightTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: false
                              )
                            ),
                            topTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: false
                              )
                            ),
                            leftTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                getTitlesWidget: (double value, TitleMeta meta) {
                                  return Text(
                                    meta.formattedValue,
                                    style: const TextStyle(
                                      color: Colors.white
                                    )
                                  );
                                }
                              )
                            ),
                            bottomTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                getTitlesWidget: (double value, TitleMeta meta) {
                                  return Text(
                                    "Semaine ${widget.monthlyReports[value.toInt()].week}",
                                    style: const TextStyle(
                                      color: Colors.white
                                    )
                                  );
                                }
                              )
                            )
                          )
                        ),
                        swapAnimationDuration: Duration(milliseconds: 150), // Optional
                        swapAnimationCurve: Curves.linear, // Optional
                      )
                    ),
                    MyWidget(
                      title:"Historique de transaction",
                      height: 400,
                      disableBodyTopPadding: true,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            for(int x = 0; x < widget.historiqueTransaction.length; x++)
                              MouseRegion(
                                  onExit:(isHover){
                                    if(widget.historiqueTransaction[x].isHover){
                                      setState(() {
                                        widget.historiqueTransaction[x].isHover = false;
                                      });
                                    }
                                  },
                                  onEnter:(isHover){
                                    if(!widget.historiqueTransaction[x].isHover){
                                      setState(() {
                                        widget.historiqueTransaction[x].isHover = true;
                                      });
                                    }
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Container(
                                      color: widget.historiqueTransaction[x].isHover ? const Color(0x0DFFFFFF) : Colors.transparent,
                                      padding: const EdgeInsets.all(15),
                                      child: Row(
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(8),
                                            child: Image(
                                              height: 48,
                                              image: AssetImage(widget.historiqueTransaction[x].image)
                                            )
                                          ),
                                          Container(
                                            padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  widget.historiqueTransaction[x].title,
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 24
                                                  )
                                                ),
                                                Text(
                                                  widget.historiqueTransaction[x].subTitle,
                                                  style: const TextStyle(
                                                    color: Color(0x80FFFFFF),
                                                    fontSize: 18
                                                  )
                                                )
                                              ]
                                            )
                                          ),
                                          Expanded(child: Container()),
                                          Text(
                                            "${widget.historiqueTransaction[x].amount.abs()} €",
                                            style: TextStyle(
                                              color: widget.historiqueTransaction[x].amount < 0 ? Colors.red :Colors.green,
                                              fontSize: 18
                                            )
                                          )
                                        ]
                                      )
                                    )
                                  )
                              ),
                            Container(
                              padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                              child: TextButton(
                                onPressed: (){},
                                style: TextButton.styleFrom(
                                  backgroundColor: Theme.of(context).primaryColor
                                ),
                                child: Container(
                                  height: 48,
                                  alignment: Alignment.center,
                                  child: const Text(
                                    "En voir plus",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18
                                    )
                                  )
                                )
                              )
                            )
                          ]
                        )
                      )
                    )
                  ],
                )
              ),
              ResponsiveGridCol(
                xl: 7,
                lg: 6,
                md: 4,
                sm: 12,
                xs: 12,
                child: MyWidget(
                  title: "Un tableau de ${widget.rows.length} lignes",
                  height: 750,
                  child: PlutoGrid(
                    columns: widget.columns,
                    rows: widget.rows,
                    columnGroups: widget.columnGroups,
                    /*
                    onLoaded: (PlutoGridOnLoadedEvent event) {
                      stateManager = event.stateManager;
                    },
                     */
                    onChanged: (PlutoGridOnChangedEvent event) {
                      print(event);
                    },
                    configuration: const PlutoGridConfiguration(
                      enableColumnBorder: true,
                      gridBorderRadius: BorderRadius.all(Radius.circular(8))
                    ),
                  )
                )
              ),
              for(int x = 0; x < widget.boxes.length; x++)
                ResponsiveGridCol(
                    xl: 2,
                    lg: 3,
                    md: 6,
                    sm: 6,
                    xs: 12,
                    child: MyWidget(
                      height: 170,
                      child: Column(
                        children: [
                          Icon(
                            widget.boxes[x].icon,
                            color: Theme.of(context).primaryColor,
                            size:40
                          ),
                          Tooltip(
                            message: widget.boxes[x].number.toString(),
                            child: Text(
                              widget.boxes[x].number.toString(),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 30
                              )
                            )
                          ),
                          Text(
                            widget.boxes[x].text,
                            maxLines: 2,
                            style: const TextStyle(
                              color: Colors.white
                            )
                          )
                        ],
                      )
                    )
                )
            ]
          )
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  _getGraphData() {
    double width = 20;
    BorderRadius borderRadius = BorderRadius.only(topLeft: Radius.circular(4), topRight: Radius.circular(4));
    List<BarChartGroupData> data = [];
    for(int x = 0; x < widget.monthlyReports.length; x++){
      data.add(BarChartGroupData(x: x, barRods: [
        BarChartRodData(color: Theme.of(context).primaryColor, toY: widget.monthlyReports[x].earning, width: width, borderRadius: borderRadius),
        BarChartRodData(color: const Color(0xffb9d2ff), toY: widget.monthlyReports[x].spending, width: width, borderRadius: borderRadius)
      ]));
    }
    return data;
  }
}