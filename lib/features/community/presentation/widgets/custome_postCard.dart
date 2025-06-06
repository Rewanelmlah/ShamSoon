import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shamsoon/core/app_colors.dart';
import 'package:shamsoon/core/shared/cubits/user_cubit/user_cubit.dart';
import 'package:shamsoon/core/widgets/buttons/default_button.dart';
import 'package:shamsoon/core/widgets/buttons/loading_button.dart';
import 'package:shamsoon/core/widgets/text_fields/default_text_field.dart';
import 'package:shamsoon/features/community/data/models/post.dart';
import 'package:shamsoon/features/community/presentation/posts_cubit.dart';
import 'package:shamsoon/features/community/presentation/views/comments_screen.dart';
import 'package:shamsoon/features/community/presentation/widgets/Custome_likeButton.dart';

class PostCard extends StatefulWidget {
  final Post post;
  final int index;

  const PostCard({super.key, required this.post, required this.index});

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  bool editMode = false;

  void enableEditMode(){
    contentField.text = widget.post.content?? '';
    setState(() => editMode = true);
  }

  void disableEditMode(){
    setState(() => editMode = false);
  }

  final contentField = TextEditingController();

  void _showPostMenu(BuildContext context) {
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
          onTap: () => context.read<PostsCubit>().deletePost(widget.post, widget.index),
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

  void _completeEditing()async{
    disableEditMode();
    isChanged.value = false;
    await context.read<PostsCubit>().updatePost(
        post: widget.post,
        newTitle: 'new post',
        content: contentField.text,
        index: widget.index
    );

  }

  ValueNotifier<bool> isChanged = ValueNotifier(false);
  void _onChange(String value){
    if(contentField.text != widget.post.content){
      isChanged.value = true;
    }else{
      isChanged.value = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
      elevation: 3,
      shadowColor: Colors.grey.withOpacity(0.3),
      child: Padding(
        padding: EdgeInsets.all(10.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(2.w),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.primaryColor,
                      width: 2.w,
                    ),
                  ),
                  child: CircleAvatar(
                    radius: 24.r,
                    backgroundImage: const AssetImage('assets/images/logo.png'),
                  ),
                ),
                SizedBox(width: 10.w),
                if(!editMode)
                  Expanded(
                  child: Text(
                    widget.post.content??"",
                    style: TextStyle(fontSize: 16.sp,),
                  ),
                )
                else
                  Expanded(
                    child: Column(
                      children: [
                        DefaultTextField(
                          controller: contentField,
                          onChanged: (val) => _onChange(val!),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: ValueListenableBuilder(
                                valueListenable: isChanged,
                                builder: (context, value, child) => LoadingButton(
                                    title: 'Save',
                                    color: value? AppColors.primaryColor : Colors.grey,
                                    onTap: () => value? _completeEditing() : null
                                ),
                              ),
                            ),
                            Expanded(
                              child: SizedBox(
                                height: 40.h,
                                child: DefaultButton(
                                  title: 'Cancel',
                                  color: Colors.grey,
                                  onTap: () => disableEditMode(),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                if(context.read<UserCubit>().user.id == widget.post.userId)
                  IconButton(
                    onPressed: () => _showPostMenu(context),
                    icon: const Icon(Icons.more_vert),
                ),

                // IconButton(
                //   onPressed: () {
                //     log('current id : ${context.read<UserCubit>().user.id}');
                //     log('post id : ${widget.post.userId}');
                //   },
                //   icon: const Icon(Icons.more_vert),
                // ),
              ],
            ),
            SizedBox(height: 10.h),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CommentsScreen(post: widget.post)),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LikeButton(postId: widget.post.id ?? 0, likesCount: widget.post.likeCount ?? 0),
                  SizedBox(width: 25.w),
                  Icon(
                    Icons.comment_outlined,
                    size: 18.sp,
                    color: AppColors.primaryColor,
                  ),
                  SizedBox(width: 4.w),
                  Row(
                    children: [
                      Text('replies', style: TextStyle(fontSize: 14.sp)),
                      if(widget.post.comments!.isNotEmpty)
                        Text(' (${widget.post.comments!.length})', style: TextStyle(fontSize: 14.sp)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
