class Chat {
  final String name, lastMessage, image, time;
  final bool isActive;

  Chat({
    this.name,
    this.lastMessage,
    this.image,
    this.time,
    this.isActive,
  });
}

List messagesData = [
  Chat(
    name: "Tony Stark",
    lastMessage:
        "You Know, It’s Times Like These When I Realize What A Superhero I Am.",
    image: "assets/images/user.png",
    time: "3m ago",
    isActive: false,
  ),
  Chat(
    name: "Steve Rogers",
    lastMessage: "I can do this all day.",
    image: "assets/images/user_2.png",
    time: "8m ago",
    isActive: true,
  ),
  Chat(
    name: "Bruce Banner",
    lastMessage: "Don't Make Me Hungry. You Wouldn't Like Me When I'm Hungry.",
    image: "assets/images/user_3.png",
    time: "5d ago",
    isActive: false,
  ),
  Chat(
    name: "Thor",
    lastMessage: "I'D RATHER BE A GOOD MAN THAN A GREAT KING",
    image: "assets/images/user_4.png",
    time: "5d ago",
    isActive: true,
  ),
  Chat(
    name: "Wanda Maximoff",
    lastMessage: "It's My Job.",
    image: "assets/images/user_5.png",
    time: "6d ago",
    isActive: false,
  ),
  Chat(
    name: "Nick Fury",
    lastMessage: "Come to S.H.I.E.L.D Headquarters",
    image: "assets/images/user_6.png",
    time: "3m ago",
    isActive: false,
  ),
  Chat(
    name: "Peter Parker",
    lastMessage: "Where is Tony?",
    image: "assets/images/user_7.png",
    time: "8m ago",
    isActive: true,
  ),
  Chat(
    name: "Pepper Potts",
    lastMessage: "Please take care of Tony",
    image: "assets/images/user_8.png",
    time: "5d ago",
    isActive: false,
  ),
];
