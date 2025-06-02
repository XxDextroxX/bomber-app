class BoxModel {
  List<DataBox> data;
  int limit;
  int page;
  int totalItems;
  int totalPages;

  BoxModel({
    this.data = const [],
    this.limit = 0,
    this.page = 0,
    this.totalItems = 0,
    this.totalPages = 0,
  });

  factory BoxModel.fromJson(Map<String, dynamic> json) => BoxModel(
    data: List<DataBox>.from(json["data"].map((x) => DataBox.fromJson(x))),
    limit: json["limit"],
    page: json["page"],
    totalItems: json["total_items"],
    totalPages: json["total_pages"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson)),
    "limit": limit,
    "page": page,
    "totalItems": totalItems,
    "totalPages": totalPages,
  };
}

class DataBox {
  double alturaLote;
  double anchoLote;
  String code;
  String colorLote;
  String fechaCreacionLote;
  String nameAlmacen;
  String nameLote;
  String observacionesLote;
  String pesoLote;
  String referenceLote;
  int cost;
  String image;
  int lotId;
  int lotProductId;
  String lotProductStock;
  String name;
  int price;
  String productCode;
  int productWarehouseId;
  String productWarehouseStock;
  String variantName;
  String variantTitle;
  int warehouseId;

  DataBox({
    this.alturaLote = 0.0,
    this.anchoLote = 0.0,
    this.code = '',
    this.colorLote = '',
    this.fechaCreacionLote = '',
    this.nameAlmacen = '',
    this.nameLote = '',
    this.observacionesLote = '',
    this.pesoLote = '',
    this.referenceLote = '',
    this.cost = 0,
    this.image = '',
    this.lotId = 0,
    this.lotProductId = 0,
    this.lotProductStock = '',
    this.name = '',
    this.price = 0,
    this.productCode = '',
    this.productWarehouseId = 0,
    this.productWarehouseStock = '',
    this.variantName = '',
    this.variantTitle = '',
    this.warehouseId = 0,
  });

  factory DataBox.fromJson(Map<String, dynamic> json) => DataBox(
    alturaLote:
        json['AlturaLote'] != null ? json['AlturaLote'].toDouble() : 0.0,
    anchoLote: json['AnchoLote'] != null ? json['AnchoLote'].toDouble() : 0.0,
    code: json['Code'],
    colorLote: json['ColorLote'],
    fechaCreacionLote: json['FechaCreacionLote'],
    nameAlmacen: json['NameAlmacen'],
    nameLote: json['NameLote'],
    observacionesLote: json['ObservacionesLote'],
    pesoLote: json['PesoLote'],
    referenceLote: json['ReferenceLote'],
    cost: json['cost'],
    image: json['image'],
    lotId: json['lot_id'],
    lotProductId: json['lot_product_id'],
    lotProductStock: json['lot_product_stock'],
    name: json['name'],
    price: json['price'],
    productCode: json['product_code'],
    productWarehouseId: json['product_warehouse_id'],
    productWarehouseStock: json['product_warehouse_stock'],
    variantName: json['variant_name'],
    variantTitle: json['variant_title'],
    warehouseId: json['warehouse_id'],
  );

  Map<String, dynamic> toJson() => {
    'AlturaLote': alturaLote,
    'AnchoLote': anchoLote,
    'Code': code,
    'ColorLote': colorLote,
    'FechaCreacionLote': fechaCreacionLote,
    'NameAlmacen': nameAlmacen,
    'NameLote': nameLote,
    'ObservacionesLote': observacionesLote,
    'PesoLote': pesoLote,
    'ReferenceLote': referenceLote,
    'cost': cost,
    'image': image,
    'lot_id': lotId,
    'lot_product_id': lotProductId,
    'lot_product_stock': lotProductStock,
    'name': name,
    'price': price,
    'product_code': productCode,
    'product_warehouse_id': productWarehouseId,
    'product_warehouse_stock': productWarehouseStock,
    'variant_name': variantName,
    'variant_title': variantTitle,
    'warehouse_id': warehouseId,
  };
}
