import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/common_size.dart';
import 'package:instagram_clone/constants/screen_size.dart';

class ProfileBody extends StatefulWidget {
  @override
  _ProfileBodyState createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  SelectedTab _selectedTab = SelectedTab.left;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate([
              _username(),
              _userBio(),
              _editProfileBtn(),
              _tapButtons(),
              _selectedIndicator(),
            ]),
          ),
          _imagePager(),
        ],
      ),
    );
  }

  SliverToBoxAdapter _imagePager() {
    return SliverToBoxAdapter(
          child: GridView.count(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            crossAxisCount: 3,
            childAspectRatio: 1,
            // children: List.generate(
            //     30,
            //     (index) => CachedNetworkImage(
            //       fit: BoxFit.cover,
            //         imageUrl: 'https://picsum.photos/id/$index/200/200',
            //     )),
          ),
        );
  }

  Widget _selectedIndicator() {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      alignment: _selectedTab == SelectedTab.left
          ? Alignment.centerLeft
          : Alignment.centerRight,
      child: Container(
        height: 3,
        width: size.width / 2,
        color: Colors.black87,
      ),
      curve: Curves.fastOutSlowIn,
    );
  }

  Row _tapButtons() {
    return Row(
      children: <Widget>[
        Expanded(
          child: IconButton(
            icon: Icon(
              Icons.grid_on_outlined,
              color: _selectedTab == SelectedTab.left
                  ? Colors.black
                  : Colors.black26,
            ),
            onPressed: () {
              setState(() {
                _selectedTab = SelectedTab.left;
              });
            },
          ),
        ),
        Expanded(
          child: IconButton(
            icon: Icon(
              Icons.account_box_outlined,
              color: _selectedTab == SelectedTab.left
                  ? Colors.black26
                  : Colors.black,
            ),
            onPressed: () {
              setState(() {
                _selectedTab = SelectedTab.right;
              });
            },
          ),
        ),
      ],
    );
  }

  Padding _editProfileBtn() {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: common_gap, vertical: common_xxs_gap),
      child: SizedBox(
        height: 24,
        child: OutlineButton(
          onPressed: () {},
          borderSide: BorderSide(color: Colors.black45),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text(
            'Edit Profile',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Widget _username() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: common_gap),
      child: Text(
        'username',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _userBio() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: common_gap),
      child: Text(
        'This is what I believe!!',
        style: TextStyle(fontWeight: FontWeight.w400),
      ),
    );
  }
}

enum SelectedTab { left, right }
