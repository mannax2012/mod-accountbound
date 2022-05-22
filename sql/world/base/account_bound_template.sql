SET 
@AllRaces         := 1791,
@AllianceRaces    := 1101,
@HordeRaces       := 690,
@AllClasses       := 1535,
@WarlockClass     := 256,
@PaladinClass     := 2,
@DeathKnightClass := 32,
@NoRiding         := 0,
@RidingSkill      := 762,
@ApprenticeRiding := 75,
@JourneymanRiding := 150,
@ExpertRiding     := 225,
@ArtisanRiding    := 300;

DROP TABLE IF EXISTS `account_bound_template`;
CREATE TABLE `account_bound_template` (
    `spellid` int(10) unsigned NOT NULL,
    `allowablerace` int(10) NOT NULL,
    `allowableclass` int(10) NOT NULL,
    `requiredlevel` tinyint(3) unsigned NOT NULL,
    `requiredskill` smallint(3) unsigned NOT NULL,
    `requiredskillrank` smallint(3) unsigned NOT NULL,
    `comment` varchar(255) NOT NULL,
    PRIMARY KEY (`spellid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `account_bound_template` (`spellid`, `allowablerace`, `allowableclass`, `requiredlevel`, `requiredskill`, `requiredskillrank`, `comment`) VALUES 
(458, @AllianceRaces, @AllClasses, 20, @RidingSkill, @ApprenticeRiding, 'Brown Horse'),
(468, @AllianceRaces, @AllClasses, 20, @RidingSkill, @ApprenticeRiding, 'White Stallion'),
(470, @AllianceRaces, @AllClasses, 20, @RidingSkill, @ApprenticeRiding, 'Black Stallion'),
(472, @AllianceRaces, @AllClasses, 20, @RidingSkill, @ApprenticeRiding, 'Pinto'),
(580, @HordeRaces, @AllClasses, 20, @RidingSkill, @ApprenticeRiding, 'Timber Wolf'),
(5784, @AllRaces, @WarlockClass, 20, @RidingSkill, @ApprenticeRiding, 'Felsteed'),
(6648, @AllianceRaces, @AllClasses, 20, @RidingSkill, @ApprenticeRiding, 'Chestnut Mare'),
(6653, @HordeRaces, @AllClasses, 20, @RidingSkill, @ApprenticeRiding, 'Dire Wolf'),
(6654, @HordeRaces, @AllClasses, 20, @RidingSkill, @ApprenticeRiding, 'Brown Wolf'),
(6777, @AllianceRaces, @AllClasses, 20, @RidingSkill, @ApprenticeRiding, 'Gray Ram'),
(6898, @AllianceRaces, @AllClasses, 20, @RidingSkill, @ApprenticeRiding, 'White Ram'),
(6899, @AllianceRaces, @AllClasses, 20, @RidingSkill, @ApprenticeRiding, 'Brown Ram'),
(8394, @AllianceRaces, @AllClasses, 20, @RidingSkill, @ApprenticeRiding, 'Striped Frostsaber'),
(8395, @HordeRaces, @AllClasses, 20, @RidingSkill, @ApprenticeRiding, 'Emerald Raptor'),
(10789, @AllianceRaces, @AllClasses, 20, @RidingSkill, @ApprenticeRiding, 'Spotted Frostsaber'),
(10793, @AllianceRaces, @AllClasses, 20, @RidingSkill, @ApprenticeRiding, 'Striped Nightsaber'),
(10796, @HordeRaces, @AllClasses, 20, @RidingSkill, @ApprenticeRiding, 'Turquoise Raptor'),
(10799, @HordeRaces, @AllClasses, 20, @RidingSkill, @ApprenticeRiding, 'Violet Raptor'),
(10873, @AllianceRaces, @AllClasses, 20, @RidingSkill, @ApprenticeRiding, 'Red Mechanostrider'),
(10969, @AllianceRaces, @AllClasses, 20, @RidingSkill, @ApprenticeRiding, 'Blue Mechanostrider'),
(13819, @AllianceRaces, @PaladinClass, 20, @RidingSkill, @ApprenticeRiding, 'Warhorse'),
(15779, @AllianceRaces, @AllClasses, 40, @RidingSkill, @JourneymanRiding, 'White Mechanostrider Mod B'),
(16055, @AllianceRaces, @AllClasses, 40, @RidingSkill, @JourneymanRiding, 'Black Nightsaber'),
(16056, @AllianceRaces, @AllClasses, 40, @RidingSkill, @JourneymanRiding, 'Ancient Frostsaber'),
(16080, @HordeRaces, @AllClasses, 40, @RidingSkill, @JourneymanRiding, 'Red Wolf'),
(16081, @HordeRaces, @AllClasses, 40, @RidingSkill, @JourneymanRiding, 'Winter Wolf'),
(16082, @AllianceRaces, @AllClasses, 40, @RidingSkill, @JourneymanRiding, 'Palomino'),
(16083, @AllianceRaces, @AllClasses, 40, @RidingSkill, @JourneymanRiding, 'White Stallion'),
(16084, @HordeRaces, @AllClasses, 40, @RidingSkill, @JourneymanRiding, 'Mottled Red Raptor'),
(17229, @AllianceRaces, @AllClasses, 40, @RidingSkill, @JourneymanRiding, 'Winterspring Frostsaber'),
(17450, @HordeRaces, @AllClasses, 40, @RidingSkill, @JourneymanRiding, 'Ivory Raptor'),
(17459, @AllianceRaces, @AllClasses, 40, @RidingSkill, @JourneymanRiding, 'Icy Blue Mechanostrider Mod A'),
(17460, @AllianceRaces, @AllClasses, 40, @RidingSkill, @JourneymanRiding, 'Frost Ram'),
(17461, @AllianceRaces, @AllClasses, 40, @RidingSkill, @JourneymanRiding, 'Black Ram'),
(17462, @HordeRaces, @AllClasses, 20, @RidingSkill, @ApprenticeRiding, 'Red Skeletal Horse'),
(17463, @HordeRaces, @AllClasses, 20, @RidingSkill, @ApprenticeRiding, 'Blue Skeletal Horse'),
(17464, @HordeRaces, @AllClasses, 20, @RidingSkill, @ApprenticeRiding, 'Brown Skeletal Horse'),
(17465, @HordeRaces, @AllClasses, 40, @RidingSkill, @JourneymanRiding, 'Green Skeletal Warhorse'),
(17481, @AllRaces, @AllClasses, 40, @RidingSkill, @JourneymanRiding, 'Rivendare\'s Deathcharger'),
(18989, @HordeRaces, @AllClasses, 20, @RidingSkill, @ApprenticeRiding, 'Gray Kodo'),
(18990, @HordeRaces, @AllClasses, 20, @RidingSkill, @ApprenticeRiding, 'Brown Kodo'),
(18991, @HordeRaces, @AllClasses, 40, @RidingSkill, @JourneymanRiding, 'Green Kodo'),
(18992, @HordeRaces, @AllClasses, 40, @RidingSkill, @JourneymanRiding, 'Teal Kodo'),
(22717, @AllianceRaces, @AllClasses, 40, @RidingSkill, @JourneymanRiding, 'Black War Steed'),
(22718, @HordeRaces, @AllClasses, 40, @RidingSkill, @JourneymanRiding, 'Black War Kodo'),
(22719, @AllianceRaces, @AllClasses, 40, @RidingSkill, @JourneymanRiding, 'Black Battlestrider'),
(22720, @AllianceRaces, @AllClasses, 40, @RidingSkill, @JourneymanRiding, 'Black War Ram'),
(22721, @HordeRaces, @AllClasses, 40, @RidingSkill, @JourneymanRiding, 'Black War Raptor'),
(22722, @HordeRaces, @AllClasses, 40, @RidingSkill, @JourneymanRiding, 'Red Skeletal Warhorse'),
(22723, @AllianceRaces, @AllClasses, 40, @RidingSkill, @JourneymanRiding, 'Black War Tiger'),
(22724, @HordeRaces, @AllClasses, 40, @RidingSkill, @JourneymanRiding, 'Black War Wolf'),
(23161, @AllRaces, @WarlockClass, 40, @RidingSkill, @JourneymanRiding, 'Dreadsteed'),
(23214, @AllianceRaces, @PaladinClass, 40, @RidingSkill, @JourneymanRiding, 'Charger'),
(23219, @AllianceRaces, @AllClasses, 40, @RidingSkill, @JourneymanRiding, 'Swift Mistsaber'),
(23220, @AllRaces, @AllClasses, 40, @RidingSkill, @JourneymanRiding, 'Swift Dawnsaber'),
(23221, @AllianceRaces, @AllClasses, 40, @RidingSkill, @JourneymanRiding, 'Swift Frostsaber'),
(23222, @AllianceRaces, @AllClasses, 40, @RidingSkill, @JourneymanRiding, 'Swift Yellow Mechanostrider'),
(23223, @AllianceRaces, @AllClasses, 40, @RidingSkill, @JourneymanRiding, 'Swift White Mechanostrider'),
(23225, @AllianceRaces, @AllClasses, 40, @RidingSkill, @JourneymanRiding, 'Swift Green Mechanostrider'),
(23227, @AllianceRaces, @AllClasses, 40, @RidingSkill, @JourneymanRiding, 'Swift Palomino'),
(23228, @AllianceRaces, @AllClasses, 40, @RidingSkill, @JourneymanRiding, 'Swift White Steed'),
(23229, @AllianceRaces, @AllClasses, 40, @RidingSkill, @JourneymanRiding, 'Swift Brown Steed'),
(23238, @AllianceRaces, @AllClasses, 40, @RidingSkill, @JourneymanRiding, 'Swift Brown Ram'),
(23239, @AllianceRaces, @AllClasses, 40, @RidingSkill, @JourneymanRiding, 'Swift Gray Ram'),
(23240, @AllianceRaces, @AllClasses, 40, @RidingSkill, @JourneymanRiding, 'Swift White Ram'),
(23241, @HordeRaces, @AllClasses, 40, @RidingSkill, @JourneymanRiding, 'Swift Blue Raptor'),
(23242, @HordeRaces, @AllClasses, 40, @RidingSkill, @JourneymanRiding, 'Swift Olive Raptor'),
(23243, @HordeRaces, @AllClasses, 40, @RidingSkill, @JourneymanRiding, 'Swift Orange Raptor'),
(23246, @HordeRaces, @AllClasses, 40, @RidingSkill, @JourneymanRiding, 'Purple Skeletal Warhorse'),
(23247, @HordeRaces, @AllClasses, 40, @RidingSkill, @JourneymanRiding, 'Great White Kodo'),
(23248, @HordeRaces, @AllClasses, 40, @RidingSkill, @JourneymanRiding, 'Great Gray Kodo'),
(23249, @HordeRaces, @AllClasses, 40, @RidingSkill, @JourneymanRiding, 'Great Brown Kodo'),
(23250, @HordeRaces, @AllClasses, 40, @RidingSkill, @JourneymanRiding, 'Swift Brown Wolf'),
(23251, @HordeRaces, @AllClasses, 40, @RidingSkill, @JourneymanRiding, 'Swift Timber Wolf'),
(23252, @HordeRaces, @AllClasses, 40, @RidingSkill, @JourneymanRiding, 'Swift Gray Wolf'),
(23338, @AllianceRaces, @AllClasses, 40, @RidingSkill, @JourneymanRiding, 'Swift Stormsaber'),
(23509, @HordeRaces, @AllClasses, 40, @RidingSkill, @JourneymanRiding, 'Frostwolf Howler'),
(23510, @AllianceRaces, @AllClasses, 40, @RidingSkill, @JourneymanRiding, 'Stormpike Battle Charger'),
(24242, @AllRaces, @AllClasses, 40, @RidingSkill, @JourneymanRiding, 'Swift Razzashi Raptor'),
(24252, @AllRaces, @AllClasses, 40, @RidingSkill, @JourneymanRiding, 'Swift Zulian Tiger'),
(25953, @AllRaces, @AllClasses, 40, @RidingSkill, @ApprenticeRiding, 'Blue Qiraji Battle Tank'),
(26054, @AllRaces, @AllClasses, 40, @RidingSkill, @ApprenticeRiding, 'Red Qiraji Battle Tank'),
(26055, @AllRaces, @AllClasses, 40, @RidingSkill, @ApprenticeRiding, 'Yellow Qiraji Battle Tank'),
(26056, @AllRaces, @AllClasses, 40, @RidingSkill, @ApprenticeRiding, 'Green Qiraji Battle Tank'),
(26656, @AllRaces, @AllClasses, 40, @RidingSkill, @JourneymanRiding, 'Black Qiraji Battle Tank'),
(29059, @AllRaces, @AllClasses, 40, @RidingSkill, @JourneymanRiding, 'Naxxramas Deathcharger'),
(30174, @AllRaces, @AllClasses, 1, @NoRiding, @NoRiding, 'Riding Turtle'),
(32235, @AllianceRaces, @AllClasses, 60, @RidingSkill, @ExpertRiding, 'Golden Gryphon'),
(32239, @AllianceRaces, @AllClasses, 60, @RidingSkill, @ExpertRiding, 'Ebon Gryphon'),
(32240, @AllianceRaces, @AllClasses, 60, @RidingSkill, @ExpertRiding, 'Snowy Gryphon'),
(32242, @AllianceRaces, @AllClasses, 70, @RidingSkill, @ArtisanRiding, 'Swift Blue Gryphon'),
(32243, @HordeRaces, @AllClasses, 60, @RidingSkill, @ExpertRiding, 'Tawny Wind Rider'),
(32244, @HordeRaces, @AllClasses, 60, @RidingSkill, @ExpertRiding, 'Blue Wind Rider'),
(32245, @HordeRaces, @AllClasses, 60, @RidingSkill, @ExpertRiding, 'Green Wind Rider'),
(32246, @HordeRaces, @AllClasses, 70, @RidingSkill, @ArtisanRiding, 'Swift Red Wind Rider'),
(32289, @AllianceRaces, @AllClasses, 70, @RidingSkill, @ArtisanRiding, 'Swift Red Gryphon'),
(32290, @AllianceRaces, @AllClasses, 70, @RidingSkill, @ArtisanRiding, 'Swift Green Gryphon'),
(32292, @AllianceRaces, @AllClasses, 70, @RidingSkill, @ArtisanRiding, 'Swift Purple Gryphon'),
(32295, @HordeRaces, @AllClasses, 70, @RidingSkill, @ArtisanRiding, 'Swift Green Wind Rider'),
(32296, @HordeRaces, @AllClasses, 70, @RidingSkill, @ArtisanRiding, 'Swift Yellow Wind Rider'),
(32297, @HordeRaces, @AllClasses, 70, @RidingSkill, @ArtisanRiding, 'Swift Purple Wind Rider'),
(33660, @HordeRaces, @AllClasses, 40, @RidingSkill, @JourneymanRiding, 'Swift Pink Hawkstrider'),
(34406, @AllianceRaces, @AllClasses, 20, @RidingSkill, @ApprenticeRiding, 'Brown Elekk'),
(34407, @AllianceRaces, @AllClasses, 40, @RidingSkill, @JourneymanRiding, 'Great Elite Elekk'),
(34767, @HordeRaces, @PaladinClass, 40, @RidingSkill, @JourneymanRiding, 'Summon Charger'),
(34769, @HordeRaces, @PaladinClass, 20, @RidingSkill, @ApprenticeRiding, 'Summon Warhorse'),
(34790, @AllRaces, @AllClasses, 40, @RidingSkill, @JourneymanRiding, 'Dark War Talbuk'),
(34795, @HordeRaces, @AllClasses, 20, @RidingSkill, @ApprenticeRiding, 'Red Hawkstrider'),
(34896, @AllRaces, @AllClasses, 40, @RidingSkill, @JourneymanRiding, 'Cobalt War Talbuk'),
(34897, @AllRaces, @AllClasses, 40, @RidingSkill, @JourneymanRiding, 'White War Talbuk'),
(34898, @AllRaces, @AllClasses, 40, @RidingSkill, @JourneymanRiding, 'Silver War Talbuk'),
(34899, @AllRaces, @AllClasses, 40, @RidingSkill, @JourneymanRiding, 'Tan War Talbuk'),
(35018, @HordeRaces, @AllClasses, 20, @RidingSkill, @ApprenticeRiding, 'Purple Hawkstrider'),
(35020, @HordeRaces, @AllClasses, 20, @RidingSkill, @ApprenticeRiding, 'Blue Hawkstrider'),
(35022, @HordeRaces, @AllClasses, 20, @RidingSkill, @ApprenticeRiding, 'Black Hawkstrider'),
(35025, @HordeRaces, @AllClasses, 40, @RidingSkill, @JourneymanRiding, 'Swift Green Hawkstrider'),
(35027, @HordeRaces, @AllClasses, 40, @RidingSkill, @JourneymanRiding, 'Swift Purple Hawkstrider'),
(35028, @HordeRaces, @AllClasses, 40, @RidingSkill, @JourneymanRiding, 'Swift Warstrider'),
(35710, @AllianceRaces, @AllClasses, 20, @RidingSkill, @ApprenticeRiding, 'Gray Elekk'),
(35711, @AllianceRaces, @AllClasses, 20, @RidingSkill, @ApprenticeRiding, 'Purple Elekk'),
(35712, @AllianceRaces, @AllClasses, 40, @RidingSkill, @JourneymanRiding, 'Great Green Elekk'),
(35713, @AllianceRaces, @AllClasses, 40, @RidingSkill, @JourneymanRiding, 'Great Blue Elekk'),
(35714, @AllianceRaces, @AllClasses, 40, @RidingSkill, @JourneymanRiding, 'Great Purple Elekk'),
(36702, @AllRaces, @AllClasses, 40, @RidingSkill, @JourneymanRiding, 'Fiery Warhorse'),
(37015, @AllRaces, @AllClasses, 70, @RidingSkill, @ArtisanRiding, 'Swift Nether Drake'),
(39315, @AllRaces, @AllClasses, 40, @RidingSkill, @JourneymanRiding, 'Cobalt Riding Talbuk'),
(39316, @AllRaces, @AllClasses, 40, @RidingSkill, @JourneymanRiding, 'Dark Riding Talbuk'),
(39317, @AllRaces, @AllClasses, 40, @RidingSkill, @JourneymanRiding, 'Silver Riding Talbuk'),
(39318, @AllRaces, @AllClasses, 40, @RidingSkill, @JourneymanRiding, 'Tan Riding Talbuk'),
(39319, @AllRaces, @AllClasses, 40, @RidingSkill, @JourneymanRiding, 'White Riding Talbuk'),
(39798, @AllRaces, @AllClasses, 70, @RidingSkill, @ArtisanRiding, 'Green Riding Nether Ray'),
(39800, @AllRaces, @AllClasses, 70, @RidingSkill, @ArtisanRiding, 'Red Riding Nether Ray'),
(39801, @AllRaces, @AllClasses, 70, @RidingSkill, @ArtisanRiding, 'Purple Riding Nether Ray'),
(39802, @AllRaces, @AllClasses, 70, @RidingSkill, @ArtisanRiding, 'Silver Riding Nether Ray'),
(39803, @AllRaces, @AllClasses, 70, @RidingSkill, @ArtisanRiding, 'Blue Riding Nether Ray'),
(40192, @AllRaces, @AllClasses, 70, @RidingSkill, @ArtisanRiding, 'Ashes of Al\'ar'),
(41252, @AllRaces, @AllClasses, 70, @RidingSkill, @ArtisanRiding, 'Raven Lord'),
(41513, @AllRaces, @AllClasses, 70, @RidingSkill, @ArtisanRiding, 'Onyx Netherwing Drake'),
(41514, @AllRaces, @AllClasses, 70, @RidingSkill, @ArtisanRiding, 'Azure Netherwing Drake'),
(41515, @AllRaces, @AllClasses, 70, @RidingSkill, @ArtisanRiding, 'Cobalt Netherwing Drake'),
(41516, @AllRaces, @AllClasses, 70, @RidingSkill, @ArtisanRiding, 'Purple Netherwing Drake'),
(41517, @AllRaces, @AllClasses, 70, @RidingSkill, @ArtisanRiding, 'Veridian Netherwing Drake'),
(41518, @AllRaces, @AllClasses, 70, @RidingSkill, @ArtisanRiding, 'Violet Netherwing Drake'),
(42776, @AllRaces, @AllClasses, 20, @RidingSkill, @ApprenticeRiding, 'Spectral Tiger'),
(42777, @AllRaces, @AllClasses, 40, @RidingSkill, @JourneymanRiding, 'Swift Spectral Tiger'),
(43688, @AllRaces, @AllClasses, 70, @RidingSkill, @JourneymanRiding, 'Amani War Bear'),
(43899, @AllRaces, @AllClasses, 20, @RidingSkill, @ApprenticeRiding, 'Brewfest Ram'),
(43900, @AllRaces, @AllClasses, 40, @RidingSkill, @JourneymanRiding, 'Swift Brewfest Ram'),
(43927, @AllRaces, @AllClasses, 70, @RidingSkill, @ArtisanRiding, 'Cenarion War Hippogryph'),
(44151, @AllRaces, @AllClasses, 70, @RidingSkill, @ArtisanRiding, 'Turbo-Charged Flying Machine'),
(44153, @AllRaces, @AllClasses, 60, @RidingSkill, @ExpertRiding, 'Flying Machine'),
(44744, @AllRaces, @AllClasses, 70, @RidingSkill, @ArtisanRiding, 'Merciless Nether Drake'),
(46197, @AllRaces, @AllClasses, 60, @RidingSkill, @ExpertRiding, 'X-51 Nether-Rocket'),
(46199, @AllRaces, @AllClasses, 70, @RidingSkill, @ArtisanRiding, 'X-51 Nether-Rocket X-TREME'),
(46628, @AllRaces, @AllClasses, 40, @RidingSkill, @JourneymanRiding, 'Swift White Hawkstrider'),
(48025, @AllRaces, @AllClasses, 20, @RidingSkill, @ApprenticeRiding, 'Headless Horseman\'s Mount'),
(48027, @AllianceRaces, @AllClasses, 40, @RidingSkill, @JourneymanRiding, 'Black War Elekk'),
(48778, @AllRaces, @DeathKnightClass, 55, @RidingSkill, @JourneymanRiding, 'Acherus Deathcharger'),
(49193, @AllRaces, @AllClasses, 70, @RidingSkill, @ArtisanRiding, 'Vengeful Nether Drake'),
(49322, @AllRaces, @AllClasses, 40, @RidingSkill, @JourneymanRiding, 'Swift Zhevra'),
(49378, @AllRaces, @AllClasses, 20, @RidingSkill, @ApprenticeRiding, 'Brewfest Riding Kodo'),
(49379, @AllRaces, @AllClasses, 40, @RidingSkill, @JourneymanRiding, 'Great Brewfest Kodo'),
(51412, @AllRaces, @AllClasses, 40, @RidingSkill, @JourneymanRiding, 'Big Battle Bear'),
(54729, @AllRaces, @DeathKnightClass, 60, @RidingSkill, @ExpertRiding, 'Winged Steed of the Ebon Blade'),
(54753, @AllRaces, @AllClasses, 40, @RidingSkill, @JourneymanRiding, 'White Polar Bear'),
(55531, @AllRaces, @AllClasses, 40, @RidingSkill, @JourneymanRiding, 'Mechano-hog'),
(58615, @AllRaces, @AllClasses, 70, @RidingSkill, @ArtisanRiding, 'Brutal Nether Drake'),
(58983, @AllRaces, @AllClasses, 20, @RidingSkill, @ApprenticeRiding, 'Big Blizzard Bear'),
(59567, @AllRaces, @AllClasses, 70, @RidingSkill, @ArtisanRiding, 'Azure Drake'),
(59568, @AllRaces, @AllClasses, 70, @RidingSkill, @ArtisanRiding, 'Blue Drake'),
(59569, @AllRaces, @AllClasses, 70, @RidingSkill, @ArtisanRiding, 'Bronze Drake'),
(59570, @AllRaces, @AllClasses, 70, @RidingSkill, @ArtisanRiding, 'Red Drake'),
(59571, @AllRaces, @AllClasses, 70, @RidingSkill, @ArtisanRiding, 'Twilight Drake'),
(59572, @AllRaces, @AllClasses, 40, @RidingSkill, @JourneymanRiding, 'Black Polar Bear'),
(59573, @AllRaces, @AllClasses, 40, @RidingSkill, @JourneymanRiding, 'Brown Polar Bear'),
(59650, @AllRaces, @AllClasses, 70, @RidingSkill, @ArtisanRiding, 'Black Drake'),
(59785, @AllianceRaces, @AllClasses, 40, @RidingSkill, @JourneymanRiding, 'Black War Mammoth'),
(59788, @HordeRaces, @AllClasses, 40, @RidingSkill, @JourneymanRiding, 'Black War Mammoth'),
(59791, @AllianceRaces, @AllClasses, 40, @RidingSkill, @JourneymanRiding, 'Wooly Mammoth'),
(59793, @HordeRaces, @AllClasses, 40, @RidingSkill, @JourneymanRiding, 'Wooly Mammoth'),
(59797, @HordeRaces, @AllClasses, 40, @RidingSkill, @JourneymanRiding, 'Ice Mammoth'),
(59799, @AllianceRaces, @AllClasses, 40, @RidingSkill, @JourneymanRiding, 'Ice Mammoth'),
(59961, @AllRaces, @AllClasses, 70, @RidingSkill, @ArtisanRiding, 'Red Proto-Drake'),
(59976, @AllRaces, @AllClasses, 70, @RidingSkill, @ArtisanRiding, 'Black Proto-Drake'),
(59996, @AllRaces, @AllClasses, 70, @RidingSkill, @ArtisanRiding, 'Blue Proto-Drake'),
(60002, @AllRaces, @AllClasses, 70, @RidingSkill, @ArtisanRiding, 'Time-Lost Proto-Drake'),
(60021, @AllRaces, @AllClasses, 70, @RidingSkill, @ArtisanRiding, 'Plagued Proto-Drake'),
(60024, @AllRaces, @AllClasses, 70, @RidingSkill, @ArtisanRiding, 'Violet Proto-Drake'),
(60025, @AllRaces, @AllClasses, 70, @RidingSkill, @ArtisanRiding, 'Albino Drake'),
(60114, @AllianceRaces, @AllClasses, 40, @RidingSkill, @JourneymanRiding, 'Armored Brown Bear'),
(60116, @HordeRaces, @AllClasses, 40, @RidingSkill, @JourneymanRiding, 'Armored Brown Bear'),
(60118, @AllianceRaces, @AllClasses, 40, @RidingSkill, @JourneymanRiding, 'Black War Bear'),
(60119, @HordeRaces, @AllClasses, 40, @RidingSkill, @JourneymanRiding, 'Black War Bear'),
(60424, @AllianceRaces, @AllClasses, 40, @RidingSkill, @JourneymanRiding, 'Mekgineer\'s Chopper'),
(61229, @AllianceRaces, @AllClasses, 70, @RidingSkill, @ArtisanRiding, 'Armored Snowy Gryphon'),
(61230, @HordeRaces, @AllClasses, 70, @RidingSkill, @ArtisanRiding, 'Armored Blue Wind Rider'),
(61294, @AllRaces, @AllClasses, 70, @RidingSkill, @ArtisanRiding, 'Green Proto-Drake'),
(61309, @AllRaces, @AllClasses, 70, @RidingSkill, @ArtisanRiding, 'Magnificent Flying Carpet'),
(61425, @AllianceRaces, @AllClasses, 40, @RidingSkill, @JourneymanRiding, 'Traveler\'s Tundra Mammoth'),
(61447, @HordeRaces, @AllClasses, 40, @RidingSkill, @JourneymanRiding, 'Traveler\'s Tundra Mammoth'),
(61451, @AllRaces, @AllClasses, 60, @RidingSkill, @ExpertRiding, 'Flying Carpet'),
(61465, @AllianceRaces, @AllClasses, 40, @RidingSkill, @JourneymanRiding, 'Grand Black War Mammoth'),
(61467, @HordeRaces, @AllClasses, 40, @RidingSkill, @JourneymanRiding, 'Grand Black War Mammoth'),
(61469, @AllianceRaces, @AllClasses, 40, @RidingSkill, @JourneymanRiding, 'Grand Ice Mammoth'),
(61470, @HordeRaces, @AllClasses, 40, @RidingSkill, @JourneymanRiding, 'Grand Ice Mammoth'),
(61996, @AllRaces, @AllClasses, 70, @RidingSkill, @ArtisanRiding, 'Blue Dragonhawk'),
(61997, @AllRaces, @AllClasses, 70, @RidingSkill, @ArtisanRiding, 'Red Dragonhawk'),
(63232, @AllianceRaces, @AllClasses, 40, @RidingSkill, @JourneymanRiding, 'Stormwind Steed'),
(63635, @HordeRaces, @AllClasses, 40, @RidingSkill, @JourneymanRiding, 'Darkspear Raptor'),
(63636, @AllianceRaces, @AllClasses, 40, @RidingSkill, @JourneymanRiding, 'Ironforge Ram'),
(63637, @AllianceRaces, @AllClasses, 40, @RidingSkill, @JourneymanRiding, 'Darnassian Nightsaber'),
(63638, @AllianceRaces, @AllClasses, 40, @RidingSkill, @JourneymanRiding, 'Gnomeregan Mechanostrider'),
(63639, @AllianceRaces, @AllClasses, 40, @RidingSkill, @JourneymanRiding, 'Exodar Elekk'),
(63640, @HordeRaces, @AllClasses, 40, @RidingSkill, @JourneymanRiding, 'Orgrimmar Wolf'),
(63641, @HordeRaces, @AllClasses, 40, @RidingSkill, @JourneymanRiding, 'Thunder Bluff Kodo'),
(63642, @HordeRaces, @AllClasses, 40, @RidingSkill, @JourneymanRiding, 'Silvermoon Hawkstrider'),
(63643, @HordeRaces, @AllClasses, 40, @RidingSkill, @JourneymanRiding, 'Forsaken Warhorse'),
(63796, @AllRaces, @AllClasses, 70, @RidingSkill, @ArtisanRiding, 'Mimiron\'s Head'),
(63844, @AllRaces, @AllClasses, 70, @RidingSkill, @ArtisanRiding, 'Argent Hippogryph'),
(63956, @AllRaces, @AllClasses, 70, @RidingSkill, @ArtisanRiding, 'Ironbound Proto-Drake'),
(63963, @AllRaces, @AllClasses, 70, @RidingSkill, @ArtisanRiding, 'Rusted Proto-Drake'),
(64657, @HordeRaces, @AllClasses, 20, @RidingSkill, @ApprenticeRiding, 'White Kodo'),
(64658, @HordeRaces, @AllClasses, 20, @RidingSkill, @ApprenticeRiding, 'Black Wolf'),
(64659, @HordeRaces, @AllClasses, 40, @RidingSkill, @ApprenticeRiding, 'Venomhide Ravasaur'),
(64731, @AllRaces, @AllClasses, 1, @RidingSkill, @ApprenticeRiding, 'Sea Turtle'),
(64927, @AllRaces, @AllClasses, 70, @RidingSkill, @ArtisanRiding, 'Deadly Gladiator\'s Frost Wyrm'),
(64977, @HordeRaces, @AllClasses, 20, @RidingSkill, @ApprenticeRiding, 'Black Skeletal Horse'),
(65439, @AllRaces, @AllClasses, 70, @RidingSkill, @ArtisanRiding, 'Furious Gladiator\'s Frost Wyrm'),
(65637, @AllianceRaces, @AllClasses, 40, @RidingSkill, @JourneymanRiding, 'Great Red Elekk'),
(65638, @AllianceRaces, @AllClasses, 40, @RidingSkill, @JourneymanRiding, 'Swift Moonsaber'),
(65639, @HordeRaces, @AllClasses, 40, @RidingSkill, @JourneymanRiding, 'Swift Red Hawkstrider'),
(65640, @AllianceRaces, @AllClasses, 40, @RidingSkill, @JourneymanRiding, 'Swift Gray Steed'),
(65641, @HordeRaces, @AllClasses, 40, @RidingSkill, @JourneymanRiding, 'Great Golden Kodo'),
(65642, @AllianceRaces, @AllClasses, 40, @RidingSkill, @JourneymanRiding, 'Turbostrider'),
(65643, @AllianceRaces, @AllClasses, 40, @RidingSkill, @JourneymanRiding, 'Swift Violet Ram'),
(65644, @HordeRaces, @AllClasses, 40, @RidingSkill, @JourneymanRiding, 'Swift Purple Raptor'),
(65645, @HordeRaces, @AllClasses, 40, @RidingSkill, @JourneymanRiding, 'White Skeletal Warhorse'),
(65646, @HordeRaces, @AllClasses, 40, @RidingSkill, @JourneymanRiding, 'Swift Burgundy Wolf'),
(65917, @AllRaces, @AllClasses, 40, @RidingSkill, @JourneymanRiding, 'Magic Rooster'),
(66087, @AllianceRaces, @AllClasses, 70, @RidingSkill, @ArtisanRiding, 'Silver Covenant Hippogryph'),
(66088, @HordeRaces, @AllClasses, 70, @RidingSkill, @ArtisanRiding, 'Sunreaver Dragonhawk'),
(66090, @AllianceRaces, @AllClasses, 40, @RidingSkill, @JourneymanRiding, 'Quel\'dorei Steed'),
(66091, @HordeRaces, @AllClasses, 40, @RidingSkill, @JourneymanRiding, 'Sunreaver Hawkstrider'),
(66846, @HordeRaces, @AllClasses, 40, @RidingSkill, @JourneymanRiding, 'Ochre Skeletal Warhorse'),
(66847, @AllianceRaces, @AllClasses, 20, @RidingSkill, @ApprenticeRiding, 'Striped Dawnsaber'),
(66906, @AllRaces, @PaladinClass, 40, @RidingSkill, @JourneymanRiding, 'Argent Charger'),
(67336, @AllRaces, @AllClasses, 70, @RidingSkill, @ArtisanRiding, 'Relentless Gladiator\'s Frost Wyrm'),
(67466, @AllRaces, @AllClasses, 40, @RidingSkill, @JourneymanRiding, 'Argent Warhorse'),
(68056, @HordeRaces, @AllClasses, 40, @RidingSkill, @JourneymanRiding, 'Swift Horde Wolf'),
(68057, @AllianceRaces, @AllClasses, 40, @RidingSkill, @JourneymanRiding, 'Swift Alliance Steed'),
(68187, @AllianceRaces, @AllClasses, 40, @RidingSkill, @JourneymanRiding, 'Crusader\'s White Warhorse'),
(68188, @HordeRaces, @AllClasses, 40, @RidingSkill, @JourneymanRiding, 'Crusader\'s Black Warhorse'),
(69395, @AllRaces, @AllClasses, 70, @RidingSkill, @ArtisanRiding, 'Onyxian Drake'),
(71342, @AllRaces, @AllClasses, 80, @RidingSkill, @JourneymanRiding, 'Big Love Rocket'),
(71810, @AllRaces, @AllClasses, 70, @RidingSkill, @ArtisanRiding, 'Wrathful Gladiator\'s Frost Wyrm'),
(72286, @AllRaces, @AllClasses, 20, @RidingSkill, @ApprenticeRiding, 'Invincible'),
(72807, @AllRaces, @AllClasses, 70, @RidingSkill, @ArtisanRiding, 'Icebound Frostbrood Vanquisher'),
(72808, @AllRaces, @AllClasses, 70, @RidingSkill, @ArtisanRiding, 'Bloodbathed Frostbrood Vanquisher'),
(73313, @AllRaces, @AllClasses, 20, @RidingSkill, @ApprenticeRiding, 'Crimson Deathcharger'),
(74856, @AllRaces, @AllClasses, 60, @RidingSkill, @ExpertRiding, 'Blazing Hippogryph'),
(74918, @AllRaces, @AllClasses, 40, @RidingSkill, @JourneymanRiding, 'Wooly White Rhino'),
(75596, @AllRaces, @AllClasses, 70, @RidingSkill, @ArtisanRiding, 'Frosty Flying Carpet'),
(75614, @AllRaces, @AllClasses, 20, @RidingSkill, @ApprenticeRiding, 'Celestial Steed'),
(75973, @AllRaces, @AllClasses, 60, @RidingSkill, @ExpertRiding, 'X-53 Touring Rocket');
