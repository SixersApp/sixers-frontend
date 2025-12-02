// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:sixers/backend/scoring_rule/scoring_rule_model.dart';

// class RuleRow extends StatefulWidget {
//   final ScoringRule rule;
//   final ValueChanged<ScoringRule> onChanged;
//   const RuleRow({super.key, required this.rule, required this.onChanged});

//   @override
//   State<RuleRow> createState() => _RuleRowState();
// }

// class _RuleRowState extends State<RuleRow> {
//   late TextEditingController a; // primary value
//   late TextEditingController b; // optional secondary value
//   late TextEditingController c; // optional tertiary value

//   @override
//   void initState() {
//     super.initState();
//     a = TextEditingController(text: _initialA());
//     b = TextEditingController(text: _initialB());
//     c = TextEditingController(text: _initialC());
//   }

//   @override
//   void didUpdateWidget(covariant RuleRow oldWidget) {
//     super.didUpdateWidget(oldWidget);
//     if (oldWidget.rule != widget.rule) {
//       a.text = _initialA();
//       b.text = _initialB();
//       c.text = _initialC();
//     }
//   }

//   @override
//   void dispose() {
//     a.dispose();
//     b.dispose();
//     c.dispose();
//     super.dispose();
//   }

//   String _initialA() {
//     final r = widget.rule;
//     switch (r.mode) {
//       case RuleMode.perUnit:
//         return (r.perUnitPoints ?? 0).toString();
//       case RuleMode.flat:
//         return (r.flatPoints ?? 0).toString();
//       case RuleMode.threshold:
//         return (r.threshold ?? 0).toString();
//       case RuleMode.band:
//         return (r.band?.lower ?? '').toString();
//       case RuleMode.multiplier:
//         return (r.multiplier ?? 1).toString();
//     }
//   }

//   String _initialB() {
//     final r = widget.rule;
//     switch (r.mode) {
//       case RuleMode.threshold:
//         return (r.flatPoints ?? 0).toString();
//       case RuleMode.band:
//         return (r.band?.upper ?? '').toString();
//       default:
//         return '';
//     }
//   }

//   String _initialC() {
//     final r = widget.rule;
//     switch (r.mode) {
//       case RuleMode.band:
//         return (r.flatPoints ?? 0).toString();
//       default:
//         return '';
//     }
//   }

//   void _emit() {
//     final r = widget.rule;
//     ScoringRule next;
//     switch (r.mode) {
//       case RuleMode.perUnit:
//         next = r.copyWith(perUnitPoints: num.tryParse(a.text));
//         break;
//       case RuleMode.flat:
//         next = r.copyWith(flatPoints: num.tryParse(a.text));
//         break;
//       case RuleMode.threshold:
//         next = r.copyWith(
//           threshold: int.tryParse(a.text),
//           flatPoints: num.tryParse(b.text),
//         );
//         break;
//       case RuleMode.band:
//         next = r.copyWith(
//           band: NumRange(lower: num.tryParse(a.text), upper: num.tryParse(b.text)),
//           flatPoints: num.tryParse(c.text),
//         );
//         break;
//       case RuleMode.multiplier:
//         next = r.copyWith(multiplier: num.tryParse(a.text));
//         break;
//     }
//     widget.onChanged(next);
//   }

//   @override
//   Widget build(BuildContext context) {
//     final r = widget.rule;
//     final label = _prettyStat(r.stat);

//     Widget numField(TextEditingController ctrl, {String? hint}) => SizedBox(
//           width: 66,
//           child: TextField(
//             controller: ctrl,
//             onChanged: (_) => _emit(),
//             decoration: InputDecoration(
//               hintText: hint,
//               isDense: true,
//               contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
//               border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
//               filled: true,
//             ),
//             keyboardType: const TextInputType.numberWithOptions(decimal: true),
//             inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9\-\.]*'))],
//           ),
//         );

//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 6),
//       child: Row(
//         children: [
//           Expanded(child: Text(label, style: Theme.of(context).textTheme.bodyLarge)),
//           const SizedBox(width: 12),
//           ..._rightSide(r, numField),
//         ],
//       ),
//     );
//   }

//   List<Widget> _rightSide(
//     ScoringRule r,
//     Widget Function(TextEditingController, {String? hint}) numField,
//   ) {
//     switch (r.mode) {
//       case RuleMode.perUnit:
//         return [numField(a)];
//       case RuleMode.flat:
//         return [numField(a)];
//       case RuleMode.threshold:
//         return [numField(a, hint: 'Threshold'), const SizedBox(width: 8), numField(b, hint: 'Points')];
//       case RuleMode.band:
//         return [
//           numField(a, hint: 'From'),
//           const SizedBox(width: 6),
//           const Text('–'),
//           const SizedBox(width: 6),
//           numField(b, hint: 'To'),
//           const SizedBox(width: 8),
//           numField(c, hint: 'Points'),
//         ];
//       case RuleMode.multiplier:
//         return [numField(a)];
//     }
//   }

//   String _prettyStat(String s) {
//     return s.split('_').map((p) => p.isEmpty ? p : p[0].toUpperCase() + p.substring(1)).join(' ');
//   }
// }
