import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';


class FormatDate{
  String formatDate(String date){
    initializeDateFormatting('pt-BR');
    DateFormat dateFormat = DateFormat('dd/MM/yyyy');
    DateTime toDate = DateTime.parse(date);
    String newDate = dateFormat.format(toDate);
    return newDate;
  }
}