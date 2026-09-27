import 'package:flutter/material.dart';

/// One class session in the weekly timetable.
class ClassSession {
  final String day;
  final String subjectCode;
  final String section;
  final String type; // 'Lecture' or 'Laboratory'
  final String room;
  final String time;
  final Color color;

  const ClassSession({
    required this.day,
    required this.subjectCode,
    required this.section,
    required this.type,
    required this.room,
    required this.time,
    required this.color,
  });
}

/// Sample weekly class schedule, color-coded per subject the same way as
/// the reference timetable (each subject keeps one color across the week).
const List<ClassSession> classSchedule = [
  // Monday
  ClassSession(
    day: 'Monday',
    subjectCode: 'ITP103',
    section: '3IT-B',
    type: 'Lecture',
    room: 'Room 312',
    time: '11:00 AM - 1:00 PM',
    color: Color(0xFFB0206A),
  ),
  ClassSession(
    day: 'Monday',
    subjectCode: 'CCS109',
    section: '3IT-B',
    type: 'Lecture',
    room: 'Room 309',
    time: '1:00 PM - 3:00 PM',
    color: Color(0xFF9B2226),
  ),
  ClassSession(
    day: 'Monday',
    subjectCode: 'ITP107',
    section: '3IT-B',
    type: 'Laboratory',
    room: 'COMLAB 2',
    time: '4:00 PM - 7:00 PM',
    color: Color(0xFFEF6C4D),
  ),

  // Tuesday
  ClassSession(
    day: 'Tuesday',
    subjectCode: 'CCS111',
    section: '3IT-B',
    type: 'Lecture',
    room: 'Room 312',
    time: '11:00 AM - 1:00 PM',
    color: Color(0xFF23255C),
  ),
  ClassSession(
    day: 'Tuesday',
    subjectCode: 'ITEW3',
    section: '3IT-B',
    type: 'Lecture',
    room: 'BCH 501',
    time: '3:00 PM - 5:00 PM',
    color: Color(0xFF0E8C8C),
  ),

  // Wednesday
  ClassSession(
    day: 'Wednesday',
    subjectCode: 'ITP104',
    section: '3IT-B',
    type: 'Laboratory',
    room: 'COMLAB 1',
    time: '1:00 PM - 4:00 PM',
    color: Color(0xFF2F855A),
  ),
  ClassSession(
    day: 'Wednesday',
    subjectCode: 'ITP104',
    section: '3IT-B',
    type: 'Lecture',
    room: 'BCH 501',
    time: '5:00 PM - 7:00 PM',
    color: Color(0xFF2F855A),
  ),

  // Thursday
  ClassSession(
    day: 'Thursday',
    subjectCode: 'ITP103',
    section: '3IT-B',
    type: 'Laboratory',
    room: 'COMLAB 3',
    time: '10:00 AM - 1:00 PM',
    color: Color(0xFFB0206A),
  ),
  ClassSession(
    day: 'Thursday',
    subjectCode: 'CCS109',
    section: '3IT-B',
    type: 'Lecture',
    room: 'Room 309',
    time: '1:00 PM - 3:00 PM',
    color: Color(0xFF9B2226),
  ),
  ClassSession(
    day: 'Thursday',
    subjectCode: 'ITP107',
    section: '3IT-B',
    type: 'Lecture',
    room: 'Room 310',
    time: '3:30 PM - 6:00 PM',
    color: Color(0xFFEF6C4D),
  ),

  // Friday
  ClassSession(
    day: 'Friday',
    subjectCode: 'CCS111',
    section: '3IT-B',
    type: 'Laboratory',
    room: 'COMLAB 2',
    time: '1:00 PM - 4:00 PM',
    color: Color(0xFF23255C),
  ),
  ClassSession(
    day: 'Friday',
    subjectCode: 'ITEW3',
    section: '3IT-B',
    type: 'Laboratory',
    room: 'COMLAB 1',
    time: '4:00 PM - 7:00 PM',
    color: Color(0xFF0E8C8C),
  ),
];
