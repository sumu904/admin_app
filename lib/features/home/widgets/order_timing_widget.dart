import 'dart:async';
import 'package:admin_app/util/styles.dart';
import 'package:flutter/material.dart';

class OrderTimingWidget extends StatefulWidget {
  final String orderStatus;
  final DateTime pendingAt;
  final int estimatedProcessingTime;
  final DateTime handoverAt;
  final DateTime estimatedArrivalAt;
  final DateTime currentTime;
  final DateTime processingAt;

  const OrderTimingWidget({
    super.key,
    required this.orderStatus,
    required this.pendingAt,
    required this.processingAt,
    required this.estimatedProcessingTime,
    required this.handoverAt,
    required this.estimatedArrivalAt,
    required this.currentTime,
  });

  @override
  State<OrderTimingWidget> createState() => _OrderTimingWidgetState();
}

class _OrderTimingWidgetState extends State<OrderTimingWidget> {

  late Timer _timer;
  Duration _timeDifference = const Duration();

  @override
  void initState() {
    super.initState();
    _calculateInitialDifference();
    _startTimer();
  }

  void _calculateInitialDifference() {

    switch (widget.orderStatus) {
      case 'pending':
        setState(() {
          _timeDifference = widget.currentTime.difference(widget.pendingAt);
        });
        break;

      case 'processing':
        DateTime processingDeadline = widget.pendingAt.add(Duration(minutes: widget.estimatedProcessingTime));
        setState(() {
          _timeDifference = processingDeadline.difference(widget.currentTime);
        });
        break;

      case 'handover':
        setState(() {
          _timeDifference = widget.currentTime.difference(widget.handoverAt);
        });
        break;

      case 'picked_up':
        setState(() {
          _timeDifference = widget.estimatedArrivalAt.difference(widget.currentTime);
        });
        break;
    }
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (widget.orderStatus == 'processing') {
          // Time left decreases during processing
          _timeDifference = _timeDifference - const Duration(seconds: 1);
        } else {
          // Time increases for pending, handover, and late arrival
          _timeDifference = _timeDifference + const Duration(seconds: 1);
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String minutes = twoDigits(duration.inMinutes.remainder(60));
    String seconds = twoDigits(duration.inSeconds.remainder(60));
    return "$minutes:$seconds";
  }

  Widget _buildStatusWidget() {
    String displayText;
    if (widget.orderStatus == 'processing') {
      if (_timeDifference.isNegative) {
        displayText = "${_formatDuration(_timeDifference.abs())} late";
      } else {
        displayText = "${_formatDuration(_timeDifference)} left";
      }
    } else if (widget.orderStatus == 'handover') {
      if (_timeDifference.isNegative) {
        displayText = "${_formatDuration(_timeDifference.abs())} late";
      } else {
        displayText = "${_formatDuration(_timeDifference)} left";
      }
    } else if(widget.orderStatus == 'picked_up'){
      displayText = "Arriving in ${_formatDuration(_timeDifference)}";
    }else {
      displayText = _formatDuration(_timeDifference);
    }

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: ((widget.orderStatus == 'processing' || widget.orderStatus == 'handover') && _timeDifference.isNegative) ? Theme.of(context).colorScheme.error
        : ((widget.orderStatus == 'processing' || widget.orderStatus == 'handover') && !_timeDifference.isNegative) ? Colors.green : Theme.of(context).textTheme.bodyLarge?.color,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        displayText,
        style: robotoRegular.copyWith(color: Theme.of(context).cardColor),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildStatusWidget();
  }
}
