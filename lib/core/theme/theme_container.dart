import 'package:search_project/configs/environment/environment_variables.dart';
import 'package:search_project/core/theme/solution_theme.dart';
import 'package:search_project/core/theme/theme_vendor_one.dart';

abstract class ThemeFactory {
  static SolutionTheme get lightTheme => _vendorTheme.lightTheme;

  static SolutionTheme get darkTheme => _vendorTheme.darkTheme;

  static const _isVendorTheme1 =
      EnvironmentVariables.vendorThemeConfiguration == 1;

  static final _vendorTheme1 =
      ThemeContainer(VendorThemeOneLight(), VendorThemeOneDark());

  static final _defaultVendorTheme = _vendorTheme1;

  static ThemeContainer get _vendorTheme {
    if (_isVendorTheme1) return _vendorTheme1;
    return _defaultVendorTheme;
  }
}

class ThemeContainer {
  ThemeContainer(this.lightTheme, this.darkTheme);
  final SolutionTheme lightTheme;
  final SolutionTheme darkTheme;
}
