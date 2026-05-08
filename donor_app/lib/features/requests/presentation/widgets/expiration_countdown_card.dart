import 'dart:async';

import 'package:donor_app/core/helpers/extensions.dart';
import 'package:donor_app/core/helpers/spacing.dart';
import 'package:donor_app/features/requests/presentation/widgets/countdown_numbers.dart';
import 'package:donor_app/features/requests/presentation/widgets/timer_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExpirationCountdownCard extends StatefulWidget {
  const ExpirationCountdownCard({super.key, required this.totalMinutes});

  final int totalMinutes;

  @override
  State<ExpirationCountdownCard> createState() =>
      _ExpirationCountdownCardState();
}

class _ExpirationCountdownCardState extends State<ExpirationCountdownCard> {
  late Timer _timer;
  late int _remainingSeconds;
  late int _totalSeconds;

  int get _hours => _remainingSeconds ~/ 3600;
  int get _minutes => (_remainingSeconds % 3600) ~/ 60;
  int get _seconds => _remainingSeconds % 60;
  double get _progress =>
      _totalSeconds > 0 ? _remainingSeconds / _totalSeconds : 0;
  bool get _isExpired => _remainingSeconds <= 0;

  @override
  void initState() {
    super.initState();
    _totalSeconds = widget.totalMinutes * 60;
    _remainingSeconds = _totalSeconds;
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (_remainingSeconds == 0) {
        _timer.cancel();
      } else {
        setState(() {
          _remainingSeconds -= 1;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(33.w),
      decoration: BoxDecoration(
        color: context.colors.mode,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE4BEBC).withAlpha(38)),
      ),
      child: Column(
        children: [
          Text(
            _isExpired ? 'REQUEST EXPIRED' : 'REQUEST EXPIRES IN',
            style: context.textStyles.font10TextSecondaryRegular.copyWith(
              fontWeight: FontWeight.w700,
              letterSpacing: 1,
              color: context.colors.textSecondary,
            ),
          ),
          verticalSpace(16),
          CountdownNumbers(hours: _hours, minutes: _minutes, seconds: _seconds),
          verticalSpace(16),
          TimerProgressBar(progress: _progress),
          verticalSpace(16),
          Text(
            _isExpired
                ? 'The request has expired.\nPlease check for new requests.'
                : 'Please arrive before the timer reaches zero to\nensure your donation is processed.',
            textAlign: TextAlign.center,
            style: context.textStyles.font12TextSecondaryRegular.copyWith(
              height: 1.33,
            ),
          ),
        ],
      ),
    );
  }
}
