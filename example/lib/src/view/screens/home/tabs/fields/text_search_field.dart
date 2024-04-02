import 'package:adp_mobile/adp_mobile.dart';

class TextSearchFieldPreview extends StatelessWidget {
  const TextSearchFieldPreview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdaptiveScaffoldPage(
      appBar: const AdaptiveAppBarPage(),
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AdaptiveAutocompleteField<UserInfo>(
            onSelected: (value) {
              if (value.value != null) {
                showAdpDialog(
                  context: context,
                  builder: (context) {
                    return AdaptiveDialog(
                      title: Text(value.value!.name),
                      content: Text(value.value!.age.toString()),
                      actions: [
                        AdaptiveDialogAction(
                          child: const Text('Cancel'),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ],
                    );
                  },
                );
              }
            },
            options: contentList.map(
              (user) {
                return AdaptiveAutoCompleteItem(
                    value: user, searchKey: user.name);
              },
            ).toList(),
          ),
        ],
      ),
    );
  }

  List<UserInfo> get contentList {
    return const [
      UserInfo(name: 'Abbas Hussein', age: 19),
      UserInfo(name: 'John Doe', age: 30),
      UserInfo(name: 'Jane Smith', age: 25),
      UserInfo(name: 'Alice Johnson', age: 35),
      UserInfo(name: 'Bob Brown', age: 40),
      UserInfo(name: 'Eve White', age: 28),
      UserInfo(name: 'Michael Johnson', age: 45),
      UserInfo(name: 'Sarah Williams', age: 27),
      UserInfo(name: 'David Wilson', age: 32),
      UserInfo(name: 'Karen Martinez', age: 38),
      UserInfo(name: 'James Taylor', age: 33),
      UserInfo(name: 'Jennifer Anderson', age: 29),
      UserInfo(name: 'Daniel Thomas', age: 42),
      UserInfo(name: 'Linda Hernandez', age: 36),
      UserInfo(name: 'Matthew Moore', age: 31),
      UserInfo(name: 'Samantha Martin', age: 26),
      UserInfo(name: 'Christopher Lee', age: 41),
      UserInfo(name: 'Amanda King', age: 34),
      UserInfo(name: 'Joshua Perez', age: 39),
      UserInfo(name: 'Lauren Young', age: 28),
      UserInfo(name: 'Ryan Scott', age: 43),
      UserInfo(name: 'Ashley Green', age: 24),
      UserInfo(name: 'Andrew Evans', age: 37),
      UserInfo(name: 'Emily Turner', age: 30),
      UserInfo(name: 'Justin Reed', age: 35),
      UserInfo(name: 'Nicole Hall', age: 29),
      UserInfo(name: 'Brandon Diaz', age: 44),
      UserInfo(name: 'Kayla Clark', age: 25),
      UserInfo(name: 'Kevin Hill', age: 40),
      UserInfo(name: 'Taylor Adams', age: 31),
      UserInfo(name: 'Jacob Baker', age: 26),
      UserInfo(name: 'Megan Nelson', age: 32),
      UserInfo(name: 'William Carter', age: 41),
      UserInfo(name: 'Victoria Ramirez', age: 27),
      UserInfo(name: 'Nicholas Torres', age: 33),
      UserInfo(name: 'Christina Sanders', age: 42),
      UserInfo(name: 'Joseph Morris', age: 28),
      UserInfo(name: 'Stephanie Flores', age: 34),
      UserInfo(name: 'Tyler Collins', age: 43),
      UserInfo(name: 'Hannah Murphy', age: 23),
      UserInfo(name: 'Kyle Rivera', age: 39),
      UserInfo(name: 'Rebecca Bennett', age: 35),
      UserInfo(name: 'Benjamin Coleman', age: 30),
      UserInfo(name: 'Alexis Hughes', age: 36),
      UserInfo(name: 'Samuel Washington', age: 25),
      UserInfo(name: 'Marissa Powell', age: 31),
      UserInfo(name: 'Jordan Cooper', age: 37),
    ];
  }
}

class UserInfo {
  const UserInfo({required this.age, required this.name});

  final int age;
  final String name;
}
