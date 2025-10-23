import 'package:flutter/material.dart';

class CustomPagination<T> extends StatefulWidget {
  const CustomPagination({
    super.key,
    required this.isLoading,
    required this.isThereMoreItems,
    required this.onLoadMoreData,
    required this.items,
    required this.emptyWidget,
    this.crossAxisCount = 1,
    this.childAspectRatio = 1.0,
    required this.itemBuilder,
    this.skeletonizerBuilder,
    this.skeletonizerCount = 3, required this.scrollController,
  });
  final ScrollController scrollController;
  final bool isLoading;
  final bool isThereMoreItems;
  final VoidCallback onLoadMoreData;
  final List<T> items;
  final Widget emptyWidget;
  final int crossAxisCount;
  final double childAspectRatio;
  final Widget Function(T item) itemBuilder;
  final Widget Function()? skeletonizerBuilder;
  final int skeletonizerCount;
  @override
  State<CustomPagination<T>> createState() => _CustomPaginationState<T>();
}

class _CustomPaginationState<T> extends State<CustomPagination<T>> {
  late ScrollController _scrollController ;

  @override
  void initState() {
    _scrollController = widget.scrollController ;
    _scrollController.addListener(onScroll);
    super.initState();
  }

  void onScroll() {
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - 200 
            // &&widget.isThereMoreItems &&!widget.isLoading  // i handle this in cubit
            ) {
      widget.onLoadMoreData();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    if (widget.items.isEmpty && !widget.isThereMoreItems) {
      return widget.emptyWidget;
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients &&
          _scrollController.position.maxScrollExtent == 0 
          // && widget.isThereMoreItems && !widget.isLoading   // i handle this in cubit
          ) {
        widget.onLoadMoreData();
      }
    });
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: GridView.builder(
        controller: _scrollController,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 400,
          mainAxisExtent: 350,
          crossAxisCount: widget.crossAxisCount, // number of columns
          crossAxisSpacing: 10,
          mainAxisSpacing: 24,
          childAspectRatio: widget.childAspectRatio,
        ),
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: widget.items.length +
            (widget.isThereMoreItems
                ? 
                (widget.skeletonizerBuilder != null
                    ? widget.skeletonizerCount
                    : 1)
                : 0),
        itemBuilder: (context, index) {
          if (index < widget.items.length) {
            return widget.itemBuilder(widget.items[index]);
            // return TaskItem(taskModel: tasksListAccordingToFilter[index]);
          } else {
            if (widget.skeletonizerBuilder != null) {
              return widget.skeletonizerBuilder!();
            } else {
              return const Padding(
                padding: EdgeInsets.all(16.0),
                child: Center(child: CircularProgressIndicator()),
              );
            }
          }
        },
      ),
    );
  }
}
