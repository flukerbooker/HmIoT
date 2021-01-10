class UsagesData {
  final int id;
  final String lastRead;
  final List last7Days;

  const UsagesData(this.id, this.lastRead, this.last7Days);
}

class UsagesDataMonth {
  final String id;
  final double price;
  final String usageMonth;

  const UsagesDataMonth(this.id, this.price, this.usageMonth);
}
