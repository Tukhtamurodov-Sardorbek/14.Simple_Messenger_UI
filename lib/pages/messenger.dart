import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:glassmorphism/glassmorphism.dart';

import '../models/user_model.dart';

class FacebookMessenger extends StatefulWidget {
  const FacebookMessenger({Key? key}) : super(key: key);
  static const String id = 'facebook_messenger';

  @override
  _FacebookMessengerState createState() => _FacebookMessengerState();
}

class _FacebookMessengerState extends State<FacebookMessenger> {
  int number = 2;
  bool isNotMobile = false;

  final List<User> _users = [
    User(
        name: 'Your Story',
        profilePhoto: 'assets/messenger/Icon.png',
        message: '',
        day: '',
        isOnline: false,
        isRead: false),
    User(
        name: 'Joshua',
        profilePhoto: 'assets/messenger/boy1.jpg',
        message: 'You know every trick to make me smile and every magic to make my sadness disappear. Your kind of friend is so rare because you are the most precious gem in the world!',
        day: ' · Fri',
        isOnline: true,
        isRead: true),
    User(
        name: 'Martin',
        profilePhoto: 'assets/messenger/boy2.jpg',
        message: 'The business plan loo…',
        day: ' · Thu',
        isOnline: true,
        isRead: false),
    User(
        name: 'Karen',
        profilePhoto: 'assets/messenger/girl4.jpg',
        message: 'You: Ok, See you in To',
        day: ' · Fri',
        isOnline: true,
        isRead: true),
    User(
        name: 'Sarah',
        profilePhoto: 'assets/messenger/girl5.jpg',
        message: 'Make design process easier',
        day: ' · Thu',
        isOnline: true,
        isRead: false),
    User(
        name: 'John',
        profilePhoto: 'assets/messenger/boy3.jpg',
        message: 'You: Ok, thanks!',
        day: ' · Wed',
        isOnline: false,
        isRead: true),
    User(
        name: 'Selena',
        profilePhoto: 'assets/messenger/girl3.jpg',
        message: 'Are you serious, right now?!',
        day: ' · Thu',
        isOnline: false,
        isRead: false),
    User(
        name: 'Tom',
        profilePhoto: 'assets/messenger/boy4.jpg',
        message: 'We\'re planning to have a party',
        day: ' · Mon',
        isOnline: false,
        isRead: false),
    User(
        name: 'Alexandra',
        profilePhoto: 'assets/messenger/girl2.jpg',
        message: 'You: Still working on it',
        day: ' · Tue',
        isOnline: false,
        isRead: true),
    User(
        name: 'Jack',
        profilePhoto: 'assets/messenger/boy5.jpg',
        message: 'You: Anyways, you have to deal with it',
        day: ' · Wed',
        isOnline: false,
        isRead: true),
    User(
        name: 'Jane',
        profilePhoto: 'assets/messenger/girl1.jpg',
        message: 'Oh, it was really amazing',
        day: ' · Thu',
        isOnline: false,
        isRead: false),
  ];
  Advertisment ad = Advertisment(name: 'Pixsellz', profilePhoto: 'assets/messenger/img.png', message: 'Make design process easier with pixsellz');

  // void doNothing(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    if(MediaQuery.of(context).size.shortestSide > 600 ) {
      isNotMobile = true;
    }
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
          child: const Padding(
            padding: EdgeInsets.only(left: 10, top: 2, bottom: 2),
            child: CircleAvatar(
              foregroundImage: AssetImage('assets/messenger/profile.jpg'),
            ),
          ),
          onTap: () {},
        ),
        title: const Text(
          'Chats',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon:
            const Image(image: AssetImage('assets/messenger/Icon (1).png')),
            onPressed: () {},
          ),
          IconButton(
            icon:
            const Image(image: AssetImage('assets/messenger/Icon (2).png')),
            onPressed: () {},
          )
        ],
      ),
      body: ListView(
        children: [
          /// Search Box
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[200],
                prefixIcon: const Icon(Icons.search),
                hintText: 'Search',
                contentPadding: const EdgeInsets.all(0),
                border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),

                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.transparent),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.transparent),
                ),
              ),
            ),
          ),
          /// Stories
          SizedBox(
            height: 106,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _users.length,
              itemBuilder: (BuildContext context, int index) {
                return story(_users[index]);
              },
            ),
          ),
          /// Space
          const SizedBox(height: 10),
          /// Messages List
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _users.length,
            itemBuilder: (BuildContext context, int index){
              return index > 5 && index % 6 == 0 ? advertisment(ad) : slidableList(_users[index]);
            },
          ),
          // Container(
          //   height: MediaQuery.of(context).size.height,
          //   child: ListView(
          //     children: [
          //       Slidable(
          //         // Specify a key if the Slidable is dismissible.
          //         key: const ValueKey(0),
          //         // The start action pane is the one at the left or the top side.
          //         startActionPane: ActionPane(
          //           // A motion is a widget used to control how the pane animates.
          //           motion: const ScrollMotion(),
          //           // A pane can dismiss the Slidable.
          //           dismissible: DismissiblePane(onDismissed: () {}),
          //
          //           // All actions are defined in the children parameter.
          //           children: [
          //             // A SlidableAction can have an icon and/or a label.
          //             SlidableAction(
          //               onPressed: (context){doNothing(context);},
          //               backgroundColor: Color(0xFFFE4A49),
          //               foregroundColor: Colors.white,
          //               icon: Icons.delete,
          //               label: 'Delete',
          //             ),
          //             SlidableAction(
          //               onPressed: doNothing,
          //               backgroundColor: Color(0xFF21B7CA),
          //               foregroundColor: Colors.white,
          //               icon: Icons.share,
          //               label: 'Share',
          //             ),
          //           ],
          //         ),
          //
          //         // The end action pane is the one at the right or the bottom side.
          //         endActionPane: ActionPane(
          //           motion: ScrollMotion(),
          //           children: [
          //             SlidableAction(
          //               // An action can be bigger than the others.
          //               flex: 2,
          //               onPressed: (context){doNothing(context);},
          //               backgroundColor: Color(0xFF7BC043),
          //               foregroundColor: Colors.white,
          //               icon: Icons.archive,
          //               label: 'Archive',
          //             ),
          //             SlidableAction(
          //               onPressed: doNothing,
          //               backgroundColor: Color(0xFF0392CF),
          //               foregroundColor: Colors.white,
          //               icon: Icons.save,
          //               label: 'Save',
          //             ),
          //           ],
          //         ),
          //
          //         // The child of the Slidable is what the user sees when the
          //         // component is not dragged.
          //         child: const ListTile(title: Text('Slide me')),
          //       ),
          //       Slidable(
          //         // Specify a key if the Slidable is dismissible.
          //         key: const ValueKey(1),
          //
          //         // The start action pane is the one at the left or the top side.
          //         startActionPane: ActionPane(
          //           // A motion is a widget used to control how the pane animates.
          //           motion: ScrollMotion(),
          //
          //           // All actions are defined in the children parameter.
          //           children: [
          //             // A SlidableAction can have an icon and/or a label.
          //             SlidableAction(
          //               onPressed: (context){doNothing(context);},
          //               backgroundColor: Color(0xFFFE4A49),
          //               foregroundColor: Colors.white,
          //               icon: Icons.delete,
          //               label: 'Delete',
          //             ),
          //             SlidableAction(
          //               onPressed: doNothing,
          //               backgroundColor: Color(0xFF21B7CA),
          //               foregroundColor: Colors.white,
          //               icon: Icons.share,
          //               label: 'Share',
          //             ),
          //           ],
          //         ),
          //
          //         // The end action pane is the one at the right or the bottom side.
          //         endActionPane: ActionPane(
          //           motion: const ScrollMotion(),
          //           dismissible: DismissiblePane(onDismissed: () {}),
          //           children: [
          //             SlidableAction(
          //               // An action can be bigger than the others.
          //               flex: 2,
          //               onPressed: (context){doNothing(context);},
          //               backgroundColor: Color(0xFF7BC043),
          //               foregroundColor: Colors.white,
          //               icon: Icons.archive,
          //               label: 'Archive',
          //             ),
          //             SlidableAction(
          //               onPressed: doNothing,
          //               backgroundColor: Color(0xFF0392CF),
          //               foregroundColor: Colors.white,
          //               icon: Icons.save,
          //               label: 'Save',
          //             ),
          //           ],
          //         ),
          //
          //         // The child of the Slidable is what the user sees when the
          //         // component is not dragged.
          //         child: const ListTile(title: Text('Slide me')),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
      bottomNavigationBar: GlassmorphicContainer(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width * 0.14,
          borderRadius: 20,
          blur: 20,
          alignment: Alignment.bottomCenter,
          border: 2,
          linearGradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                const Color(0xFFffffff).withOpacity(0.1),
                const Color(0xFFFFFFFF).withOpacity(0.05),
              ],
              stops: const [0.1, 1,]),
          borderGradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color(0xFFffffff).withOpacity(0.5),
              const Color((0xFFFFFFFF)).withOpacity(0.5),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: const Icon(CupertinoIcons.chat_bubble_fill, size: 30),
                onPressed: (){},
              ),
              GestureDetector(
                child: SizedBox(
                  height: 35,
                  width: 35,
                  child: Stack(
                    children: [
                      const Center(child: Icon(Icons.people, color: Colors.grey, size: 30)),
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          height: 15,
                          width: 15,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.green[100],
                          ),
                          child: Center(child: Text(number.toString(), style: const TextStyle(color: CupertinoColors.systemGreen, fontSize: 12, fontWeight: FontWeight.bold))),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(CupertinoIcons.compass_fill, color: Colors.grey, size: 30),
                onPressed: (){},
              )
            ],
          )
      ),
    );
  }

  Widget story(User user) {
    return Column(
      children: [
        Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            height: 100,
            width: 80,
            // color: Colors.red,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(user.name == 'Your Story'
                            ? 'assets/messenger/Icon.png'
                            : user.profilePhoto),
                      )),
                  child: user.name != 'Your Story'
                      ? Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.bottomRight,
                    child: Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: user.isOnline ? CupertinoColors.systemGreen : CupertinoColors.systemGrey,
                        border:
                        Border.all(color: Colors.white, width: 3),
                      ),
                    ),
                  ) : const SizedBox.shrink(),
                ),
                // name == 'Your Story' ? Padding(
                //   padding: const EdgeInsets.only(top: 15),
                //   child: Image.asset(media, fit: BoxFit.cover),
                // ) : Image.asset(media, fit: BoxFit.cover),
                Text(
                  user.name,
                  style: const TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
                      fontWeight: FontWeight.w400),
                ),
                const SizedBox(height: 5)
              ],
            ))
      ],
    );
  }
  Widget listTileView(User user) {
    return user.name == 'Your Story'
        ? const SizedBox()
        : ListTile(
      leading: Container(
        height: 65,
        width: 65,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: CupertinoColors.systemBlue, width: 2),
        ),
        child: Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: CupertinoColors.white, width: 2),
                image: DecorationImage(
                  image: AssetImage(user.profilePhoto),
                  fit: BoxFit.cover,
                )),
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.bottomRight,
              child: Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: user.isOnline ? CupertinoColors.systemGreen : CupertinoColors.systemGrey,
                  border:
                  Border.all(color: Colors.white, width: 3),
                ),
              ),
            )
        ),
      ),
      title: Text(
        user.name,
        style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 3,
            child: Text(
              // user.message.toString().length > 3 ? user.message.toString().substring(0, user.message.toString().length - 3) : user.message,
              user.message,
              style: const TextStyle(fontSize: 18, color: Colors.grey),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Expanded(
            child: Text(
              user.day,
              style: const TextStyle(fontSize: 18, color: Colors.grey),
            ),
          ),
          // const Spacer(),
        ],
      ),
      trailing: user.message.startsWith('You:') ? user.isRead
          ? Image.asset('assets/messenger/Read (1).png')
          : Image.asset('assets/messenger/Read.png') : const SizedBox.shrink(),
    );
  }
  Widget advertisment(Advertisment ads) {
    return ListTile(
      // dense:true,
      isThreeLine: true,

      leading: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(ads.profilePhoto),
              fit: BoxFit.cover,
            )),
      ),
      title: Row(
        children: [
          Text(
            ads.name,
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(width: 10),
          Container(
              height: 20,
              width: 30,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Center(child: Text('Ad', style: TextStyle(color: Colors.white),))
          )
        ],
      ),
      subtitle:
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            ads.message,
            style: const TextStyle(fontSize: 18, color: Colors.grey),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            ads.viewMore,
            style: const TextStyle(fontSize: 18, color: CupertinoColors.systemBlue),
          ),
          // const Spacer(),
        ],
      ),
      trailing: Image.asset('assets/messenger/Rectangle.png'),
    );
  }
  Widget slidableList(User user){
    return Slidable(
      // The start action pane is the one at the left or the top side.
      startActionPane: ActionPane(
        // A motion is a widget used to control how the pane animates.
        motion: const ScrollMotion(),
        // A pane can dismiss the Slidable.
        // dismissible: DismissiblePane(onDismissed: () {}),

        // All actions are defined in the children parameter.
        children: [
          // A SlidableAction can have an icon and/or a label.
          // SlidableAction(
          //   onPressed: doNothing,
          //   backgroundColor: const Color(0xff0084fe),
          //   foregroundColor: Colors.white,
          //   icon: Icons.camera_alt,
          // ),
          // SlidableAction(
          //   onPressed: doNothing,
          //   backgroundColor: Colors.white,
          //   foregroundColor: Colors.black,
          //   icon: Icons.call,
          // ),
          // SlidableAction(
          //   onPressed: doNothing,
          //   backgroundColor: Colors.white,
          //   foregroundColor: Colors.black,
          //   icon: Icons.videocam,
          // ),
          GestureDetector(
            child: Container(
              height: 52,
              width: 68,
              decoration: const BoxDecoration(
                color: Color(0xff0084fe),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.camera_alt, color: Colors.white, size: 30),
            ),
            onTap: (){},
          ),
          GestureDetector(
            child: Container(
              height: 52,
              width: 55,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.videocam, color: Colors.black, size: 30),
            ),
            onTap: (){},
          ),
          GestureDetector(
            child: Container(
              height: 52,
              width: 55,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.call, color: Colors.black, size: 30),
            ),
            onTap: (){},
          ),
        ],
      ),
      // The end action pane is the one at the right or the bottom side.
      endActionPane: ActionPane(
        extentRatio: isNotMobile ? MediaQuery.of(context).size.aspectRatio * 0.9 : MediaQuery.of(context).size.aspectRatio * 0.93,
        motion: const ScrollMotion(),
        children: [
          // SlidableAction(
          //   // An action can be bigger than the others.
          //   onPressed: doNothing,
          //   backgroundColor: Colors.white,
          //   foregroundColor: Colors.black,
          //   icon: Icons.menu,
          // ),
          // SlidableAction(
          //   onPressed: doNothing,
          //   backgroundColor: Colors.white,
          //   foregroundColor: Colors.black,
          //   icon: Icons.notifications,
          //
          // ),
          GestureDetector(
            child: Container(
              height: 52,
              width: 55,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.menu, color: Colors.black, size: 30),
            ),
            onTap: (){},
          ),
          GestureDetector(
            child: Container(
              height: 52,
              width: 55,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.notifications, color: Colors.black, size: 30),
            ),
            onTap: (){},
          ),
          GestureDetector(
            child: Container(
              height: 52,
              width: 68,
              decoration: const BoxDecoration(
                color: Color(0xfffe294d),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.delete, color: Colors.white, size: 30),
            ),
            onTap: (){},
          ),
        ],
      ),
      // The child of the Slidable is what the user sees when the
      // component is not dragged.
      child: listTileView(user),
    );
  }
}
