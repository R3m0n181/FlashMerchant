import 'package:flutter/material.dart';

// Adapted from the data table demo in offical flutter gallery:
// https://github.com/flutter/flutter/blob/master/examples/flutter_gallery/lib/demo/material/data_table_demo.dart
class D_Inventory extends StatefulWidget {
  const D_Inventory({Key? key}) : super(key: key);

  @override
  _D_InventoryState createState() => _D_InventoryState();
}

class _D_InventoryState extends State<D_Inventory> {
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: PaginatedDataTable(
        header: const Text('Inventory'),
        rowsPerPage: _rowsPerPage,
        availableRowsPerPage: const <int>[5, 10, 20],
        onRowsPerPageChanged: (int? value) {
          if (value != null) {
            setState(() => _rowsPerPage = value);
          }
        },
        columns: kTableColumns,
        source: DessertDataSource(),
      ),
    );
  }
}

////// Columns in table.
const kTableColumns = <DataColumn>[
  DataColumn(
    label: Text('Product Name'),
  ),
  DataColumn(
    label: Text('Quantity'),
    tooltip: 'The total number of item in inventory',
    numeric: true,
  ),
  DataColumn(
    label: Text('Unit Price'),
    numeric: true,
  ),
  DataColumn(
    label: Text('Batch No'),
    numeric: true,
  ),
];

////// Data class.
class Dessert {
  Dessert(this.name, this.quantity, this.unitPrice, this.batchNo);

  final String name;
  final int quantity;
  final double unitPrice;
  final String batchNo;

  bool selected = false;
}

////// Data source class for obtaining row data for PaginatedDataTable.
class DessertDataSource extends DataTableSource {
  int _selectedCount = 0;
  final List<Dessert> _desserts = <Dessert>[
    Dessert('Frozen yogurt', 159, 6.0, '24'),
    Dessert('Ice cream sandwich', 237, 9.0, '37'),
    Dessert('Eclair', 262, 16.0, '24'),
    Dessert('Cupcake', 305, 3.7, '67'),
    Dessert('Gingerbread', 356, 16.0, '49'),
    Dessert('Jelly bean', 375, 0.0, '94'),

  ];

  @override
  DataRow? getRow(int index) {
    assert(index >= 0);
    if (index >= _desserts.length) return null;
    final Dessert dessert = _desserts[index];
    return DataRow.byIndex(
      index: index,
      selected: dessert.selected,
      onSelectChanged: (bool? value) {
        if (value == null) return;
        if (dessert.selected != value) {
          _selectedCount += value ? 1 : -1;
          assert(_selectedCount >= 0);
          dessert.selected = value;
          notifyListeners();
        }
      },
      cells: <DataCell>[
        DataCell(Text(dessert.name)),
        DataCell(Text('${dessert.quantity}')),
        DataCell(Text(dessert.unitPrice.toStringAsFixed(1))),
        DataCell(Text(dessert.batchNo)),
      ],
    );
  }

  @override
  int get rowCount => _desserts.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;
}


