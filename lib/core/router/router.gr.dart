// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:coda/core/domain/entity/track_entity.dart' as _i8;
import 'package:coda/features/favorite/presentation/screens/favorite_screen.dart'
    as _i1;
import 'package:coda/features/home/screens/home_screen.dart' as _i2;
import 'package:coda/features/search/presentation/screens/search_screen.dart'
    as _i3;
import 'package:coda/features/settings/presentation/screens/settings_screen.dart'
    as _i4;
import 'package:coda/features/track_detail/presentation/screens/track_detail_screen.dart'
    as _i5;
import 'package:flutter/material.dart' as _i7;

/// generated route for
/// [_i1.FavoriteScreen]
class FavoriteRoute extends _i6.PageRouteInfo<void> {
  const FavoriteRoute({List<_i6.PageRouteInfo>? children})
    : super(FavoriteRoute.name, initialChildren: children);

  static const String name = 'FavoriteRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i1.FavoriteScreen();
    },
  );
}

/// generated route for
/// [_i2.HomeScreen]
class HomeRoute extends _i6.PageRouteInfo<void> {
  const HomeRoute({List<_i6.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i2.HomeScreen();
    },
  );
}

/// generated route for
/// [_i3.SearchScreen]
class SearchRoute extends _i6.PageRouteInfo<void> {
  const SearchRoute({List<_i6.PageRouteInfo>? children})
    : super(SearchRoute.name, initialChildren: children);

  static const String name = 'SearchRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i3.SearchScreen();
    },
  );
}

/// generated route for
/// [_i4.SettingsScreen]
class SettingsRoute extends _i6.PageRouteInfo<void> {
  const SettingsRoute({List<_i6.PageRouteInfo>? children})
    : super(SettingsRoute.name, initialChildren: children);

  static const String name = 'SettingsRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i4.SettingsScreen();
    },
  );
}

/// generated route for
/// [_i5.TrackDetailScreen]
class TrackDetailRoute extends _i6.PageRouteInfo<TrackDetailRouteArgs> {
  TrackDetailRoute({
    _i7.Key? key,
    required _i8.TrackEntity track,
    List<_i6.PageRouteInfo>? children,
  }) : super(
         TrackDetailRoute.name,
         args: TrackDetailRouteArgs(key: key, track: track),
         initialChildren: children,
       );

  static const String name = 'TrackDetailRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<TrackDetailRouteArgs>();
      return _i5.TrackDetailScreen(key: args.key, track: args.track);
    },
  );
}

class TrackDetailRouteArgs {
  const TrackDetailRouteArgs({this.key, required this.track});

  final _i7.Key? key;

  final _i8.TrackEntity track;

  @override
  String toString() {
    return 'TrackDetailRouteArgs{key: $key, track: $track}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! TrackDetailRouteArgs) return false;
    return key == other.key && track == other.track;
  }

  @override
  int get hashCode => key.hashCode ^ track.hashCode;
}
