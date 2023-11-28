import 'package:intl/intl.dart';
import 'package:search_project/generated/l10n.dart';

abstract class DateHelper {
  static final longDateFormat =
      DateFormat("MMMM dd, yyyy '${S.current.at}' h:mm a");
  static final mmDDYY = DateFormat('MM/dd/yy');
  static final monthDayDateFormat = DateFormat.MMMMd();
  static final monthDateFormat = DateFormat.MMMM();
}
