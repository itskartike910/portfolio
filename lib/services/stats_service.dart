import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PortfolioStats {
  // LeetCode stats
  final int totalSolved;
  final int totalQuestions;
  final int easySolved;
  final int totalEasy;
  final int mediumSolved;
  final int totalMedium;
  final int hardSolved;
  final int totalHard;
  final int ranking;
  final double contestRating;
  final String contestRank;
  final int totalSubmissions;
  final int badgesCount;
  final Map<int, int> rawSubmissionCalendar; // timestamp -> count

  // GitHub stats
  final String githubUsername;
  final int totalContributions;
  final int publicRepos;
  final int followers;
  final int currentStreak;
  final int longestStreak;
  final List<Map<String, dynamic>> topLanguagesByRepo;
  final List<Map<String, dynamic>> topLanguagesByCommit;

  const PortfolioStats({
    this.totalSolved = 844,
    this.totalQuestions = 4047,
    this.easySolved = 276,
    this.totalEasy = 963,
    this.mediumSolved = 469,
    this.totalMedium = 2111,
    this.hardSolved = 99,
    this.totalHard = 973,
    this.ranking = 57379,
    this.contestRating = 1829.0,
    this.contestRank = "Top 7.16% (Knight)",
    this.totalSubmissions = 1961,
    this.badgesCount = 21,
    this.rawSubmissionCalendar = const {},
    this.githubUsername = "itskartike910",
    this.totalContributions = 849,
    this.publicRepos = 17,
    this.followers = 8,
    this.currentStreak = 0,
    this.longestStreak = 8,
    this.topLanguagesByRepo = const [
      {"name": "Dart", "pct": "35%", "color": Color(0xFF00D9FF), "val": 0.35},
      {"name": "JavaScript", "pct": "25%", "color": Color(0xFFFFD43B), "val": 0.25},
      {"name": "C++", "pct": "20%", "color": Color(0xFFFF375F), "val": 0.20},
      {"name": "Python", "pct": "12%", "color": Color(0xFF3776AB), "val": 0.12},
      {"name": "Other", "pct": "8%", "color": Color(0xFF9D4EDD), "val": 0.08},
    ],
    this.topLanguagesByCommit = const [
      {"name": "Dart", "pct": "40%", "color": Color(0xFF00D9FF), "val": 0.40},
      {"name": "C++", "pct": "30%", "color": Color(0xFFFF375F), "val": 0.30},
      {"name": "TypeScript", "pct": "18%", "color": Color(0xFF3178C6), "val": 0.18},
      {"name": "Python", "pct": "8%", "color": Color(0xFF3776AB), "val": 0.08},
      {"name": "Other", "pct": "4%", "color": Color(0xFF9D4EDD), "val": 0.04},
    ],
  });

  PortfolioStats copyWith({
    int? totalSolved,
    int? totalQuestions,
    int? easySolved,
    int? totalEasy,
    int? mediumSolved,
    int? totalMedium,
    int? hardSolved,
    int? totalHard,
    int? ranking,
    double? contestRating,
    String? contestRank,
    int? totalSubmissions,
    int? badgesCount,
    Map<int, int>? rawSubmissionCalendar,
    String? githubUsername,
    int? totalContributions,
    int? publicRepos,
    int? followers,
    int? currentStreak,
    int? longestStreak,
    List<Map<String, dynamic>>? topLanguagesByRepo,
    List<Map<String, dynamic>>? topLanguagesByCommit,
  }) {
    return PortfolioStats(
      totalSolved: totalSolved ?? this.totalSolved,
      totalQuestions: totalQuestions ?? this.totalQuestions,
      easySolved: easySolved ?? this.easySolved,
      totalEasy: totalEasy ?? this.totalEasy,
      mediumSolved: mediumSolved ?? this.mediumSolved,
      totalMedium: totalMedium ?? this.totalMedium,
      hardSolved: hardSolved ?? this.hardSolved,
      totalHard: totalHard ?? this.totalHard,
      ranking: ranking ?? this.ranking,
      contestRating: contestRating ?? this.contestRating,
      contestRank: contestRank ?? this.contestRank,
      totalSubmissions: totalSubmissions ?? this.totalSubmissions,
      badgesCount: badgesCount ?? this.badgesCount,
      rawSubmissionCalendar: rawSubmissionCalendar ?? this.rawSubmissionCalendar,
      githubUsername: githubUsername ?? this.githubUsername,
      totalContributions: totalContributions ?? this.totalContributions,
      publicRepos: publicRepos ?? this.publicRepos,
      followers: followers ?? this.followers,
      currentStreak: currentStreak ?? this.currentStreak,
      longestStreak: longestStreak ?? this.longestStreak,
      topLanguagesByRepo: topLanguagesByRepo ?? this.topLanguagesByRepo,
      topLanguagesByCommit: topLanguagesByCommit ?? this.topLanguagesByCommit,
    );
  }
}

class StatsService {
  static final StatsService _instance = StatsService._internal();
  factory StatsService() => _instance;
  StatsService._internal();

  final ValueNotifier<PortfolioStats> statsNotifier =
      ValueNotifier<PortfolioStats>(const PortfolioStats());

  bool _isFetching = false;

  Future<void> fetchAllStats() async {
    if (_isFetching) return;
    _isFetching = true;

    try {
      await Future.wait([
        _fetchLeetCodeProfile(),
        _fetchLeetCodeContest(),
        _fetchGitHubUser(),
        _fetchGitHubRepos(),
      ]);
    } catch (e) {
      if (kDebugMode) {
        print("Stats fetch completed with some fallback: $e");
      }
    } finally {
      _isFetching = false;
    }
  }

  Future<void> _fetchLeetCodeProfile() async {
    try {
      final res = await http
          .get(Uri.parse('https://alfa-leetcode-api.onrender.com/userProfile/its_kartike'))
          .timeout(const Duration(seconds: 7));

      if (res.statusCode == 200) {
        final data = jsonDecode(res.body);
        final totalSolved = data['totalSolved'] as int? ?? 844;
        final totalQuestions = data['totalQuestions'] as int? ?? 4047;
        final easySolved = data['easySolved'] as int? ?? 276;
        final totalEasy = data['totalEasy'] as int? ?? 963;
        final mediumSolved = data['mediumSolved'] as int? ?? 469;
        final totalMedium = data['totalMedium'] as int? ?? 2111;
        final hardSolved = data['hardSolved'] as int? ?? 99;
        final totalHard = data['totalHard'] as int? ?? 973;
        final ranking = data['ranking'] as int? ?? 57379;

        int totalSub = 1961;
        if (data['totalSubmissions'] is List && (data['totalSubmissions'] as List).isNotEmpty) {
          totalSub = data['totalSubmissions'][0]['submissions'] as int? ?? 1961;
        }

        Map<int, int> calendar = {};
        if (data['submissionCalendar'] is Map) {
          (data['submissionCalendar'] as Map).forEach((k, v) {
            final ts = int.tryParse(k.toString());
            final count = int.tryParse(v.toString()) ?? 0;
            if (ts != null) {
              calendar[ts] = count;
            }
          });
        }

        statsNotifier.value = statsNotifier.value.copyWith(
          totalSolved: totalSolved,
          totalQuestions: totalQuestions,
          easySolved: easySolved,
          totalEasy: totalEasy,
          mediumSolved: mediumSolved,
          totalMedium: totalMedium,
          hardSolved: hardSolved,
          totalHard: totalHard,
          ranking: ranking,
          totalSubmissions: totalSub,
          rawSubmissionCalendar: calendar.isNotEmpty ? calendar : statsNotifier.value.rawSubmissionCalendar,
        );
      }
    } catch (_) {}
  }

  Future<void> _fetchLeetCodeContest() async {
    try {
      final res = await http
          .get(Uri.parse('https://alfa-leetcode-api.onrender.com/userContestRankingInfo/its_kartike'))
          .timeout(const Duration(seconds: 7));

      if (res.statusCode == 200) {
        final data = jsonDecode(res.body);
        if (data['userContestRanking'] != null) {
          final rating = (data['userContestRanking']['rating'] as num?)?.toDouble() ?? 1829.0;
          final topPct = (data['userContestRanking']['topPercentage'] as num?)?.toDouble() ?? 7.16;
          final badge = data['userContestRanking']['badge']?['name'] as String? ?? "Knight";

          statsNotifier.value = statsNotifier.value.copyWith(
            contestRating: rating,
            contestRank: "Top ${topPct.toStringAsFixed(2)}% ($badge)",
          );
        }
      }
    } catch (_) {}
  }

  Future<void> _fetchGitHubUser() async {
    try {
      final res = await http
          .get(Uri.parse('https://api.github.com/users/itskartike910'))
          .timeout(const Duration(seconds: 6));

      if (res.statusCode == 200) {
        final data = jsonDecode(res.body);
        final publicRepos = data['public_repos'] as int? ?? 17;
        final followers = data['followers'] as int? ?? 8;
        final login = data['login'] as String? ?? "itskartike910";

        statsNotifier.value = statsNotifier.value.copyWith(
          publicRepos: publicRepos,
          followers: followers,
          githubUsername: login,
        );
      }
    } catch (_) {}
  }

  Future<void> _fetchGitHubRepos() async {
    try {
      final res = await http
          .get(Uri.parse('https://api.github.com/users/itskartike910/repos?per_page=100'))
          .timeout(const Duration(seconds: 6));

      if (res.statusCode == 200) {
        final List repos = jsonDecode(res.body);
        Map<String, int> langCounts = {};

        for (var r in repos) {
          final lang = r['language'] as String?;
          if (lang != null && lang.isNotEmpty) {
            langCounts[lang] = (langCounts[lang] ?? 0) + 1;
          }
        }

        if (langCounts.isNotEmpty) {
          final total = langCounts.values.fold(0, (a, b) => a + b);
          final sorted = langCounts.entries.toList()
            ..sort((a, b) => b.value.compareTo(a.value));

          final Map<String, Color> langColors = {
            "Dart": const Color(0xFF00D9FF),
            "JavaScript": const Color(0xFFFFD43B),
            "C++": const Color(0xFFFF375F),
            "Python": const Color(0xFF3776AB),
            "TypeScript": const Color(0xFF3178C6),
            "HTML": const Color(0xFFE34F26),
            "CSS": const Color(0xFF1572B6),
            "C": const Color(0xFF555555),
          };

          List<Map<String, dynamic>> computed = [];
          for (var i = 0; i < sorted.length && i < 4; i++) {
            final entry = sorted[i];
            final frac = entry.value / total;
            final pct = "${(frac * 100).round()}%";
            final color = langColors[entry.key] ?? const Color(0xFF9D4EDD);
            computed.add({
              "name": entry.key,
              "pct": pct,
              "color": color,
              "val": frac,
            });
          }

          if (computed.isNotEmpty) {
            statsNotifier.value = statsNotifier.value.copyWith(
              topLanguagesByRepo: computed,
            );
          }
        }
      }
    } catch (_) {}
  }
}
