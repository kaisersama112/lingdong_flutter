import 'package:flutter/material.dart';

/// 优化的网络图片组件
/// 自动设置合适的缓存尺寸以避免内存浪费
class OptimizedNetworkImage extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit fit;
  final Widget? placeholder;
  final Widget Function(BuildContext, Object, StackTrace?)? errorBuilder;
  final BorderRadius? borderRadius;
  final bool isCircular;

  const OptimizedNetworkImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.placeholder,
    this.errorBuilder,
    this.borderRadius,
    this.isCircular = false,
  });

  @override
  Widget build(BuildContext context) {
    final devicePixelRatio = MediaQuery.of(context).devicePixelRatio;

    // 计算缓存尺寸
    int? cacheWidth;
    int? cacheHeight;

    if (width != null) {
      cacheWidth = (width! * devicePixelRatio).round();
    }
    if (height != null) {
      cacheHeight = (height! * devicePixelRatio).round();
    }

    Widget image = Image.network(
      imageUrl,
      width: width,
      height: height,
      fit: fit,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return placeholder ??
            Container(
              width: width,
              height: height,
              color: Colors.grey[200],
              child: const Center(child: CircularProgressIndicator()),
            );
      },
      errorBuilder:
          errorBuilder ??
          (context, error, stackTrace) {
            return Container(
              width: width,
              height: height,
              color: Colors.grey[200],
              child: const Icon(Icons.broken_image, color: Colors.grey),
            );
          },
    );

    // 应用形状
    if (isCircular) {
      image = ClipOval(child: image);
    } else if (borderRadius != null) {
      image = ClipRRect(borderRadius: borderRadius!, child: image);
    }

    return image;
  }
}

/// 优化的头像组件
class OptimizedAvatar extends StatelessWidget {
  final String imageUrl;
  final double size;
  final Color? backgroundColor;
  final Widget? fallback;

  const OptimizedAvatar({
    super.key,
    required this.imageUrl,
    required this.size,
    this.backgroundColor,
    this.fallback,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: backgroundColor != null
          ? BoxDecoration(color: backgroundColor, shape: BoxShape.circle)
          : null,
      child: OptimizedNetworkImage(
        imageUrl: imageUrl,
        width: size,
        height: size,
        isCircular: true,
        errorBuilder: (context, error, stackTrace) {
          return fallback ??
              Icon(Icons.person, size: size * 0.6, color: Colors.grey);
        },
      ),
    );
  }
}

/// 优化的缩略图组件
class OptimizedThumbnail extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit fit;
  final BorderRadius? borderRadius;

  const OptimizedThumbnail({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return OptimizedNetworkImage(
      imageUrl: imageUrl,
      width: width,
      height: height,
      fit: fit,
      borderRadius: borderRadius,
      placeholder: Container(
        width: width,
        height: height,
        color: Colors.grey[200],
        child: const Center(
          child: SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(strokeWidth: 2),
          ),
        ),
      ),
    );
  }
}
