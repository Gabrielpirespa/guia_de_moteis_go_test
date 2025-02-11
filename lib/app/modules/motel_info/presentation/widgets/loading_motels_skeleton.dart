import 'package:flutter/material.dart';
import 'package:guia_de_moteis_application/app/core/widgets/skeleton_container.dart';

class LoadingMotelsSkeleton extends StatefulWidget {
  const LoadingMotelsSkeleton({super.key});

  @override
  State<LoadingMotelsSkeleton> createState() => _LoadingMotelsSkeletonState();
}

class _LoadingMotelsSkeletonState extends State<LoadingMotelsSkeleton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 18.0,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 15,
            ),
            child: SkeletonContainer(
              height: 71,
              width: double.infinity,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          SkeletonContainer(
            height: 280,
            width: double.infinity,
            borderRadius: BorderRadius.circular(10),
          ),
          const SizedBox(
            height: 6,
          ),
          SkeletonContainer(
            height: 71,
            width: double.infinity,
            borderRadius: BorderRadius.circular(10),
          ),
          const SizedBox(
            height: 6,
          ),
          SkeletonContainer(
            height: 90,
            width: double.infinity,
            borderRadius: BorderRadius.circular(10),
          ),
          const SizedBox(
            height: 6,
          ),
          SkeletonContainer(
            height: 90,
            width: double.infinity,
            borderRadius: BorderRadius.circular(10),
          ),
        ],
      ),
    );
  }
}
