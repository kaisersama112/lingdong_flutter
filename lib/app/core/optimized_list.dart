import 'package:flutter/material.dart';

// 优化的列表组件
class OptimizedListView<T> extends StatelessWidget {
  final List<T> items;
  final Widget Function(BuildContext context, T item, int index) itemBuilder;
  final EdgeInsetsGeometry? padding;
  final ScrollController? controller;
  final bool shrinkWrap;
  final ScrollPhysics? physics;
  final int? itemCount;
  final Widget? separator;
  final bool addAutomaticKeepAlives;
  final bool addRepaintBoundaries;
  final bool addSemanticIndexes;

  const OptimizedListView({
    super.key,
    required this.items,
    required this.itemBuilder,
    this.padding,
    this.controller,
    this.shrinkWrap = false,
    this.physics,
    this.itemCount,
    this.separator,
    this.addAutomaticKeepAlives = true,
    this.addRepaintBoundaries = true,
    this.addSemanticIndexes = true,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: padding,
      controller: controller,
      shrinkWrap: shrinkWrap,
      physics: physics,
      itemCount: itemCount ?? items.length,
      addAutomaticKeepAlives: addAutomaticKeepAlives,
      addRepaintBoundaries: addRepaintBoundaries,
      addSemanticIndexes: addSemanticIndexes,
      separatorBuilder: (context, index) => separator ?? const SizedBox.shrink(),
      itemBuilder: (context, index) {
        final item = items[index];
        return RepaintBoundary(
          child: itemBuilder(context, item, index),
        );
      },
    );
  }
}

// 优化的网格列表组件
class OptimizedGridView<T> extends StatelessWidget {
  final List<T> items;
  final Widget Function(BuildContext context, T item, int index) itemBuilder;
  final SliverGridDelegate gridDelegate;
  final EdgeInsetsGeometry? padding;
  final ScrollController? controller;
  final bool shrinkWrap;
  final ScrollPhysics? physics;
  final int? itemCount;
  final bool addAutomaticKeepAlives;
  final bool addRepaintBoundaries;
  final bool addSemanticIndexes;

  const OptimizedGridView({
    super.key,
    required this.items,
    required this.itemBuilder,
    required this.gridDelegate,
    this.padding,
    this.controller,
    this.shrinkWrap = false,
    this.physics,
    this.itemCount,
    this.addAutomaticKeepAlives = true,
    this.addRepaintBoundaries = true,
    this.addSemanticIndexes = true,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: padding,
      controller: controller,
      shrinkWrap: shrinkWrap,
      physics: physics,
      gridDelegate: gridDelegate,
      itemCount: itemCount ?? items.length,
      addAutomaticKeepAlives: addAutomaticKeepAlives,
      addRepaintBoundaries: addRepaintBoundaries,
      addSemanticIndexes: addSemanticIndexes,
      itemBuilder: (context, index) {
        final item = items[index];
        return RepaintBoundary(
          child: itemBuilder(context, item, index),
        );
      },
    );
  }
}

// 分页列表组件
class PaginatedListView<T> extends StatefulWidget {
  final Future<List<T>> Function(int page, int pageSize) loadData;
  final Widget Function(BuildContext context, T item, int index) itemBuilder;
  final int pageSize;
  final EdgeInsetsGeometry? padding;
  final ScrollController? controller;
  final bool shrinkWrap;
  final ScrollPhysics? physics;
  final Widget? separator;
  final Widget? loadingWidget;
  final Widget? errorWidget;
  final Widget? emptyWidget;

  const PaginatedListView({
    super.key,
    required this.loadData,
    required this.itemBuilder,
    this.pageSize = 20,
    this.padding,
    this.controller,
    this.shrinkWrap = false,
    this.physics,
    this.separator,
    this.loadingWidget,
    this.errorWidget,
    this.emptyWidget,
  });

  @override
  State<PaginatedListView<T>> createState() => _PaginatedListViewState<T>();
}

class _PaginatedListViewState<T> extends State<PaginatedListView<T>> {
  final List<T> _items = [];
  final ScrollController _scrollController = ScrollController();
  bool _isLoading = false;
  bool _hasError = false;
  bool _hasMore = true;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _loadData();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >= 
        _scrollController.position.maxScrollExtent - 200) {
      _loadMore();
    }
  }

  Future<void> _loadData() async {
    if (_isLoading) return;

    setState(() {
      _isLoading = true;
      _hasError = false;
    });

    try {
      final newItems = await widget.loadData(0, widget.pageSize);
      setState(() {
        _items.clear();
        _items.addAll(newItems);
        _currentPage = 0;
        _hasMore = newItems.length >= widget.pageSize;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _hasError = true;
        _isLoading = false;
      });
    }
  }

  Future<void> _loadMore() async {
    if (_isLoading || !_hasMore) return;

    setState(() {
      _isLoading = true;
    });

    try {
      final newItems = await widget.loadData(_currentPage + 1, widget.pageSize);
      setState(() {
        _items.addAll(newItems);
        _currentPage++;
        _hasMore = newItems.length >= widget.pageSize;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _refresh() async {
    await _loadData();
  }

  @override
  Widget build(BuildContext context) {
    if (_hasError && _items.isEmpty) {
      return widget.errorWidget ?? 
        const Center(child: Text('加载失败，请重试'));
    }

    if (_items.isEmpty && !_isLoading) {
      return widget.emptyWidget ?? 
        const Center(child: Text('暂无数据'));
    }

    return RefreshIndicator(
      onRefresh: _refresh,
      child: OptimizedListView<T>(
        items: _items,
        itemBuilder: widget.itemBuilder,
        padding: widget.padding,
        controller: widget.controller ?? _scrollController,
        shrinkWrap: widget.shrinkWrap,
        physics: widget.physics,
        separator: widget.separator,
      ),
    );
  }
}

// 虚拟化列表组件（用于大量数据）
class VirtualizedListView<T> extends StatelessWidget {
  final List<T> items;
  final Widget Function(BuildContext context, T item, int index) itemBuilder;
  final double itemHeight;
  final EdgeInsetsGeometry? padding;
  final ScrollController? controller;
  final bool shrinkWrap;
  final ScrollPhysics? physics;

  const VirtualizedListView({
    super.key,
    required this.items,
    required this.itemBuilder,
    required this.itemHeight,
    this.padding,
    this.controller,
    this.shrinkWrap = false,
    this.physics,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: padding,
      controller: controller,
      shrinkWrap: shrinkWrap,
      physics: physics,
      itemCount: items.length,
      itemExtent: itemHeight, // 固定高度，提升性能
      itemBuilder: (context, index) {
        final item = items[index];
        return RepaintBoundary(
          child: itemBuilder(context, item, index),
        );
      },
    );
  }
}
