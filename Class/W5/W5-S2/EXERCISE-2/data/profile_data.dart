import 'package:flutter/material.dart';
import '../model/profile_tile_model.dart';

ProfileData ronanProfile = ProfileData(
  name: "Ronan",
  position: "Flutter Developer",
  avatarUrl: 'assets/W5-S2/image.png',
  tiles: [
    TileData(icon: Icons.phone, title: "Phone Number", value: "+123 456 7890"),
    TileData(icon: Icons.location_on, title: "Address", value: "123 Cambodia"),
    TileData(icon: Icons.email, title: "Mail", value: "ronan.ogogr@cadt.edu"),
  ],
);

ProfileData daninProfile = ProfileData(
  name: "Danin",
  position: "CS Student",
  avatarUrl: 'assets/W5-S2/image2.png',
  tiles: [
    TileData(icon: Icons.phone, title: "Phone Number", value: "+987 654 3210"),
    TileData(icon: Icons.location_on, title: "Address", value: "456 Cambodia"),
    TileData(icon: Icons.email, title: "Mail", value: "ninnin@cadt.edu"),
  ],
);

ProfileData holoProfile = ProfileData(
  name: "Holo",
  position: "Backend Developer",
  avatarUrl: 'assets/W5-S2/image3.png',
  tiles: [
    TileData(icon: Icons.phone, title: "Phone Number", value: "+112 233 4455"),
    TileData(icon: Icons.location_on, title: "Address", value: "789 Cambodia"),
    TileData(icon: Icons.email, title: "Mail", value: "Holo.Hee@cadt.edu"),
  ],
);
