import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:shamsoon/features/community/data/models/post.dart';
import '../../../../core/helpers/navigation.dart';
import '../../../../core/shared/cubits/user_cubit/user_cubit.dart';
import '../../../../core/widgets/app_text.dart';
import '../../../../core/widgets/buttons/loading_button.dart';
import '../../../../core/widgets/custom_dialog.dart';
import '../../../../core/widgets/text_fields/default_text_field.dart';
import '../../../../generated/assets.dart';
import '../../data/models/comments.dart';
import '../comments_cubit/comments_cubit.dart';

class CommentWidget extends StatefulWidget {
  final Post post;
  final List<PostComment> comments;
  final int index;
  const CommentWidget({super.key,
    required this.post,
    required this.comments,
    required this.index
  });

  @override
  State<CommentWidget> createState() => _CommentWidgetState();
}

class _CommentWidgetState extends State<CommentWidget> {
  bool editMode = false;

  final contentField = TextEditingController();

  void enableEditMode(){
    contentField.text = widget.comments[widget.index].content?? '';
    setState(() => editMode = true);
  }

  void disableEditMode(){
    setState(() => editMode = false);
  }

  void _showMenu(BuildContext context,{
    required List<PostComment> data,
    required int index
  }) {
    // Get the position and size of the widget (post container)
    final RenderBox renderBox =
    context.findRenderObject() as RenderBox;
    final position = renderBox.localToGlobal(Offset.zero);
    final size = renderBox.size;

    showMenu(
      context: context,
      // Position the menu to the right of the post
      position: RelativeRect.fromLTRB(
        position.dx + size.width - 100,
        // Align to the right of the post (adjust 100 for menu width)
        position.dy, // Align with the top of the post
        position.dx + size.width, // Right boundary
        position.dy + 1, // Bottom boundary (small offset)
      ),
      elevation: 4,
      // Shadow elevation for depth
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8), // Rounded corners
      ),
      color: Colors.white,
      // Background color of the menu
      items: [
        PopupMenuItem(
          value: 'edit',
          onTap: () => enableEditMode(),
          child: const Row(
            children: [
              Icon(Icons.edit, size: 20, color: Colors.black54), // Pencil icon
              SizedBox(width: 8),
              Text('Edit', style: TextStyle(color: Colors.black)),
            ],
          ),
        ),
        PopupMenuItem(
          value: 'delete',
          onTap: () => _showDialog(
              context,
              data: data,
              index: index
          ),
          child: const Row(
            children: [
              Icon(Icons.delete, size: 20, color: Colors.black54), // Trash icon
              SizedBox(width: 8),
              Text('Delete', style: TextStyle(color: Colors.black)),
            ],
          ),
        ),
      ],
    );
  }

  void _showDialog(BuildContext context, {
    required List<PostComment> data,
    required int index
  }){
    showCustomDialog(context, child: Column(
      spacing: 10.h,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox.square(
            dimension: 80.r,
            child: Lottie.asset(Assets.lottieApiError)),
        AppText('Delete your comment?', fontSize: 14.sp, fontWeight: FontWeight.bold),
        Row(
          children: [
            Expanded(
                child: LoadingButton(
                    onTap: ()async {
                      await context.read<CommentsCubit>().deleteComment(
                          index: index,
                          comment: data[index]
                      );
                      Go.back();
                    },
                    color: Colors.red,
                    title: 'Yes, Delete'
                )
            ),
            Expanded(
                child: LoadingButton(
                    onTap: () => Navigator.pop(context),
                    title: 'Cancel'
                )
            )
          ],
        )
      ],
    ));
  }

  Future<void> executeUpdateProcess(BuildContext context)async{
    disableEditMode();
    context.read<CommentsCubit>().updateComment(
        index: widget.index,
        comment: widget.comments[widget.index],
        newComment: contentField.text
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
      elevation: 1,
      child: Padding(
        padding: EdgeInsets.all(10.w),
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: const AssetImage('assets/images/logo.png'),
            radius: 20.r,
          ),
          title: Text(
            widget.post.user?.name ?? 'no name',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14.sp,
            ),
          ),
          subtitle: editMode? DefaultTextField(
            controller: contentField,
            onChanged: (value) => setState(() => contentField.text = value!),
            suffixIcon: contentField.text == widget.comments[widget.index].content ?
            IconButton(onPressed: () => disableEditMode(), icon: const Icon(Icons.close)) :
            IconButton(onPressed: () => executeUpdateProcess(context), icon: const Icon(Icons.done)),
          ) : Text(
            widget.comments[widget.index].content?? 'no content',
            style: TextStyle(fontSize: 12.sp),
          ),
          trailing: IconButton(
              onPressed: () => _showMenu(context, data: widget.comments, index: widget.index),
              icon: const Icon(Icons.more_vert)
          ),
          // trailing:  context.read<UserCubit>().user.id == widget.post.userId? IconButton(
          //     onPressed: () => _showMenu(context, data: widget.comments, index: widget.index),
          //     icon: const Icon(Icons.more_vert)
          // ) : null,
        ),
      ),
    );
  }
}
