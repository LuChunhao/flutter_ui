import 'package:flutter/material.dart';
import 'package:flutter_ui/example/contactlist/contact_list_item.dart';
import 'package:flutter_ui/example/contactlist/modal/contact.dart';

class ContactsList extends StatelessWidget {
  final List<ContactModal> _contactModal;
  bool aaa = true;

  ContactsList(this._contactModal);

  void changeText() {}

  Widget getListView() {
    if (aaa) {
      return new ListView(
        padding: new EdgeInsets.symmetric(vertical: 8.0),
        children: _buildContactsList(),
      );
    } else {
      return new ListView.builder(
        padding: new EdgeInsets.symmetric(vertical: 8.0),
        itemCount: _contactModal == null ? 0 : _contactModal.length,
        itemBuilder: (BuildContext buildContext, int index) {
          if (index == 4) {
            return new GestureDetector(
              child: new Container(
                alignment: Alignment.center,
                height: 200,
                child: new Text(
                  "搞一个类型不一样的",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
                decoration: new BoxDecoration(
                    image: DecorationImage(
                        image: new AssetImage("images/luna.jpg"),
                        fit: BoxFit.cover)),
              ),
            );
          } else {
            return new GestureDetector(
              child: new ListTile(
                  leading: new CircleAvatar(
                      child:
                          new Text(_contactModal.elementAt(index).fullName[0])),
                  title: new Text(
                    _contactModal.elementAt(index).fullName,
                    style: TextStyle(fontSize: 16),
                  ),
                  subtitle: new Text(_contactModal.elementAt(index).email)),
              onTap: () {

              },
            );
          }
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return getListView();
  }

  List<ContactListItem> _buildContactsList() {
    return _contactModal
        .map((contact) => new ContactListItem(contact))
        .toList();
  }
}
