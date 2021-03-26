import 'package:flutter/material.dart';

import './models/room.dart';
import './models/usage.dart';
import './models/statistic.dart';

final dummyData = [
  UsageData(
    id: "1",
    room: Room(
      id: 1,
      name: 'Room01',
      description: '+2% than yesterday',
      colors: Colors.red,
      usage: '93.6',
    ),
    todayDescription: '+2% than yesterday',
    monthDescription: '+1% than last month',
    totalTodayUsed: 93,
    totalMonthUsed: 2808,
    totalPrice: 1523,
    weeks: {
      'week1': {
        1: {'totalUsed': 93.6},
        2: {'totalUsed': 92.4},
        3: {'totalUsed': 93.1},
        4: {'totalUsed': 92.2},
        5: {'totalUsed': 91.6},
        6: {'totalUsed': 88.5},
        7: {'totalUsed': 86.4},
      },
      'week2': {
        'day8': {'totalUsed': 87.3},
        'day9': {'totalUsed': 88.2},
        'day10': {'totalUsed': 89.6},
        'day11': {'totalUsed': 87.5},
        'day12': {'totalUsed': 90.6},
        'day13': {'totalUsed': 91.3},
        'day14': {'totalUsed': 91.5},
      },
      'week3': {
        'day15': {'totalUsed': 83.2},
        'day16': {'totalUsed': 84.8},
        'day17': {'totalUsed': 90.9},
        'day18': {'totalUsed': 89.8},
        'day19': {'totalUsed': 84.6},
        'day20': {'totalUsed': 87.5},
        'day21': {'totalUsed': 93.4},
      },
      'week4': {
        'day22': {'totalUsed': 92.1},
        'day23': {'totalUsed': 84.3},
        'day24': {'totalUsed': 85.6},
        'day25': {'totalUsed': 82.6},
        'day26': {'totalUsed': 90.6},
        'day27': {'totalUsed': 91.3},
        'day28': {'totalUsed': 92.6},
      },
      'week5': {
        'day29': {'totalUsed': 94.5},
        'day30': {'totalUsed': 92.3},
        'day31': {'totalUsed': 94.6},
      }
    },
    days: {
      0: 3.9,
      1: 3.9,
      2: 3.9,
      3: 3.9,
      4: 3.9,
      5: 3.9,
      6: 8.16,
      7: 8.16,
      8: 8.16,
      9: 8.16,
      10: 8.16,
      11: 8.16,
      12: 8.16,
      13: 8.16,
      14: 8.16,
      15: 8.16,
      16: 8.16,
      17: 8.16,
      18: 8.16,
      19: 8.16,
      20: 8.16,
      21: 8.16,
      22: 12.08,
      23: 12.08,
      24: 12.08,
    },
  ),
  UsageData(
    id: "2",
    room: Room(
      id: 2,
      name: 'Room02',
      description: '-6% than yesterday',
      colors: Colors.green,
      usage: '83.6',
    ),
    todayDescription: '-6% than yesterday',
    monthDescription: '-3% than last month',
    totalTodayUsed: 83,
    totalMonthUsed: 2508,
    totalPrice: 1368,
    weeks: {
      'week1': {
        'day1': {'totalUsed': 83.6},
        'day2': {'totalUsed': 83.6},
        'day3': {'totalUsed': 83.6},
        'day4': {'totalUsed': 83.6},
        'day5': {'totalUsed': 83.6},
        'day6': {'totalUsed': 83.6},
        'day7': {'totalUsed': 83.6},
      },
      'week2': {
        'day8': {'totalUsed': 83.6},
        'day9': {'totalUsed': 83.6},
        'day10': {'totalUsed': 83.6},
        'day11': {'totalUsed': 83.6},
        'day12': {'totalUsed': 83.6},
        'day13': {'totalUsed': 83.6},
        'day14': {'totalUsed': 83.6},
      },
      'week3': {
        'day15': {'totalUsed': 83.6},
        'day16': {'totalUsed': 83.6},
        'day17': {'totalUsed': 83.6},
        'day18': {'totalUsed': 83.6},
        'day19': {'totalUsed': 83.6},
        'day20': {'totalUsed': 83.6},
        'day21': {'totalUsed': 83.6},
      },
      'week4': {
        'day22': {'totalUsed': 83.6},
        'day23': {'totalUsed': 83.6},
        'day24': {'totalUsed': 83.6},
        'day25': {'totalUsed': 83.6},
        'day26': {'totalUsed': 83.6},
        'day27': {'totalUsed': 83.6},
        'day28': {'totalUsed': 83.6},
      },
      'week5': {
        'day29': {'totalUsed': 83.6},
        'day30': {'totalUsed': 83.6},
        'day31': {'totalUsed': 83.6},
      }
    },
    days: {
      0: 3.48,
      1: 3.48,
      2: 3.48,
      3: 3.48,
      4: 3.48,
      5: 3.48,
      6: 3.48,
      7: 3.48,
      8: 3.48,
      9: 3.48,
      10: 3.48,
      11: 3.48,
      12: 3.48,
      13: 3.48,
      14: 3.48,
      15: 3.48,
      16: 3.48,
      17: 3.48,
      18: 3.48,
      19: 3.48,
      20: 3.48,
      21: 3.48,
      22: 3.48,
      23: 3.48,
      24: 3.48,
    },
  ),
  UsageData(
      id: "3",
      room: Room(
        id: 3,
        name: 'Room03',
        description: '+4% than yesterday',
        colors: Colors.red,
        usage: '95.5',
      ),
      todayDescription: '+4% than yesterday',
      monthDescription: '+2% than last month',
      totalTodayUsed: 95,
      totalMonthUsed: 2865,
      totalPrice: 1602,
      weeks: {
        'week1': {
          'day1': {'totalUsed': 95.5},
          'day2': {'totalUsed': 95.5},
          'day3': {'totalUsed': 95.5},
          'day4': {'totalUsed': 95.5},
          'day5': {'totalUsed': 95.5},
          'day6': {'totalUsed': 95.5},
          'day7': {'totalUsed': 95.5},
        },
        'week2': {
          'day8': {'totalUsed': 95.5},
          'day9': {'totalUsed': 95.5},
          'day10': {'totalUsed': 95.5},
          'day11': {'totalUsed': 95.5},
          'day12': {'totalUsed': 95.5},
          'day13': {'totalUsed': 95.5},
          'day14': {'totalUsed': 95.5},
        },
        'week3': {
          'day15': {'totalUsed': 95.5},
          'day16': {'totalUsed': 95.5},
          'day17': {'totalUsed': 95.5},
          'day18': {'totalUsed': 95.5},
          'day19': {'totalUsed': 95.5},
          'day20': {'totalUsed': 95.5},
          'day21': {'totalUsed': 95.5},
        },
        'week4': {
          'day22': {'totalUsed': 95.5},
          'day23': {'totalUsed': 95.5},
          'day24': {'totalUsed': 95.5},
          'day25': {'totalUsed': 95.5},
          'day26': {'totalUsed': 95.5},
          'day27': {'totalUsed': 95.5},
          'day28': {'totalUsed': 95.5},
        },
        'week5': {
          'day29': {'totalUsed': 95.5},
          'day30': {'totalUsed': 95.5},
          'day31': {'totalUsed': 95.5},
        }
      },
      days: {
        0: 3.98,
        1: 3.98,
        2: 3.98,
        3: 3.98,
        4: 3.98,
        5: 3.98,
        6: 3.98,
        7: 3.98,
        8: 3.98,
        9: 3.98,
        10: 3.98,
        11: 3.98,
        12: 3.98,
        13: 3.98,
        14: 3.98,
        15: 3.98,
        16: 3.98,
        17: 3.98,
        18: 3.98,
        19: 3.98,
        20: 3.98,
        21: 3.98,
        22: 3.98,
        23: 3.98,
        24: 3.98,
      }),
  UsageData(
      id: "4",
      room: Room(
        id: 4,
        name: 'Room04',
        description: '-12% than yesterday',
        colors: Colors.green,
        usage: '78.1',
      ),
      todayDescription: '-12% than yesterday',
      monthDescription: '-6% than last month',
      totalTodayUsed: 78,
      totalMonthUsed: 2343,
      totalPrice: 1193,
      weeks: {
        'week1': {
          'day1': {'totalUsed': 78.1},
          'day2': {'totalUsed': 78.1},
          'day3': {'totalUsed': 78.1},
          'day4': {'totalUsed': 78.1},
          'day5': {'totalUsed': 78.1},
          'day6': {'totalUsed': 78.1},
          'day7': {'totalUsed': 78.1},
        },
        'week2': {
          'day8': {'totalUsed': 78.1},
          'day9': {'totalUsed': 78.1},
          'day10': {'totalUsed': 78.1},
          'day11': {'totalUsed': 78.1},
          'day12': {'totalUsed': 78.1},
          'day13': {'totalUsed': 78.1},
          'day14': {'totalUsed': 78.1},
        },
        'week3': {
          'day15': {'totalUsed': 78.1},
          'day16': {'totalUsed': 78.1},
          'day17': {'totalUsed': 78.1},
          'day18': {'totalUsed': 78.1},
          'day19': {'totalUsed': 78.1},
          'day20': {'totalUsed': 78.1},
          'day21': {'totalUsed': 78.1},
        },
        'week4': {
          'day22': {'totalUsed': 78.1},
          'day23': {'totalUsed': 78.1},
          'day24': {'totalUsed': 78.1},
          'day25': {'totalUsed': 78.1},
          'day26': {'totalUsed': 78.1},
          'day27': {'totalUsed': 78.1},
          'day28': {'totalUsed': 78.1},
        },
        'week5': {
          'day29': {'totalUsed': 78.1},
          'day30': {'totalUsed': 78.1},
          'day31': {'totalUsed': 78.1},
        }
      },
      days: {
        0: 3.25,
        1: 3.25,
        2: 3.25,
        3: 3.25,
        4: 3.25,
        5: 3.25,
        6: 3.25,
        7: 3.25,
        8: 3.25,
        9: 3.25,
        10: 3.25,
        11: 3.25,
        12: 3.25,
        13: 3.25,
        14: 3.25,
        15: 3.25,
        16: 3.25,
        17: 3.25,
        18: 3.25,
        19: 3.25,
        20: 3.25,
        21: 3.25,
        22: 3.25,
        23: 3.25,
        24: 3.25,
      }),
  UsageData(
      id: "5",
      room: Room(
        id: 5,
        name: 'Room05',
        description: '-4% than yesterday',
        colors: Colors.green,
        usage: '86.2',
      ),
      todayDescription: '-4% than yesterday',
      monthDescription: '-2% than yesterday',
      totalTodayUsed: 86,
      totalMonthUsed: 2586,
      totalPrice: 1407,
      weeks: {
        'week1': {
          'day1': {'totalUsed': 86.2},
          'day2': {'totalUsed': 86.2},
          'day3': {'totalUsed': 86.2},
          'day4': {'totalUsed': 86.2},
          'day5': {'totalUsed': 86.2},
          'day6': {'totalUsed': 86.2},
          'day7': {'totalUsed': 86.2},
        },
        'week2': {
          'day8': {'totalUsed': 86.2},
          'day9': {'totalUsed': 86.2},
          'day10': {'totalUsed': 86.2},
          'day11': {'totalUsed': 86.2},
          'day12': {'totalUsed': 86.2},
          'day13': {'totalUsed': 86.2},
          'day14': {'totalUsed': 86.2},
        },
        'week3': {
          'day15': {'totalUsed': 86.2},
          'day16': {'totalUsed': 86.2},
          'day17': {'totalUsed': 86.2},
          'day18': {'totalUsed': 86.2},
          'day19': {'totalUsed': 86.2},
          'day20': {'totalUsed': 86.2},
          'day21': {'totalUsed': 86.2},
        },
        'week4': {
          'day22': {'totalUsed': 86.2},
          'day23': {'totalUsed': 86.2},
          'day24': {'totalUsed': 86.2},
          'day25': {'totalUsed': 86.2},
          'day26': {'totalUsed': 86.2},
          'day27': {'totalUsed': 86.2},
          'day28': {'totalUsed': 86.2},
        },
        'week5': {
          'day29': {'totalUsed': 86.2},
          'day30': {'totalUsed': 86.2},
          'day31': {'totalUsed': 86.2},
        }
      },
      days: {
        0: 3.6,
        1: 3.6,
        2: 3.6,
        3: 3.6,
        4: 3.6,
        5: 3.6,
        6: 3.6,
        7: 3.6,
        8: 3.6,
        9: 3.6,
        10: 3.6,
        11: 3.6,
        12: 3.6,
        13: 3.6,
        14: 3.6,
        15: 3.6,
        16: 3.6,
        17: 3.6,
        18: 3.6,
        19: 3.6,
        20: 3.6,
        21: 3.6,
        22: 3.6,
        23: 3.6,
        24: 3.6,
      })
];

final dummyStatistic = [
  Statistic(count: 1450, month: 'Jan'),
  Statistic(count: 1450, month: 'Feb'),
  Statistic(count: 1450, month: 'March'),
];
