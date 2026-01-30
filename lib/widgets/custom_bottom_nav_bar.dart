import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';

class CustomBottomNavBar extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  final List<String> _navItems = ["Home", "History", "Profile"];
  final List<GlobalKey> _navKeys = [];

  // Pill properties
  double _pillLeft = 0;
  double _pillWidth = 0;
  double _pillHeight = 0;
  bool _initialLayoutComplete = false;

  @override
  void initState() {
    super.initState();
    _navKeys.addAll(List.generate(_navItems.length, (_) => GlobalKey()));
    // Schedule the initial measurement after the first frame
    WidgetsBinding.instance.addPostFrameCallback((_) => _updatePillPosition());
  }

  @override
  void didUpdateWidget(CustomBottomNavBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selectedIndex != widget.selectedIndex) {
      // Wait for the build then measure
      WidgetsBinding.instance.addPostFrameCallback(
        (_) => _updatePillPosition(),
      );
    }
  }

  void _updatePillPosition() {
    if (_navKeys.isEmpty) return;

    // We assume the first item determines the "zero" coordinate for the pill
    final RenderBox? firstItemBox =
        _navKeys[0].currentContext?.findRenderObject() as RenderBox?;
    if (firstItemBox == null) return;

    final RenderBox? selectedItemBox =
        _navKeys[widget.selectedIndex].currentContext?.findRenderObject()
            as RenderBox?;

    if (selectedItemBox != null) {
      // Calculate relative position to the first item
      final offset =
          selectedItemBox.localToGlobal(Offset.zero) -
          firstItemBox.localToGlobal(Offset.zero);

      setState(() {
        _pillLeft = offset.dx;
        _pillWidth = selectedItemBox.size.width;
        _pillHeight = selectedItemBox.size.height;
        _initialLayoutComplete = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(
              6,
            ), // Outer padding for the pill container
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [AppColors.primaryVariant, AppColors.primary],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.2),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Stack(
              children: [
                // Sliding Pill
                // Only show after initial layout to prevent jumping from 0
                if (_initialLayoutComplete)
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOutCubic,
                    left: _pillLeft,
                    width: _pillWidth,
                    height: _pillHeight,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                  ),
                // Navigation Items
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(_navItems.length, (index) {
                    return _buildNavItem(index, _navItems[index]);
                  }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(int index, String label) {
    final bool isSelected = widget.selectedIndex == index;
    return GestureDetector(
      onTap: () => widget.onItemTapped(index),
      child: Container(
        key: _navKeys[index],
        color: Colors.transparent, // Hit test coverage
        padding: const EdgeInsets.symmetric(
          horizontal: 24.0, // Generous touch area
          vertical: 12.0,
        ),
        child: Text(
          label,
          style: TextStyle(
            color: Colors.white.withValues(alpha: isSelected ? 1.0 : 0.7),
            fontWeight: FontWeight.w600, // Semi-bold looks cleaner than bold
            fontSize: 15,
            fontFamily: AppTheme.fontFamily,
          ),
        ),
      ),
    );
  }
}
