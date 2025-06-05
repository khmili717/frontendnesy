import 'package:flutter/material.dart';

class SearchBarWidget extends StatefulWidget {
  final String hintText;
  final ValueChanged<String> onChanged;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? semanticsLabel;

  const SearchBarWidget({
    super.key,
    required this.hintText,
    required this.onChanged,
    this.controller,
    this.focusNode,
    this.semanticsLabel,
  });

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _focusAnimation;
  bool _isFocused = false;
  bool _hasText = false;

  @override
  void initState() {
    super.initState();
    
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    
    _focusAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    widget.focusNode?.addListener(_onFocusChange);
    widget.controller?.addListener(_onTextChange);
    
    // Initialize text state
    _hasText = widget.controller?.text.isNotEmpty ?? false;
  }

  @override
  void dispose() {
    widget.focusNode?.removeListener(_onFocusChange);
    widget.controller?.removeListener(_onTextChange);
    _animationController.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    final isFocused = widget.focusNode?.hasFocus ?? false;
    if (_isFocused != isFocused) {
      setState(() {
        _isFocused = isFocused;
      });
      
      if (isFocused) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    }
  }

  void _onTextChange() {
    final hasText = widget.controller?.text.isNotEmpty ?? false;
    if (_hasText != hasText) {
      setState(() {
        _hasText = hasText;
      });
    }
  }

  void _clearText() {
    widget.controller?.clear();
    widget.onChanged('');
    widget.focusNode?.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: widget.semanticsLabel ?? 'Champ de recherche',
      child: AnimatedBuilder(
        animation: _focusAnimation,
        builder: (context, child) {
          return Container(
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: _isFocused 
                    ? const Color(0xFF13A4AB)
                    : const Color(0xFFE0E0E0),
                width: _isFocused ? 2 : 1,
              ),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 2),
                  blurRadius: _isFocused ? 8 : 4,
                  color: (_isFocused 
                      ? const Color(0xFF13A4AB) 
                      : const Color(0xFFD6D6D6)
                  ).withOpacity(0.15),
                ),
              ],
            ),
            child: Row(
              children: [
                // Search icon
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 8),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    child: Icon(
                      Icons.search_rounded,
                      color: _isFocused 
                          ? const Color(0xFF13A4AB)
                          : const Color(0xFF9E9E9E),
                      size: 22,
                      semanticLabel: 'Icône de recherche',
                    ),
                  ),
                ),
                
                // Text field
                Expanded(
                  child: TextField(
                    controller: widget.controller,
                    focusNode: widget.focusNode,
                    onChanged: widget.onChanged,
                    style: const TextStyle(
                      fontFamily: 'League Spartan',
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                      color: Color(0xFF393C3C),
                    ),
                    decoration: InputDecoration(
                      hintText: widget.hintText,
                      hintStyle: const TextStyle(
                        fontFamily: 'League Spartan',
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                        color: Color(0xFF9E9E9E),
                      ),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 14,
                      ),
                      isDense: true,
                    ),
                  ),
                ),
                
                // Clear button
                if (_hasText)
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: AnimatedOpacity(
                      duration: const Duration(milliseconds: 200),
                      opacity: _hasText ? 1.0 : 0.0,
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(20),
                          onTap: _clearText,
                          child: Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                              color: Colors.grey[100],
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.close_rounded,
                              color: Color(0xFF717171),
                              size: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                
                const SizedBox(width: 8),
              ],
            ),
          );
        },
      ),
    );
  }
} 