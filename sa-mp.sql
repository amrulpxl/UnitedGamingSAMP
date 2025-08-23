-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 23, 2025 at 01:25 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sa-mp`
--

-- --------------------------------------------------------

--
-- Table structure for table `accessories`
--

CREATE TABLE `accessories` (
  `ID` int(11) NOT NULL,
  `CharacterID` int(11) NOT NULL,
  `Bone` int(11) NOT NULL,
  `Model` int(11) NOT NULL,
  `PosX` float NOT NULL,
  `PosY` float NOT NULL,
  `PosZ` float NOT NULL,
  `PosRX` float NOT NULL,
  `PosRY` float NOT NULL,
  `PosRZ` float NOT NULL,
  `PosSX` float NOT NULL,
  `PosSY` float NOT NULL,
  `PosSZ` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admin_notes`
--

CREATE TABLE `admin_notes` (
  `ID` int(11) NOT NULL,
  `AccountID` int(11) NOT NULL,
  `Timestamp` int(11) NOT NULL,
  `Admin` varchar(32) NOT NULL,
  `Message` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ajail_logs`
--

CREATE TABLE `ajail_logs` (
  `ID` int(11) NOT NULL,
  `JailedDBID` int(11) NOT NULL,
  `JailedName` varchar(32) NOT NULL,
  `Reason` varchar(128) NOT NULL,
  `JailedBy` varchar(32) NOT NULL,
  `Date` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `atm`
--

CREATE TABLE `atm` (
  `ID` int(11) NOT NULL,
  `Money` int(11) NOT NULL,
  `X` float NOT NULL,
  `Y` float NOT NULL,
  `Z` float NOT NULL,
  `RX` float NOT NULL,
  `RY` float NOT NULL,
  `RZ` float NOT NULL,
  `World` int(11) NOT NULL,
  `Interior` int(11) NOT NULL,
  `AddedBy` varchar(25) NOT NULL,
  `AddedDate` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attack_logs`
--

CREATE TABLE `attack_logs` (
  `ID` int(11) NOT NULL,
  `AttackerID` int(11) NOT NULL,
  `AttackerName` varchar(32) NOT NULL,
  `MaskID` int(11) NOT NULL,
  `Damage` float NOT NULL,
  `Date` int(11) NOT NULL,
  `CharacterID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bans`
--

CREATE TABLE `bans` (
  `BanID` int(11) NOT NULL,
  `AccountID` int(11) NOT NULL,
  `Admin` varchar(128) NOT NULL,
  `UnbanTimestamp` int(20) NOT NULL,
  `Reason` varchar(512) NOT NULL,
  `IPAddress` varchar(128) NOT NULL,
  `BanDate` int(20) NOT NULL,
  `Serial` varchar(41) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ban_logs`
--

CREATE TABLE `ban_logs` (
  `ID` int(11) NOT NULL,
  `BannedDBID` int(11) NOT NULL,
  `BannedName` varchar(32) NOT NULL,
  `Reason` varchar(128) NOT NULL,
  `BannedBy` varchar(32) NOT NULL,
  `Date` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blackmarkets`
--

CREATE TABLE `blackmarkets` (
  `ID` int(10) UNSIGNED NOT NULL,
  `FactionID` int(10) UNSIGNED NOT NULL,
  `Stock` int(11) NOT NULL,
  `PosX` float NOT NULL,
  `PosY` float NOT NULL,
  `PosZ` float NOT NULL,
  `Interior` int(10) UNSIGNED NOT NULL,
  `World` int(10) UNSIGNED NOT NULL,
  `HasKnife` int(11) NOT NULL,
  `Has9mm` int(11) NOT NULL,
  `HasSDPistol` int(11) NOT NULL,
  `HasDeagle` int(11) NOT NULL,
  `HasShotgun` int(11) NOT NULL,
  `HasSawnoff` int(11) NOT NULL,
  `HasUzi` int(11) NOT NULL,
  `HasMP5` int(11) NOT NULL,
  `HasAK47` int(11) NOT NULL,
  `HasM4` int(11) NOT NULL,
  `HasTec9` int(11) NOT NULL,
  `HasRifle` int(11) NOT NULL,
  `HasSniper` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `business`
--

CREATE TABLE `business` (
  `ID` int(11) NOT NULL,
  `OwnerID` int(11) NOT NULL,
  `Name` varchar(128) NOT NULL,
  `MarketPrice` int(11) NOT NULL,
  `ExteriorX` float NOT NULL,
  `ExteriorY` float NOT NULL,
  `ExteriorZ` float NOT NULL,
  `ExteriorA` float NOT NULL,
  `ExteriorInt` int(11) NOT NULL,
  `ExteriorVW` int(11) NOT NULL,
  `InteriorX` float NOT NULL,
  `InteriorY` float NOT NULL,
  `InteriorZ` float NOT NULL,
  `InteriorA` float NOT NULL,
  `InteriorInt` int(11) NOT NULL,
  `Locked` int(11) NOT NULL,
  `EntryFee` int(11) NOT NULL,
  `Type` int(11) NOT NULL,
  `Safe` int(11) NOT NULL,
  `Products` int(11) NOT NULL,
  `GovClosed` int(11) NOT NULL,
  `Slogan` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `characters`
--

CREATE TABLE `characters` (
  `CharacterID` int(11) NOT NULL,
  `OwnerID` int(11) NOT NULL,
  `Name` varchar(32) NOT NULL,
  `Level` int(11) NOT NULL,
  `Expierience` int(11) NOT NULL,
  `Hours` int(11) NOT NULL,
  `Crashed` int(11) NOT NULL,
  `LastPosX` float NOT NULL,
  `LastPosY` float NOT NULL,
  `LastPosZ` float NOT NULL,
  `LastPosA` float NOT NULL,
  `LastInterior` int(11) NOT NULL,
  `LastVW` int(11) NOT NULL,
  `Money` int(11) NOT NULL,
  `Bank` int(11) NOT NULL,
  `PayCheque` int(11) NOT NULL,
  `PhoneNo` int(11) NOT NULL,
  `PhoneType` int(11) NOT NULL,
  `Faction` int(11) NOT NULL,
  `FactionRank` int(11) NOT NULL,
  `WeaponSpawned1` int(11) NOT NULL,
  `WeaponSpawned2` int(11) NOT NULL,
  `WeaponSpawned3` int(11) NOT NULL,
  `WeaponSpawned4` int(11) NOT NULL,
  `Weapon1` int(11) NOT NULL,
  `Weapon2` int(11) NOT NULL,
  `Weapon3` int(11) NOT NULL,
  `Weapon4` int(11) NOT NULL,
  `Ammo1` int(11) NOT NULL,
  `Ammo2` int(11) NOT NULL,
  `Ammo3` int(11) NOT NULL,
  `Ammo4` int(11) NOT NULL,
  `Handcuffed` int(11) NOT NULL,
  `Radio` int(11) NOT NULL,
  `RadioChan` int(11) NOT NULL,
  `RadioChan2` int(11) NOT NULL,
  `RadioChan3` int(11) NOT NULL,
  `RadioSlot` int(11) NOT NULL,
  `Injured` int(11) NOT NULL,
  `WeaponLicense` int(11) NOT NULL,
  `DrivingLicense` int(11) NOT NULL,
  `FlyingLicense` int(11) NOT NULL,
  `PrisonTimes` int(11) NOT NULL,
  `JailTimes` int(11) NOT NULL,
  `Job` int(11) NOT NULL,
  `SideJob` int(11) NOT NULL,
  `WalkStyle` int(11) NOT NULL,
  `ChatStyle` int(11) NOT NULL,
  `Jailed` int(11) NOT NULL,
  `JailID` int(11) NOT NULL,
  `JailTime` int(11) NOT NULL,
  `Spawn` int(11) NOT NULL,
  `Skin` int(11) NOT NULL,
  `Gender` int(11) NOT NULL,
  `Mask` int(11) NOT NULL,
  `MaskID` int(11) NOT NULL,
  `LastShot` varchar(25) NOT NULL,
  `LastShotTime` int(11) NOT NULL,
  `DeathMode` int(11) NOT NULL,
  `Health` float NOT NULL,
  `Armour` float NOT NULL,
  `OwnedVehicle1` int(11) NOT NULL,
  `OwnedVehicle2` int(11) NOT NULL,
  `OwnedVehicle3` int(11) NOT NULL,
  `OwnedVehicle4` int(11) NOT NULL,
  `OwnedVehicle5` int(11) NOT NULL,
  `SpawnedVehicle` int(11) NOT NULL,
  `DutySkin` int(11) NOT NULL,
  `BeforeSkin` int(11) NOT NULL,
  `FactionDuty` int(11) NOT NULL,
  `Renting` int(11) NOT NULL,
  `ConnectedTime` int(11) NOT NULL,
  `HouseSpawnID` int(11) NOT NULL,
  `PrimaryWep` int(11) NOT NULL,
  `PrimaryAmmo` int(11) NOT NULL,
  `SecondaryWep` int(11) NOT NULL,
  `SecondaryAmmo` int(11) NOT NULL,
  `MeleeWep` int(11) NOT NULL,
  `OtherWep` int(11) NOT NULL,
  `Fish` int(11) NOT NULL,
  `FishBait` int(11) NOT NULL,
  `WeaponX` float NOT NULL,
  `WeaponY` float NOT NULL,
  `WeaponZ` float NOT NULL,
  `WeaponRX` float NOT NULL,
  `WeaponRY` float NOT NULL,
  `WeaponRZ` float NOT NULL,
  `WeaponSX` float NOT NULL,
  `WeaponSY` float NOT NULL,
  `WeaponSZ` float NOT NULL,
  `WeaponBone` int(11) NOT NULL,
  `Savings` int(11) NOT NULL,
  `WireCutter` int(11) NOT NULL,
  `Wires` int(11) NOT NULL,
  `BadgeNo` int(11) NOT NULL,
  `WeedSeeds` int(11) NOT NULL,
  `Weed` int(11) NOT NULL,
  `BMXPermission` int(11) NOT NULL,
  `Heroin` int(11) NOT NULL,
  `PoppySeeds` int(11) NOT NULL,
  `Opium` int(11) NOT NULL,
  `HoldingInv` int(11) NOT NULL,
  `HoldingInvAmount` int(11) NOT NULL,
  `Origin` int(11) NOT NULL,
  `Lotto` int(11) NOT NULL,
  `PrimarySerial` int(11) NOT NULL,
  `SecondarySerial` int(11) NOT NULL,
  `Accent` varchar(33) NOT NULL,
  `Apperance` varchar(128) NOT NULL,
  `LastRam` varchar(25) NOT NULL,
  `LastRamTime` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `characters`
--

INSERT INTO `characters` (`CharacterID`, `OwnerID`, `Name`, `Level`, `Expierience`, `Hours`, `Crashed`, `LastPosX`, `LastPosY`, `LastPosZ`, `LastPosA`, `LastInterior`, `LastVW`, `Money`, `Bank`, `PayCheque`, `PhoneNo`, `PhoneType`, `Faction`, `FactionRank`, `WeaponSpawned1`, `WeaponSpawned2`, `WeaponSpawned3`, `WeaponSpawned4`, `Weapon1`, `Weapon2`, `Weapon3`, `Weapon4`, `Ammo1`, `Ammo2`, `Ammo3`, `Ammo4`, `Handcuffed`, `Radio`, `RadioChan`, `RadioChan2`, `RadioChan3`, `RadioSlot`, `Injured`, `WeaponLicense`, `DrivingLicense`, `FlyingLicense`, `PrisonTimes`, `JailTimes`, `Job`, `SideJob`, `WalkStyle`, `ChatStyle`, `Jailed`, `JailID`, `JailTime`, `Spawn`, `Skin`, `Gender`, `Mask`, `MaskID`, `LastShot`, `LastShotTime`, `DeathMode`, `Health`, `Armour`, `OwnedVehicle1`, `OwnedVehicle2`, `OwnedVehicle3`, `OwnedVehicle4`, `OwnedVehicle5`, `SpawnedVehicle`, `DutySkin`, `BeforeSkin`, `FactionDuty`, `Renting`, `ConnectedTime`, `HouseSpawnID`, `PrimaryWep`, `PrimaryAmmo`, `SecondaryWep`, `SecondaryAmmo`, `MeleeWep`, `OtherWep`, `Fish`, `FishBait`, `WeaponX`, `WeaponY`, `WeaponZ`, `WeaponRX`, `WeaponRY`, `WeaponRZ`, `WeaponSX`, `WeaponSY`, `WeaponSZ`, `WeaponBone`, `Savings`, `WireCutter`, `Wires`, `BadgeNo`, `WeedSeeds`, `Weed`, `BMXPermission`, `Heroin`, `PoppySeeds`, `Opium`, `HoldingInv`, `HoldingInvAmount`, `Origin`, `Lotto`, `PrimarySerial`, `SecondarySerial`, `Accent`, `Apperance`, `LastRam`, `LastRamTime`) VALUES
(1, 1, 'Ian_Stance', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 500, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 107, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `cmd_log`
--

CREATE TABLE `cmd_log` (
  `ID` int(11) NOT NULL,
  `AccountID` int(11) NOT NULL,
  `UserName` varchar(32) NOT NULL,
  `Command` varchar(32) NOT NULL,
  `Params` varchar(256) NOT NULL,
  `Timestamp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `complex`
--

CREATE TABLE `complex` (
  `ID` int(11) NOT NULL,
  `Name` varchar(33) NOT NULL,
  `Faction` int(11) NOT NULL,
  `OwnerID` int(11) NOT NULL,
  `ExteriorX` float NOT NULL,
  `ExteriorY` float NOT NULL,
  `ExteriorZ` float NOT NULL,
  `ExteriorA` float NOT NULL,
  `ExteriorInt` int(11) NOT NULL,
  `ExteriorVW` int(11) NOT NULL,
  `InteriorX` float NOT NULL,
  `InteriorY` float NOT NULL,
  `InteriorZ` float NOT NULL,
  `InteriorA` float NOT NULL,
  `InteriorInt` int(11) NOT NULL,
  `InteriorVW` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `criminalrecords`
--

CREATE TABLE `criminalrecords` (
  `ID` int(11) NOT NULL,
  `CharacterName` varchar(32) NOT NULL,
  `Charge` varchar(128) NOT NULL,
  `Timestamp` int(11) NOT NULL,
  `Active` int(11) NOT NULL,
  `OfficerID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `damages`
--

CREATE TABLE `damages` (
  `ID` int(11) NOT NULL,
  `WeaponID` int(11) NOT NULL,
  `Timestamp` int(11) NOT NULL,
  `Attacker` int(11) NOT NULL,
  `Victim` int(11) NOT NULL,
  `Type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dealership`
--

CREATE TABLE `dealership` (
  `ID` int(11) NOT NULL,
  `Name` varchar(32) NOT NULL,
  `Type` int(11) NOT NULL,
  `Price` int(11) NOT NULL,
  `OwnerID` int(11) NOT NULL,
  `PosX` float NOT NULL,
  `PosY` float NOT NULL,
  `PosZ` float NOT NULL,
  `SpawnX` float NOT NULL,
  `SpawnY` float NOT NULL,
  `SpawnZ` float NOT NULL,
  `SpawnA` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `donator_items`
--

CREATE TABLE `donator_items` (
  `ID` int(10) UNSIGNED NOT NULL,
  `ActivationString` varchar(32) NOT NULL,
  `BuyerID` int(10) UNSIGNED NOT NULL,
  `Type` int(11) NOT NULL,
  `BuyTimestamp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dynamic_labels`
--

CREATE TABLE `dynamic_labels` (
  `ID` int(10) UNSIGNED NOT NULL,
  `Text` varchar(144) NOT NULL,
  `AddedBy` varchar(25) NOT NULL,
  `AddedDate` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `entrances`
--

CREATE TABLE `entrances` (
  `ID` int(11) NOT NULL,
  `Name` varchar(128) NOT NULL,
  `FactionID` int(11) NOT NULL,
  `HouseID` int(11) NOT NULL,
  `BusinessID` int(11) NOT NULL,
  `X` float NOT NULL,
  `Y` float NOT NULL,
  `Z` float NOT NULL,
  `A` float NOT NULL,
  `OutsideInt` int(11) NOT NULL,
  `OutsideVW` int(11) NOT NULL,
  `IntX` float NOT NULL,
  `IntY` float NOT NULL,
  `IntZ` float NOT NULL,
  `IntA` float NOT NULL,
  `InsideInt` int(11) NOT NULL,
  `InsideVW` int(11) NOT NULL,
  `Locked` int(11) NOT NULL,
  `CustomExt` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `factions`
--

CREATE TABLE `factions` (
  `FactionID` int(11) NOT NULL,
  `FactionName` varchar(90) NOT NULL,
  `FactionAbbrev` varchar(30) NOT NULL,
  `FactionJoinRank` int(11) NOT NULL,
  `FactionAlterRank` int(11) NOT NULL,
  `FactionChatRank` int(11) NOT NULL,
  `FactionTowRank` int(11) NOT NULL,
  `FactionType` int(11) NOT NULL,
  `FactionSpawnX` float NOT NULL,
  `FactionSpawnY` float NOT NULL,
  `FactionSpawnZ` float NOT NULL,
  `FactionSpawnInterior` int(11) NOT NULL,
  `FactionSpawnWorld` int(11) NOT NULL,
  `FactionRank0` varchar(90) NOT NULL,
  `FactionRank1` varchar(90) NOT NULL,
  `FactionRank2` varchar(90) NOT NULL,
  `FactionRank3` varchar(90) NOT NULL,
  `FactionRank4` varchar(90) NOT NULL,
  `FactionRank5` varchar(90) NOT NULL,
  `FactionRank6` varchar(90) NOT NULL,
  `FactionRank7` varchar(90) NOT NULL,
  `FactionRank8` varchar(90) NOT NULL,
  `FactionRank9` varchar(90) NOT NULL,
  `FactionRank10` varchar(90) NOT NULL,
  `FactionRank11` varchar(90) NOT NULL,
  `FactionRank12` varchar(90) NOT NULL,
  `FactionRank13` varchar(90) NOT NULL,
  `FactionRank14` varchar(90) NOT NULL,
  `FactionRank15` varchar(90) NOT NULL,
  `FactionRank16` varchar(90) NOT NULL,
  `FactionRank17` varchar(90) NOT NULL,
  `FactionRank18` varchar(90) NOT NULL,
  `FactionRank19` varchar(90) NOT NULL,
  `FactionRank20` varchar(90) NOT NULL,
  `FactionRankPay1` int(11) NOT NULL,
  `FactionRankPay2` int(11) NOT NULL,
  `FactionRankPay3` int(11) NOT NULL,
  `FactionRankPay4` int(11) NOT NULL,
  `FactionRankPay5` int(11) NOT NULL,
  `FactionRankPay6` int(11) NOT NULL,
  `FactionRankPay7` int(11) NOT NULL,
  `FactionRankPay8` int(11) NOT NULL,
  `FactionRankPay9` int(11) NOT NULL,
  `FactionRankPay10` int(11) NOT NULL,
  `FactionRankPay11` int(11) NOT NULL,
  `FactionRankPay12` int(11) NOT NULL,
  `FactionRankPay13` int(11) NOT NULL,
  `FactionRankPay14` int(11) NOT NULL,
  `FactionRankPay15` int(11) NOT NULL,
  `FactionRankPay16` int(11) NOT NULL,
  `FactionRankPay17` int(11) NOT NULL,
  `FactionRankPay18` int(11) NOT NULL,
  `FactionRankPay19` int(11) NOT NULL,
  `FactionRankPay20` int(11) NOT NULL,
  `RamRaid` int(11) NOT NULL,
  `PoliceCall` int(11) NOT NULL,
  `MedicCall` int(11) NOT NULL,
  `GovernmentCall` int(11) NOT NULL,
  `Badge` int(11) NOT NULL,
  `Carsign` int(11) NOT NULL,
  `Cuff` int(11) NOT NULL,
  `Deploy` int(11) NOT NULL,
  `Backup` int(11) NOT NULL,
  `Departmental` int(11) NOT NULL,
  `Impound` int(11) NOT NULL,
  `Jail` int(11) NOT NULL,
  `Megaphone` int(11) NOT NULL,
  `Suspect` int(11) NOT NULL,
  `License` int(11) NOT NULL,
  `Seize` int(11) NOT NULL,
  `Taser` int(11) NOT NULL,
  `HQ` int(11) NOT NULL,
  `Gov` int(11) NOT NULL,
  `Siren` int(11) NOT NULL,
  `DutyAccess` int(11) NOT NULL,
  `Ticket` int(11) NOT NULL,
  `MDC` int(11) NOT NULL,
  `Medic` int(11) NOT NULL,
  `News` int(11) NOT NULL,
  `FactionSkin0` int(11) NOT NULL,
  `FactionSkin1` int(11) NOT NULL,
  `FactionSkin2` int(11) NOT NULL,
  `FactionSkin3` int(11) NOT NULL,
  `FactionSkin4` int(11) NOT NULL,
  `FactionSkin5` int(11) NOT NULL,
  `FactionSkin6` int(11) NOT NULL,
  `FactionSkin7` int(11) NOT NULL,
  `FactionSkin8` int(11) NOT NULL,
  `FactionSkin9` int(11) NOT NULL,
  `FactionSkin10` int(11) NOT NULL,
  `FactionSkin11` int(11) NOT NULL,
  `FactionSkin12` int(11) NOT NULL,
  `FactionSkin13` int(11) NOT NULL,
  `FactionSkin14` int(11) NOT NULL,
  `FactionSkin15` int(11) NOT NULL,
  `FactionSkin16` int(11) NOT NULL,
  `FactionSkin17` int(11) NOT NULL,
  `FactionSkin18` int(11) NOT NULL,
  `FactionSkin19` int(11) NOT NULL,
  `Tag` int(11) NOT NULL,
  `RamRaidPerm` int(11) NOT NULL,
  `Economy` int(11) NOT NULL,
  `DrugRights` int(11) NOT NULL,
  `FactionWeapon0` int(11) NOT NULL,
  `FactionWeapon1` int(11) NOT NULL,
  `FactionWeapon2` int(11) NOT NULL,
  `FactionWeapon3` int(11) NOT NULL,
  `FactionWeapon4` int(11) NOT NULL,
  `FactionWeapon5` int(11) NOT NULL,
  `FactionWeapon6` int(11) NOT NULL,
  `FactionWeapon7` int(11) NOT NULL,
  `FactionWeapon8` int(11) NOT NULL,
  `FactionWeapon9` int(11) NOT NULL,
  `FactionWeapon10` int(11) NOT NULL,
  `ChatColour` int(11) NOT NULL,
  `FactionDutyX` float NOT NULL,
  `FactionDutyY` float NOT NULL,
  `FactionDutyZ` float NOT NULL,
  `FactionDutyInterior` int(11) NOT NULL,
  `FactionDutyWorld` int(11) NOT NULL,
  `WeaponDelivery` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `factionskin`
--

CREATE TABLE `factionskin` (
  `ID` int(10) UNSIGNED NOT NULL,
  `SkinID` int(10) UNSIGNED NOT NULL,
  `FactionID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `factionweapon`
--

CREATE TABLE `factionweapon` (
  `ID` int(10) UNSIGNED NOT NULL,
  `WeaponID` int(10) UNSIGNED NOT NULL,
  `Ammo` int(10) UNSIGNED NOT NULL,
  `FactionID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fines`
--

CREATE TABLE `fines` (
  `ID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `OfficerID` int(11) NOT NULL,
  `FactionID` int(11) NOT NULL,
  `Reason` varchar(128) NOT NULL,
  `Timestamp` int(11) NOT NULL,
  `Amount` int(11) NOT NULL,
  `Active` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `furniture`
--

CREATE TABLE `furniture` (
  `ID` int(10) UNSIGNED NOT NULL,
  `HouseID` int(10) UNSIGNED NOT NULL,
  `ModelID` int(10) UNSIGNED NOT NULL,
  `ObjectName` varchar(128) NOT NULL,
  `X` float NOT NULL,
  `Y` float NOT NULL,
  `Z` float NOT NULL,
  `RX` float NOT NULL,
  `RY` float NOT NULL,
  `RZ` float NOT NULL,
  `World` int(11) NOT NULL,
  `Interior` int(11) NOT NULL,
  `AddedBy` varchar(25) NOT NULL,
  `AddedDate` varchar(32) NOT NULL,
  `TXD1` varchar(32) NOT NULL,
  `Texture1` varchar(32) NOT NULL,
  `Colour1` int(11) NOT NULL,
  `ModelID1` int(11) NOT NULL,
  `TXD2` varchar(32) NOT NULL,
  `Texture2` varchar(32) NOT NULL,
  `Colour2` int(11) NOT NULL,
  `ModelID2` int(11) NOT NULL,
  `TXD3` varchar(32) NOT NULL,
  `Texture3` varchar(32) NOT NULL,
  `Colour3` int(11) NOT NULL,
  `ModelID3` int(11) NOT NULL,
  `TXD4` varchar(32) NOT NULL,
  `Texture4` varchar(32) NOT NULL,
  `Colour4` int(11) NOT NULL,
  `ModelID4` int(11) NOT NULL,
  `TXD5` varchar(32) NOT NULL,
  `Texture5` varchar(32) NOT NULL,
  `Colour5` int(11) NOT NULL,
  `ModelID5` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `furn_texture`
--

CREATE TABLE `furn_texture` (
  `ID` int(11) NOT NULL,
  `FurnID` int(11) NOT NULL,
  `TXD` varchar(32) NOT NULL,
  `Texture` varchar(32) NOT NULL,
  `Colour` int(11) NOT NULL,
  `ModelID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `garbage`
--

CREATE TABLE `garbage` (
  `garbageID` int(11) NOT NULL,
  `garbageModel` int(11) NOT NULL,
  `garbageCapacity` int(11) NOT NULL,
  `garbageX` float NOT NULL,
  `garbageY` float NOT NULL,
  `garbageZ` float NOT NULL,
  `garbageA` float NOT NULL,
  `garbageInterior` int(11) NOT NULL,
  `garbageWorld` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gas_pumps`
--

CREATE TABLE `gas_pumps` (
  `ID` int(11) NOT NULL,
  `PosX` float NOT NULL,
  `PosY` float NOT NULL,
  `PosZ` float NOT NULL,
  `PosRX` float NOT NULL,
  `PosRY` float NOT NULL,
  `PosRZ` float NOT NULL,
  `Interior` int(11) NOT NULL,
  `VW` int(11) NOT NULL,
  `Business` int(11) NOT NULL,
  `Price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gates`
--

CREATE TABLE `gates` (
  `ID` int(11) NOT NULL,
  `FactionID` int(11) NOT NULL,
  `Locked` int(11) NOT NULL,
  `Type` int(11) NOT NULL,
  `ClosedPosX` float NOT NULL,
  `ClosedPosY` float NOT NULL,
  `ClosedPosZ` float NOT NULL,
  `ClosedPosRX` float NOT NULL,
  `ClosedPosRY` float NOT NULL,
  `ClosedPosRZ` float NOT NULL,
  `OpenPosX` float NOT NULL,
  `OpenPosY` float NOT NULL,
  `OpenPosZ` float NOT NULL,
  `OpenPosRX` float NOT NULL,
  `OpenPosRY` float NOT NULL,
  `OpenPosRZ` float NOT NULL,
  `Interior` int(11) NOT NULL,
  `VW` int(11) NOT NULL,
  `Speed` float NOT NULL,
  `Distance` float NOT NULL,
  `ModelID` int(11) NOT NULL,
  `Code` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `graffiti`
--

CREATE TABLE `graffiti` (
  `ID` int(11) NOT NULL,
  `Text` varchar(128) NOT NULL,
  `PlacedBy` int(11) NOT NULL,
  `PlaceTime` int(11) NOT NULL,
  `X` float NOT NULL,
  `Y` float NOT NULL,
  `Z` float NOT NULL,
  `A` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hacker_log`
--

CREATE TABLE `hacker_log` (
  `ID` int(11) NOT NULL,
  `AccountID` int(11) NOT NULL,
  `Username` varchar(32) NOT NULL,
  `Action` varchar(128) NOT NULL,
  `Timestamp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `helperacceptance`
--

CREATE TABLE `helperacceptance` (
  `TokenID` int(11) NOT NULL,
  `Date` varchar(10) NOT NULL,
  `Hour` int(11) NOT NULL,
  `ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `houses`
--

CREATE TABLE `houses` (
  `ID` int(11) NOT NULL,
  `OwnerID` int(11) UNSIGNED NOT NULL,
  `MarketPrice` int(11) NOT NULL,
  `ExteriorX` float NOT NULL,
  `ExteriorY` float NOT NULL,
  `ExteriorZ` float NOT NULL,
  `ExteriorA` float NOT NULL,
  `ExteriorInt` int(11) NOT NULL,
  `ExteriorVW` int(11) NOT NULL,
  `InteriorX` float NOT NULL,
  `InteriorY` float NOT NULL,
  `InteriorZ` float NOT NULL,
  `InteriorA` float NOT NULL,
  `InteriorInt` int(11) NOT NULL,
  `Locked` int(11) NOT NULL,
  `CashBox` int(11) NOT NULL,
  `Weapons0` int(11) NOT NULL,
  `Weapons1` int(11) NOT NULL,
  `Weapons2` int(11) NOT NULL,
  `Weapons3` int(11) NOT NULL,
  `Weapons4` int(11) NOT NULL,
  `Weapons5` int(11) NOT NULL,
  `Weapons6` int(11) NOT NULL,
  `Weapons7` int(11) NOT NULL,
  `Weapons8` int(11) NOT NULL,
  `Weapons9` int(11) NOT NULL,
  `Weapons10` int(11) NOT NULL,
  `Weapons11` int(11) NOT NULL,
  `Weapons12` int(11) NOT NULL,
  `Weapons13` int(11) NOT NULL,
  `Weapons14` int(11) NOT NULL,
  `Weapons15` int(11) NOT NULL,
  `Weapons16` int(11) NOT NULL,
  `Weapons17` int(11) NOT NULL,
  `Weapons18` int(11) NOT NULL,
  `Weapons19` int(11) NOT NULL,
  `Weapons20` int(11) NOT NULL,
  `WeaponsAmmo0` int(11) NOT NULL,
  `WeaponsAmmo1` int(11) NOT NULL,
  `WeaponsAmmo2` int(11) NOT NULL,
  `WeaponsAmmo3` int(11) NOT NULL,
  `WeaponsAmmo4` int(11) NOT NULL,
  `WeaponsAmmo5` int(11) NOT NULL,
  `WeaponsAmmo6` int(11) NOT NULL,
  `WeaponsAmmo7` int(11) NOT NULL,
  `WeaponsAmmo8` int(11) NOT NULL,
  `WeaponsAmmo9` int(11) NOT NULL,
  `WeaponsAmmo10` int(11) NOT NULL,
  `WeaponsAmmo11` int(11) NOT NULL,
  `WeaponsAmmo12` int(11) NOT NULL,
  `WeaponsAmmo13` int(11) NOT NULL,
  `WeaponsAmmo14` int(11) NOT NULL,
  `WeaponsAmmo15` int(11) NOT NULL,
  `WeaponsAmmo16` int(11) NOT NULL,
  `WeaponsAmmo17` int(11) NOT NULL,
  `WeaponsAmmo18` int(11) NOT NULL,
  `WeaponsAmmo19` int(11) NOT NULL,
  `WeaponsAmmo20` int(11) NOT NULL,
  `WeaponsSerial0` int(11) NOT NULL,
  `WeaponsSerial1` int(11) NOT NULL,
  `WeaponsSerial2` int(11) NOT NULL,
  `WeaponsSerial3` int(11) NOT NULL,
  `WeaponsSerial4` int(11) NOT NULL,
  `WeaponsSerial5` int(11) NOT NULL,
  `WeaponsSerial6` int(11) NOT NULL,
  `WeaponsSerial7` int(11) NOT NULL,
  `WeaponsSerial8` int(11) NOT NULL,
  `WeaponsSerial9` int(11) NOT NULL,
  `WeaponsSerial10` int(11) NOT NULL,
  `WeaponsSerial11` int(11) NOT NULL,
  `WeaponsSerial12` int(11) NOT NULL,
  `WeaponsSerial13` int(11) NOT NULL,
  `WeaponsSerial14` int(11) NOT NULL,
  `WeaponsSerial15` int(11) NOT NULL,
  `WeaponsSerial16` int(11) NOT NULL,
  `WeaponsSerial17` int(11) NOT NULL,
  `WeaponsSerial18` int(11) NOT NULL,
  `WeaponsSerial19` int(11) NOT NULL,
  `WeaponsSerial20` int(11) NOT NULL,
  `PlacePosX` float NOT NULL,
  `PlacePosY` float NOT NULL,
  `PlacePosZ` float NOT NULL,
  `Boombox` int(11) NOT NULL,
  `RentFee` int(11) NOT NULL,
  `Rentable` int(11) NOT NULL,
  `Wired` int(11) NOT NULL,
  `Address` varchar(128) NOT NULL,
  `CustomExterior` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `house_wep`
--

CREATE TABLE `house_wep` (
  `ID` int(11) NOT NULL,
  `WeaponID` int(11) NOT NULL,
  `WeaponAmmo` int(11) NOT NULL,
  `HouseID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `h_bolopersons`
--

CREATE TABLE `h_bolopersons` (
  `ID` int(11) NOT NULL,
  `facID` int(11) DEFAULT NULL,
  `reporter` varchar(32) DEFAULT NULL,
  `suspect` varchar(32) DEFAULT NULL,
  `reason` varchar(128) DEFAULT NULL,
  `date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `h_bolovehicles`
--

CREATE TABLE `h_bolovehicles` (
  `ID` int(11) NOT NULL,
  `facID` int(11) DEFAULT NULL,
  `reporter` varchar(32) DEFAULT NULL,
  `plate` varchar(32) DEFAULT NULL,
  `model` varchar(128) DEFAULT NULL,
  `description` varchar(128) DEFAULT NULL,
  `reason` varchar(128) DEFAULT NULL,
  `date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ic_log`
--

CREATE TABLE `ic_log` (
  `ID` int(11) NOT NULL,
  `AccountID` int(11) NOT NULL,
  `UserName` varchar(32) NOT NULL,
  `Message` varchar(144) NOT NULL,
  `Timestamp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ig_announcement`
--

CREATE TABLE `ig_announcement` (
  `ID` int(10) UNSIGNED NOT NULL,
  `UserID` int(10) UNSIGNED NOT NULL,
  `Message` varchar(128) NOT NULL,
  `Type` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `CreatedAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jails`
--

CREATE TABLE `jails` (
  `ID` int(11) NOT NULL,
  `PosX` float NOT NULL,
  `PosY` float NOT NULL,
  `PosZ` float NOT NULL,
  `PosA` float NOT NULL,
  `Interior` int(11) NOT NULL,
  `VirtualWorld` int(11) NOT NULL,
  `FactionID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jail_sentences`
--

CREATE TABLE `jail_sentences` (
  `ID` int(11) NOT NULL,
  `FactionID` int(11) NOT NULL,
  `OfficerID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `Timestamp` int(11) NOT NULL,
  `Time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kick_logs`
--

CREATE TABLE `kick_logs` (
  `ID` int(11) NOT NULL,
  `KickedDBID` int(11) NOT NULL,
  `KickedName` varchar(32) NOT NULL,
  `Reason` varchar(128) NOT NULL,
  `KickedBy` varchar(32) NOT NULL,
  `Date` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kills`
--

CREATE TABLE `kills` (
  `ID` int(11) NOT NULL,
  `CharacterID` int(11) NOT NULL,
  `KillerID` int(11) NOT NULL,
  `Date` int(11) NOT NULL,
  `WeaponID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mapping`
--

CREATE TABLE `mapping` (
  `ID` int(11) NOT NULL,
  `ModelID` int(11) NOT NULL,
  `X` float NOT NULL,
  `Y` float NOT NULL,
  `Z` float NOT NULL,
  `RX` float NOT NULL,
  `RY` float NOT NULL,
  `RZ` float NOT NULL,
  `DrawDistance` float NOT NULL,
  `Name` varchar(32) NOT NULL,
  `TextureModelID0` int(11) NOT NULL,
  `TextureModelID1` int(11) NOT NULL,
  `TextureModelID2` int(11) NOT NULL,
  `TextureModelID3` int(11) NOT NULL,
  `TextureModelID4` int(11) NOT NULL,
  `TextureModelID5` int(11) NOT NULL,
  `TextureModelID6` int(11) NOT NULL,
  `TextureModelID7` int(11) NOT NULL,
  `TextureModelID8` int(11) NOT NULL,
  `TextureModelID9` int(11) NOT NULL,
  `TextureModelID10` int(11) NOT NULL,
  `TextureModelID11` int(11) NOT NULL,
  `TextureModelID12` int(11) NOT NULL,
  `TextureModelID13` int(11) NOT NULL,
  `TextureModelID14` int(11) NOT NULL,
  `TextureModelID15` int(11) NOT NULL,
  `TextureName0` varchar(32) NOT NULL,
  `TextureName1` varchar(32) NOT NULL,
  `TextureName2` varchar(32) NOT NULL,
  `TextureName3` varchar(32) NOT NULL,
  `TextureName4` varchar(32) NOT NULL,
  `TextureName5` varchar(32) NOT NULL,
  `TextureName6` varchar(32) NOT NULL,
  `TextureName7` varchar(32) NOT NULL,
  `TextureName8` varchar(32) NOT NULL,
  `TextureName9` varchar(32) NOT NULL,
  `TextureName10` varchar(32) NOT NULL,
  `TextureName11` varchar(32) NOT NULL,
  `TextureName12` varchar(32) NOT NULL,
  `TextureName13` varchar(32) NOT NULL,
  `TextureName14` varchar(32) NOT NULL,
  `TextureName15` varchar(32) NOT NULL,
  `TextureTXD0` varchar(32) NOT NULL,
  `TextureTXD1` varchar(32) NOT NULL,
  `TextureTXD2` varchar(32) NOT NULL,
  `TextureTXD3` varchar(32) NOT NULL,
  `TextureTXD4` varchar(32) NOT NULL,
  `TextureTXD5` varchar(32) NOT NULL,
  `TextureTXD6` varchar(32) NOT NULL,
  `TextureTXD7` varchar(32) NOT NULL,
  `TextureTXD8` varchar(32) NOT NULL,
  `TextureTXD9` varchar(32) NOT NULL,
  `TextureTXD10` varchar(32) NOT NULL,
  `TextureTXD11` varchar(32) NOT NULL,
  `TextureTXD12` varchar(32) NOT NULL,
  `TextureTXD13` varchar(32) NOT NULL,
  `TextureTXD14` varchar(32) NOT NULL,
  `TextureTXD15` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `mapping`
--

INSERT INTO `mapping` (`ID`, `ModelID`, `X`, `Y`, `Z`, `RX`, `RY`, `RZ`, `DrawDistance`, `Name`, `TextureModelID0`, `TextureModelID1`, `TextureModelID2`, `TextureModelID3`, `TextureModelID4`, `TextureModelID5`, `TextureModelID6`, `TextureModelID7`, `TextureModelID8`, `TextureModelID9`, `TextureModelID10`, `TextureModelID11`, `TextureModelID12`, `TextureModelID13`, `TextureModelID14`, `TextureModelID15`, `TextureName0`, `TextureName1`, `TextureName2`, `TextureName3`, `TextureName4`, `TextureName5`, `TextureName6`, `TextureName7`, `TextureName8`, `TextureName9`, `TextureName10`, `TextureName11`, `TextureName12`, `TextureName13`, `TextureName14`, `TextureName15`, `TextureTXD0`, `TextureTXD1`, `TextureTXD2`, `TextureTXD3`, `TextureTXD4`, `TextureTXD5`, `TextureTXD6`, `TextureTXD7`, `TextureTXD8`, `TextureTXD9`, `TextureTXD10`, `TextureTXD11`, `TextureTXD12`, `TextureTXD13`, `TextureTXD14`, `TextureTXD15`) VALUES
(1, 19425, -197.028, 998.286, 18.5581, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(3, 19966, -60.1944, 1188.4, 18.5794, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(4, 19966, -205.609, 1012.94, 18.6422, 0, 0, -91.6999, 0, 'Stop Sign', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(5, 19966, -55.4699, 1153.53, 18.6078, 0, 0, 89.4, 0, 'Stop Sign', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(6, 1229, -159.04, 1093.04, 20.2722, 0, 0, -84.6, 0, 'Bus Sign', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(7, 19987, -188.014, 969.094, 17.542, 0, 0, 0, 0, '30mph', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(8, 19991, -198.514, 970.823, 17.3726, 0, 0, -179.3, 0, '50mph', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(12, 19987, 99.2974, 1203.64, 18.0767, 0, 0, 91.2001, 0, '30mph', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(14, 19991, 93.2792, 1192.78, 17.1643, 0, 0, -87.4999, 0, '50mph', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(15, 19966, -285.726, 1143.17, 18.5022, 0, 0, -86, 0, 'Stop', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(17, 1536, 62.7434, 1172.57, 18.1341, 0, 0, 0, 0, 'SD Door', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(18, 1536, 65.7522, 1172.64, 18.1341, 0, 0, -178.6, 0, 'SD Door', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(19, 19966, -112.847, 1244.8, 15.8283, 0, 9.8, 0, 0, 'Stop Sign', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(21, 19976, -180.305, 1153.82, 18.49, 0, 0, 67, 0, 'Yield', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(22, 19949, -180.308, 1153.82, 19.2, 0, 0, 75, 0, 'No Left Turn', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(23, 19971, -190.879, 1150.79, 18.4773, 0, 0, 88.9, 0, 'One Way Right', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(24, 19950, -190.941, 1136.92, 18.6169, 0, 0, 170.3, 0, 'Wrong Wat', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(25, 19950, -195.206, 1111.04, 18.5177, 0, 0, 0, 0, 'Wrong Wat', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(26, 19950, -190.902, 1085.75, 18.6469, 0, 0, 176.6, 0, 'Wrong Wat', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(27, 19950, -195.199, 1030.98, 18.6791, 0, 0, 0, 0, 'Wrong Wat', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(30, 11245, -207.926, 1119.18, 29.1789, 0, -70.4, 0, 0, 'flag', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(31, 3655, -98.7731, 1046.83, 21.8192, 0, 0, 0, 0, 'House', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(34, 19963, -245.861, 844.895, 11.2034, 0, 0, 133.6, 0, 'Intersection', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(35, 19966, -290.196, 820.575, 12.9256, 0, 0, 113.8, 0, 'Intersection', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(36, 19952, -303.933, 812.23, 12.9141, 0, 0, 111.4, 0, 'Right Chevron', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(37, 19951, -303.366, 811.024, 12.9286, 0, 0, 117.9, 0, 'Left Chevron', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(38, 19903, 104.476, 1162, 17.6865, 0, 0, -149.9, 0, 'Workstation PC', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(39, 19899, 104.636, 1159.28, 17.6541, 0, 0, -179.7, 0, 'Mechanic Drawer', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(41, 10184, -1631.51, 688.358, 8.63565, 0, 0, -90.3999, 0, 'SF Cop Door', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(42, 19374, -1620.63, 692.893, 7.02984, 0, 0, 0, 0, 'Wall', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(43, 19369, -1621.98, 692.47, 7.92281, 0, 0, 0, 0, 'Wall', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(45, 970, 77.2128, 1188.35, 18.2162, 0, 0, 0, 0, 'fencesmallb', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(46, 970, 73.0602, 1188.34, 18.2134, 0, 0, 0, 0, 'fencesmallb', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(47, 745, 72.3729, 1184.7, 17.6558, 0, 0, 0, 0, 'Cactus', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(48, 756, 68.7972, 1186.22, 17.8829, 0, 0, 0, 0, 'Cactus', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(49, 17064, 43.6687, 1219.68, 17.8998, -0.1, 0, 93.9, 0, 'Gas Station', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(50, 7391, 68.8873, 1229.82, 22.4014, 0, 0, 0, 0, 'Gas Station Sign', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(52, 970, 81.3787, 1188.33, 18.2008, 0, 0, 0, 0, 'fencesmallb', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(53, 970, 85.5287, 1188.33, 18.2008, 0, 0, 0, 0, 'fencesmallb', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(54, 970, 89.6687, 1188.33, 18.2008, 0, 0, 0, 0, 'fencesmallb', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(55, 970, 93.7687, 1188.33, 18.2008, 0, 0, 0, 0, 'fencesmallb', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(56, 966, 105.171, 1187.75, 17.6541, 0, 0, 0, 0, 'Barrier Base', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(57, 970, 95.8587, 1188.33, 18.2008, 0, 0, 0, 0, 'fencesmallb', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(58, 970, 68.9302, 1188.34, 18.2134, 0, 0, 0, 0, 'fencesmallb', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(59, 970, 64.8102, 1188.34, 18.2134, 0, 0, 0, 0, 'fencesmallb', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(60, 970, 60.6802, 1188.34, 18.2534, 0, 0.6, 0, 0, 'fencesmallb', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(61, 970, 56.5504, 1188.34, 18.2966, 0, 0.6, 0, 0, 'fencesmallb', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(63, 970, 48.3208, 1188.34, 18.3828, 0, 0.6, 0, 0, 'fencesmallb', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(64, 970, 44.1911, 1188.34, 18.4261, 0, 0.6, 0, 0, 'fencesmallb', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(67, 970, 40.0713, 1188.34, 18.4692, 0, 0.6, 0, 0, 'fencesmallb', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(68, 970, 36.215, 1187.31, 18.5097, 0, 0.6, 29.8, 0, 'fencesmallb', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(70, 17065, 63.8559, 1218.67, 21.9732, 0, 0, 0, 0, 'Gas Station Canopy', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(71, 19425, -189.078, 998.286, 18.5581, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(72, 19425, -185.948, 998.286, 18.5581, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(73, 19425, -200.178, 998.286, 18.5581, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(75, 3820, -233.805, 1113.21, 14.2122, 0, 0, 0, 0, 'Ground', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(76, 3820, -230.126, 1123.17, 14.2122, 0, 0, 0, 0, 'Ground', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(99, 11714, 59.2084, 1165.43, 27.5841, 0, 0, 90.7, 0, 'SD Door', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(101, 3934, 69.5737, 1162.53, 26.3341, 0, 0, 0, 0, 'Helipad', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(102, 7391, 82.2873, 1206.57, 22.5714, 0, 0, 0, 0, 'Gas Station Sign', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(109, 8674, -235.563, 1129.81, 20.1792, 0, 0, 0, 0, 'csrsfence02_lvs', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(111, 8674, -220.019, 1124.67, 20.1792, 0, 0, -89.3, 0, 'csrsfence02_lvs', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(113, 8674, -230.348, 1108.26, 20.6722, 0, 0, 0, 0, 'Fence', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(114, 8674, -220.048, 1108.27, 20.6722, 0, 0, 0, 0, 'Fence', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(115, 8674, -214.939, 1113.42, 20.6722, 0, 0, 90.8, 0, 'Fence', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(116, 8674, -214.939, 1113.42, 17.7422, 0, 0, 90.8, 0, 'Fence', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(123, 8674, -240.649, 1124.69, 20.1622, 0, 0, 90.8, 0, 'Fence', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(125, 8674, -240.577, 1119.55, 20.1622, 0, 0, 90.8, 0, 'Fence', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(127, 11714, -223.672, 1123.24, 19.9722, 0, 0, -90, 0, 'Town Hall Door', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(128, 11714, -222.699, 1123.24, 19.7422, 0, 0, -90.1, 0, 'Town Hall Door', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(130, 8674, -225.258, 1129.85, 20.1522, 0, 0, 0, 0, 'Fence', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(133, 19425, -197.028, 1111.44, 18.5581, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(134, 19425, -200.158, 1111.44, 18.5581, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(135, 19425, -200.158, 1129.72, 18.5581, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(136, 19425, -197.038, 1129.72, 18.5581, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(137, 19425, -189.088, 1111.44, 18.5581, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(138, 19425, -185.928, 1111.44, 18.5581, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(139, 19425, -189.038, 1129.72, 18.5581, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(141, 19966, 111.482, 1191.46, 16.9079, -3.6, 5.7, -93.7, 0, 'Traffic light', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(143, 19983, -200.732, 1181.34, 18.7537, 0, 0, 179.8, 0, '10mph', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(144, 19983, -185.135, 1027.7, 18.7537, 0, 0, -4.49999, 0, '10mph', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(147, 19425, -185.868, 1129.72, 18.5581, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(148, 1560, 47.958, 1217.78, 17.9243, 0.1, 0, -87.0999, 0, 'Door.', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(155, 1622, -59.837, 1287.82, 17.3062, 0, 0, 25.4, 0, 'Camera', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(160, 19966, -78.3943, 1272.85, 11.1461, 0, 0, 175.1, 0, 'stop sign', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(161, 19966, -72.675, 1356.68, 8.99087, 7.7, 9.7, -95.7, 0, 'Stop Sign', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(162, 19966, -111.113, 814.476, 19.132, 0, 0, 21.9, 0, 'stop sign', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(163, 1352, 217.955, 959.673, 27.1408, 0, 0, -66.1, 0, 'Traffic lights', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(164, 1352, 232.289, 980.232, 27.2233, 0, 0, 115.2, 0, 'Traffic lights', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(165, 1352, 215.187, 975.735, 27.1823, 0, 0, -156.7, 0, 'Traffic Lights', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(166, 1352, 236.306, 966.43, 26.9667, 0, 0, 14.7, 0, 'Traffic Lights', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(167, 19964, 245.165, 943.433, 26.0896, 0, 0, 20.6, 0, 'Traffic Light Warning', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(168, 19964, 266.758, 994.444, 27.2852, 0, 0, 100.7, 0, 'Traffic Light Warning', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(169, 19964, 187.698, 935.479, 24.9733, 0, 0, -32.2, 0, 'TLW', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(170, 19964, 198.82, 1022.65, 23.5866, 0, 0, -161.8, 0, 'Traffic Light Warning', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(171, 19966, -835.224, 1497.43, 17.7527, 0, 0, 94, 0, 'Stop sign.', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(173, 19966, -772.638, 1531.72, 26.3966, 0, 0, -87.9, 0, 'Stop sign.', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(174, 19966, -803.173, 1566.8, 26.1572, 0, 0, -5.3, 0, 'Stop sign.', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(175, 19966, -798.675, 1582.2, 25.8018, 0, 0, 90.1999, 0, 'Stop sign.', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(176, 19966, -850.81, 1622.32, 25.5291, 0, 0, 90.7, 0, 'Stop sign.', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(177, 970, -290.405, 1051.08, 19.2422, 0, 0, 89.7, 0, 'Fence', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(179, 970, -290.426, 1046.94, 19.2422, 0, 0, 89.7, 0, 'Fence', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(180, 970, -290.448, 1042.79, 19.2422, 0, 0, 89.7, 0, 'Fence', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(181, 970, -290.47, 1038.64, 19.2422, 0, 0, 89.7, 0, 'Fence', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(182, 970, -290.491, 1034.51, 19.2422, 0, 0, 89.7, 0, 'Fence', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(183, 970, -290.513, 1030.36, 19.2422, 0, 0, 89.7, 0, 'Fence', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(184, 970, -290.535, 1026.21, 19.2422, 0, 0, 89.7, 0, 'Fence', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(185, 970, -290.556, 1022.08, 19.2422, 0, 0, 89.7, 0, 'Fence', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(186, 970, -290.578, 1017.96, 19.2422, 0, 0, 89.7, 0, 'Fence', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(187, 970, -290.6, 1013.81, 19.2422, 0, 0, 89.7, 0, 'Fence', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(188, 970, -290.621, 1009.65, 19.2422, 0, 0, 89.7, 0, 'Fence', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(189, 970, -290.632, 1007.55, 19.2422, 0, 0, 89.7, 0, 'Fence', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(190, 970, -292.748, 1005.48, 19.2422, 0, 0, -179.6, 0, 'Fence', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(191, 970, -296.878, 1005.45, 19.2422, 0, 0, -179.6, 0, 'Fence', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(192, 970, -300.998, 1005.42, 19.2422, 0, 0, -179.6, 0, 'Fence', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(193, 970, -305.068, 1005.39, 19.2422, 0, 0, -179.6, 0, 'Fence', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(194, 970, -307.158, 1005.38, 19.2422, 0, 0, -179.6, 0, 'Fence', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(195, 970, -309.214, 1007.42, 19.2422, 0, 0, 89.7, 0, 'Fence', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(196, 970, -309.192, 1011.52, 19.2422, 0, 0, 89.7, 0, 'Fence', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(197, 970, -309.171, 1015.64, 19.2422, 0, 0, 89.7, 0, 'Fence', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(198, 970, -309.149, 1019.77, 19.2422, 0, 0, 89.7, 0, 'Fence', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(199, 966, -290.859, 1053.13, 18.5437, 0, 0, 0, 0, 'Barrier Base', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(200, 970, -300, 1053.09, 19.0922, 0, 0, -179.6, 0, 'Fence', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(201, 745, 63.7129, 1184.7, 17.6558, 0, 0, 91.8, 0, 'Cactus', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(202, 745, 57.6659, 1184.51, 17.6558, 0, 0, 48.6, 0, 'Cactus', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(212, 745, 46.1555, 1184.61, 17.3569, 0, -0.600001, -101.5, 0, 'fencesmallb', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(213, 19966, 173.708, 1139.71, 13.2005, 0, 0, -127.2, 0, 'Stop sign', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(224, 1334, 615.721, 1236.05, 11.6087, 0, 0, -60.6, 0, 'Trash', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(225, 1334, 610.605, 1244.71, 11.5888, 0, 0, -62.5, 0, 'Trash', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(226, 1334, 613.09, 1240.55, 11.5587, 0, 0, -60.7, 0, 'Trash', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(237, 3578, 52.6262, 1188.09, 17.1273, 0, 0.5, 0, 0, 'xxx', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(243, 19951, 54.4469, 1174.12, 16.2041, 0, 0, -179.1, 0, 'Arroqw', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(244, 19967, 85.9532, 1224.66, 18.6125, 0, 0.3, 147.8, 0, 'Do not enter.', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(245, 19967, 73.1343, 1232.06, 17.6124, 0, 0, 147.8, 0, 'Do not enter.', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(255, 966, -235.192, 1108.88, 18.6692, 0, 0, -39.7, 0, 'Barrier Base GOV', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(256, 19951, 53.537, 1174.11, 16.2041, 0, 0, -179.1, 0, 'Arroqw', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(257, 19951, 121.05, 1183.22, 14.9974, 0, 0, -163.1, 0, 'Right Chev', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(258, 19951, 124.807, 1178.35, 14.8174, 0, 0, -163.1, 0, 'Right Chev', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(259, 19951, 100.043, 1230.57, 18.7666, 0, 0, 22.6, 0, 'Right Chev', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(260, 19951, 88.9542, 1238.55, 18.7666, 0, 0, 34.8, 0, 'Right Chev', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(261, 19976, 106.027, 1188.61, 16.9941, 0, 0, -19.8, 0, 'Yield', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(262, 1560, 47.8826, 1219.26, 17.9243, 0.1, 0, -87.0999, 0, 'Door.', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(263, 11497, -174.187, 1001.2, 18.7737, 0, 0, 180, 0, 'Fish Shop', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(264, 970, 62.3287, 1208.37, 18.3163, 0, 0, 0, 0, 'Gas Fence', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(265, 970, 58.2087, 1208.37, 18.3163, 0, 0, 0, 0, 'Gas Fence', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(266, 970, 54.0892, 1208.37, 18.3563, 0, 0.8, 0, 0, 'Gas Fence', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(267, 970, 49.9596, 1208.37, 18.414, 0, 0.8, 0, 0, 'Gas Fence', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(268, 970, 45.9672, 1209.16, 18.4633, 0, 0.8, -22.2, 0, 'Gas Fence', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(269, 19905, -231.131, 1216.64, 18.5722, 0, 0, 0, 0, 'Fire Dept', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(271, 19859, -241.774, 1224.39, 19.7422, 0, 0, 0, 0, 'door', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(272, 19379, -111.463, 1216.46, 281.909, 0, -90.2, 0, 0, 'Floor', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(273, 19391, -106.343, 1213.25, 283.733, 0, 0, 0, 0, 'Door', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(274, 19362, -106.343, 1216.44, 283.733, 0, 0, 0, 0, 'Door', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(275, 19362, -106.343, 1219.65, 283.733, 0, 0, 0, 0, 'Door', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(276, 19362, -116.613, 1219.65, 283.733, 0, 0, 0, 0, 'Door', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(277, 19362, -116.613, 1216.45, 283.733, 0, 0, 0, 0, 'Door', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(278, 19362, -116.613, 1213.26, 283.733, 0, 0, 0, 0, 'Door', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `ID` int(10) UNSIGNED NOT NULL,
  `Timestamp` int(10) UNSIGNED NOT NULL,
  `Poster` varchar(32) NOT NULL,
  `Message` text NOT NULL,
  `Title` varchar(128) NOT NULL,
  `Draft` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ooc_log`
--

CREATE TABLE `ooc_log` (
  `ID` int(11) NOT NULL,
  `AccountID` int(11) NOT NULL,
  `UserName` varchar(32) NOT NULL,
  `Message` varchar(144) NOT NULL,
  `Timestamp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `phone_contacts`
--

CREATE TABLE `phone_contacts` (
  `ID` int(11) NOT NULL,
  `OwnerID` int(11) NOT NULL,
  `Name` varchar(128) NOT NULL,
  `Number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `players`
--

CREATE TABLE `players` (
  `id` int(11) NOT NULL,
  `username` varchar(128) NOT NULL,
  `password` varchar(256) NOT NULL,
  `SecretWord` varchar(256) NOT NULL,
  `deaths` int(11) NOT NULL,
  `kills` int(11) NOT NULL,
  `x` float NOT NULL,
  `y` float NOT NULL,
  `z` float NOT NULL,
  `angle` float NOT NULL,
  `interior` int(11) NOT NULL,
  `virtualworld` int(11) NOT NULL,
  `AdminLevel` int(11) NOT NULL,
  `HelperLevel` int(11) NOT NULL,
  `ChangePassword` int(11) NOT NULL,
  `OfflineJailed` int(11) NOT NULL,
  `OfflineJailTime` int(11) NOT NULL,
  `OfflineJailReason` varchar(32) NOT NULL,
  `OfflineJailAdmin` varchar(24) NOT NULL,
  `DonateLevel` int(11) NOT NULL,
  `DonateExpire` int(11) NOT NULL,
  `Ajailed` int(11) NOT NULL,
  `AjailTime` int(11) NOT NULL,
  `AjailReason` varchar(128) NOT NULL,
  `AjailedBy` varchar(25) NOT NULL,
  `PassedTest` int(11) NOT NULL,
  `BetaTester` int(11) NOT NULL,
  `HelpmeMutes` int(11) NOT NULL,
  `HelpmeMuted` int(11) NOT NULL,
  `Mapper` int(11) NOT NULL,
  `LastActive` int(11) NOT NULL,
  `StoredIP` varchar(128) NOT NULL,
  `StoredGPCI` varchar(41) NOT NULL,
  `RegisterDate` int(11) NOT NULL,
  `NameChanges` int(11) NOT NULL,
  `NumberChanges` int(11) NOT NULL,
  `BMXPermission` int(11) NOT NULL,
  `Lotto` int(11) NOT NULL,
  `PassedTutorial` int(11) NOT NULL,
  `PlayingHours` int(10) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `activated` tinyint(1) NOT NULL,
  `dcrp_terms` int(11) NOT NULL,
  `samp_terms` int(11) NOT NULL,
  `IsLoggedIn` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `players`
--

INSERT INTO `players` (`id`, `username`, `password`, `SecretWord`, `deaths`, `kills`, `x`, `y`, `z`, `angle`, `interior`, `virtualworld`, `AdminLevel`, `HelperLevel`, `ChangePassword`, `OfflineJailed`, `OfflineJailTime`, `OfflineJailReason`, `OfflineJailAdmin`, `DonateLevel`, `DonateExpire`, `Ajailed`, `AjailTime`, `AjailReason`, `AjailedBy`, `PassedTest`, `BetaTester`, `HelpmeMutes`, `HelpmeMuted`, `Mapper`, `LastActive`, `StoredIP`, `StoredGPCI`, `RegisterDate`, `NameChanges`, `NumberChanges`, `BMXPermission`, `Lotto`, `PassedTutorial`, `PlayingHours`, `email`, `activated`, `dcrp_terms`, `samp_terms`, `IsLoggedIn`) VALUES
(1, 'natoritz', '$2b$12$CIHAJFBJ/LrzRexW7A6qkuMP6Os0xXPCcs7DF9sRXk1NQyphGkSUK', '$2b$12$7X0L6KWP8itIGM8vh6hCqesSWXXGQoyZ4KT3NqTgsQYHYMtgEi6SS', 0, 0, -158.941, 1104.41, 19.7422, 94.9128, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, '', '', 1, 0, 0, 0, 0, 1755948147, '36.75.29.168', 'ED40ED0E8089CC44C08EE9580F4C8C44EE8EE990', 0, 0, 0, 0, 0, 1, 0, '', 0, 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `player_inventory`
--

CREATE TABLE `player_inventory` (
  `ID` int(11) NOT NULL,
  `Type` int(11) NOT NULL,
  `WeaponID` int(11) NOT NULL,
  `Amount` int(11) NOT NULL,
  `CharacterID` int(11) NOT NULL,
  `Serial` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pm_log`
--

CREATE TABLE `pm_log` (
  `ID` int(11) NOT NULL,
  `AccountID` int(11) NOT NULL,
  `UserName` varchar(32) NOT NULL,
  `Reciever` varchar(32) NOT NULL,
  `Message` varchar(144) NOT NULL,
  `Timestamp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `radio_stations`
--

CREATE TABLE `radio_stations` (
  `ID` int(11) NOT NULL,
  `Name` varchar(128) NOT NULL,
  `URL` varchar(256) NOT NULL,
  `Category` int(11) NOT NULL,
  `CreatedBy` varchar(32) NOT NULL,
  `CreatedTimestamp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roleplay_test`
--

CREATE TABLE `roleplay_test` (
  `id` int(10) UNSIGNED NOT NULL,
  `question_1` text NOT NULL,
  `question_2` text NOT NULL,
  `question_3` text NOT NULL,
  `question_4` text NOT NULL,
  `account_id` int(10) UNSIGNED NOT NULL,
  `timestamp` int(11) NOT NULL,
  `ip_addr` varchar(256) NOT NULL,
  `host_name` varchar(128) NOT NULL,
  `user_agent` varchar(128) NOT NULL,
  `app_status` int(11) NOT NULL,
  `denied_id` int(11) NOT NULL,
  `deny_reason` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `serverlogs`
--

CREATE TABLE `serverlogs` (
  `ID` int(10) UNSIGNED NOT NULL,
  `Message` varchar(256) NOT NULL,
  `Timestamp` int(10) UNSIGNED NOT NULL,
  `LogType` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `PlayerMOTD` varchar(128) NOT NULL,
  `HelperMOTD` varchar(128) NOT NULL,
  `AdminMOTD` varchar(123) NOT NULL,
  `TaxRate` int(11) NOT NULL,
  `SpawnX` float NOT NULL,
  `SpawnY` float NOT NULL,
  `SpawnZ` float NOT NULL,
  `SpawnA` float NOT NULL,
  `Interior` int(11) NOT NULL,
  `World` int(11) NOT NULL,
  `ServerName` varchar(128) NOT NULL,
  `ServerShortName` varchar(128) NOT NULL,
  `ServerRevision` varchar(128) NOT NULL,
  `ServerWebsite` varchar(128) NOT NULL,
  `ServerPassword` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sms`
--

CREATE TABLE `sms` (
  `ID` int(11) NOT NULL,
  `Message` varchar(128) NOT NULL,
  `Number` int(11) NOT NULL,
  `Reciever` int(11) NOT NULL,
  `Timestamp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `speed_cameras`
--

CREATE TABLE `speed_cameras` (
  `id` int(10) NOT NULL,
  `pos_x` float(10,5) NOT NULL,
  `pos_y` float(10,5) NOT NULL,
  `pos_z` float(10,5) NOT NULL,
  `rotation` float(10,5) NOT NULL,
  `range` float(10,5) NOT NULL,
  `speed_limit` float(10,5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='Contains data regarding speed cameras.';

-- --------------------------------------------------------

--
-- Table structure for table `street_data`
--

CREATE TABLE `street_data` (
  `id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `startX` float NOT NULL,
  `startY` float NOT NULL,
  `endX` float NOT NULL,
  `endY` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `teleports`
--

CREATE TABLE `teleports` (
  `ID` int(11) NOT NULL,
  `Name` varchar(128) NOT NULL,
  `AddedBy` varchar(25) NOT NULL,
  `AddedDate` varchar(32) NOT NULL,
  `X` float NOT NULL,
  `Y` float NOT NULL,
  `Z` float NOT NULL,
  `A` float NOT NULL,
  `World` int(11) NOT NULL,
  `Interior` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `trash_inventory`
--

CREATE TABLE `trash_inventory` (
  `ID` int(11) NOT NULL,
  `Type` int(11) NOT NULL,
  `WeaponID` int(11) NOT NULL,
  `Amount` int(11) NOT NULL,
  `Serial` int(11) NOT NULL,
  `GarbageID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ucp_comments`
--

CREATE TABLE `ucp_comments` (
  `ID` int(10) UNSIGNED NOT NULL,
  `NewsID` int(10) UNSIGNED NOT NULL,
  `Message` tinytext NOT NULL,
  `UserID` int(10) UNSIGNED NOT NULL,
  `Timestamp` int(10) UNSIGNED NOT NULL,
  `Hidden` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vehicles`
--

CREATE TABLE `vehicles` (
  `ID` int(11) NOT NULL,
  `OwnerID` int(11) NOT NULL,
  `FactionID` int(11) NOT NULL,
  `Model` int(11) NOT NULL,
  `Colour1` int(11) NOT NULL,
  `Colour2` int(11) NOT NULL,
  `PaintJob` int(11) NOT NULL,
  `PosX` float NOT NULL,
  `PosY` float NOT NULL,
  `PosZ` float NOT NULL,
  `PosA` float NOT NULL,
  `Interior` int(11) NOT NULL,
  `VW` int(11) NOT NULL,
  `Locked` int(11) NOT NULL,
  `Impounded` int(11) NOT NULL,
  `ImpoundPosX` float NOT NULL,
  `ImpoundPosY` float NOT NULL,
  `ImpoundPosZ` float NOT NULL,
  `ImpoundPosA` float NOT NULL,
  `LastDriver1` varchar(24) NOT NULL,
  `LastDriver2` varchar(24) NOT NULL,
  `LastDriver3` varchar(24) NOT NULL,
  `LastDriver4` varchar(24) NOT NULL,
  `LastDriver5` varchar(24) NOT NULL,
  `Fuel` float NOT NULL,
  `Sirens` int(11) NOT NULL,
  `Plates` varchar(32) NOT NULL,
  `FineReason` varchar(128) NOT NULL,
  `FineAmount` int(11) NOT NULL,
  `FineOfficerID` int(11) NOT NULL,
  `FineFactionID` int(11) NOT NULL,
  `FineTime` int(11) NOT NULL,
  `DMVVehicle` int(11) NOT NULL,
  `Value` int(11) NOT NULL,
  `Mileage` int(11) NOT NULL,
  `MileageX` float NOT NULL,
  `MileageY` float NOT NULL,
  `MileageZ` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_inventory`
--

CREATE TABLE `vehicle_inventory` (
  `ID` int(11) NOT NULL,
  `Type` int(11) NOT NULL,
  `WeaponID` int(11) NOT NULL,
  `Amount` int(11) NOT NULL,
  `VehicleID` int(11) NOT NULL,
  `Serial` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `warehouse`
--

CREATE TABLE `warehouse` (
  `ID` int(10) UNSIGNED NOT NULL,
  `FactionID` tinyint(3) UNSIGNED NOT NULL,
  `Name` char(128) NOT NULL,
  `ExteriorX` float NOT NULL,
  `ExteriorY` float NOT NULL,
  `ExteriorZ` float NOT NULL,
  `ExteriorA` float NOT NULL,
  `ExteriorCustom` tinyint(1) NOT NULL,
  `InteriorX` float NOT NULL,
  `InteriorY` float NOT NULL,
  `InteriorZ` float NOT NULL,
  `InteriorA` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `weaponregistry`
--

CREATE TABLE `weaponregistry` (
  `ID` int(11) NOT NULL,
  `Player` varchar(25) DEFAULT NULL,
  `Info` varchar(256) DEFAULT NULL,
  `Serial` varchar(128) DEFAULT NULL,
  `WeaponName` varchar(32) DEFAULT NULL,
  `Date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `weed_plants`
--

CREATE TABLE `weed_plants` (
  `ID` int(11) NOT NULL,
  `Growth` int(11) NOT NULL,
  `X` float NOT NULL,
  `Y` float NOT NULL,
  `Z` float NOT NULL,
  `A` float NOT NULL,
  `World` int(11) NOT NULL,
  `Interior` int(11) NOT NULL,
  `AddedBy` varchar(25) NOT NULL,
  `AddedDate` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `xmr_categories`
--

CREATE TABLE `xmr_categories` (
  `XMRDBID` int(11) NOT NULL,
  `XMRCategoryName` varchar(90) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `xmr_stations`
--

CREATE TABLE `xmr_stations` (
  `XMRStationDBID` int(11) NOT NULL,
  `XMRCategory` int(11) NOT NULL,
  `XMRStationName` varchar(90) NOT NULL,
  `XMRStationURL` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accessories`
--
ALTER TABLE `accessories`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `admin_notes`
--
ALTER TABLE `admin_notes`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `ajail_logs`
--
ALTER TABLE `ajail_logs`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `atm`
--
ALTER TABLE `atm`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `attack_logs`
--
ALTER TABLE `attack_logs`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `bans`
--
ALTER TABLE `bans`
  ADD PRIMARY KEY (`BanID`);

--
-- Indexes for table `ban_logs`
--
ALTER TABLE `ban_logs`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `blackmarkets`
--
ALTER TABLE `blackmarkets`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `business`
--
ALTER TABLE `business`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `characters`
--
ALTER TABLE `characters`
  ADD PRIMARY KEY (`CharacterID`);

--
-- Indexes for table `cmd_log`
--
ALTER TABLE `cmd_log`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `complex`
--
ALTER TABLE `complex`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `criminalrecords`
--
ALTER TABLE `criminalrecords`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `damages`
--
ALTER TABLE `damages`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `dealership`
--
ALTER TABLE `dealership`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `donator_items`
--
ALTER TABLE `donator_items`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ActivationString` (`ActivationString`);

--
-- Indexes for table `dynamic_labels`
--
ALTER TABLE `dynamic_labels`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `entrances`
--
ALTER TABLE `entrances`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `factions`
--
ALTER TABLE `factions`
  ADD PRIMARY KEY (`FactionID`);

--
-- Indexes for table `factionskin`
--
ALTER TABLE `factionskin`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `factionweapon`
--
ALTER TABLE `factionweapon`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `fines`
--
ALTER TABLE `fines`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `furniture`
--
ALTER TABLE `furniture`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `garbage`
--
ALTER TABLE `garbage`
  ADD PRIMARY KEY (`garbageID`);

--
-- Indexes for table `gas_pumps`
--
ALTER TABLE `gas_pumps`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `gates`
--
ALTER TABLE `gates`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `graffiti`
--
ALTER TABLE `graffiti`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `hacker_log`
--
ALTER TABLE `hacker_log`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `helperacceptance`
--
ALTER TABLE `helperacceptance`
  ADD PRIMARY KEY (`TokenID`);

--
-- Indexes for table `houses`
--
ALTER TABLE `houses`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `house_wep`
--
ALTER TABLE `house_wep`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `h_bolopersons`
--
ALTER TABLE `h_bolopersons`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `h_bolovehicles`
--
ALTER TABLE `h_bolovehicles`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `ic_log`
--
ALTER TABLE `ic_log`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `ig_announcement`
--
ALTER TABLE `ig_announcement`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `idx_type` (`Type`);

--
-- Indexes for table `jails`
--
ALTER TABLE `jails`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `jail_sentences`
--
ALTER TABLE `jail_sentences`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `kick_logs`
--
ALTER TABLE `kick_logs`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `kills`
--
ALTER TABLE `kills`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `mapping`
--
ALTER TABLE `mapping`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `ooc_log`
--
ALTER TABLE `ooc_log`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `phone_contacts`
--
ALTER TABLE `phone_contacts`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `player_inventory`
--
ALTER TABLE `player_inventory`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `pm_log`
--
ALTER TABLE `pm_log`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `radio_stations`
--
ALTER TABLE `radio_stations`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `roleplay_test`
--
ALTER TABLE `roleplay_test`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `serverlogs`
--
ALTER TABLE `serverlogs`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sms`
--
ALTER TABLE `sms`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `speed_cameras`
--
ALTER TABLE `speed_cameras`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `street_data`
--
ALTER TABLE `street_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teleports`
--
ALTER TABLE `teleports`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `trash_inventory`
--
ALTER TABLE `trash_inventory`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `ucp_comments`
--
ALTER TABLE `ucp_comments`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `vehicles`
--
ALTER TABLE `vehicles`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `vehicle_inventory`
--
ALTER TABLE `vehicle_inventory`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `warehouse`
--
ALTER TABLE `warehouse`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `weaponregistry`
--
ALTER TABLE `weaponregistry`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `weed_plants`
--
ALTER TABLE `weed_plants`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `xmr_categories`
--
ALTER TABLE `xmr_categories`
  ADD PRIMARY KEY (`XMRDBID`);

--
-- Indexes for table `xmr_stations`
--
ALTER TABLE `xmr_stations`
  ADD PRIMARY KEY (`XMRStationDBID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accessories`
--
ALTER TABLE `accessories`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `admin_notes`
--
ALTER TABLE `admin_notes`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `ajail_logs`
--
ALTER TABLE `ajail_logs`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `atm`
--
ALTER TABLE `atm`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `attack_logs`
--
ALTER TABLE `attack_logs`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2000;

--
-- AUTO_INCREMENT for table `bans`
--
ALTER TABLE `bans`
  MODIFY `BanID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `ban_logs`
--
ALTER TABLE `ban_logs`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `blackmarkets`
--
ALTER TABLE `blackmarkets`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `business`
--
ALTER TABLE `business`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `characters`
--
ALTER TABLE `characters`
  MODIFY `CharacterID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cmd_log`
--
ALTER TABLE `cmd_log`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41816;

--
-- AUTO_INCREMENT for table `complex`
--
ALTER TABLE `complex`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `criminalrecords`
--
ALTER TABLE `criminalrecords`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `damages`
--
ALTER TABLE `damages`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2073;

--
-- AUTO_INCREMENT for table `dealership`
--
ALTER TABLE `dealership`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `donator_items`
--
ALTER TABLE `donator_items`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dynamic_labels`
--
ALTER TABLE `dynamic_labels`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `entrances`
--
ALTER TABLE `entrances`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `factions`
--
ALTER TABLE `factions`
  MODIFY `FactionID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `factionskin`
--
ALTER TABLE `factionskin`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `factionweapon`
--
ALTER TABLE `factionweapon`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `fines`
--
ALTER TABLE `fines`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `furniture`
--
ALTER TABLE `furniture`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `garbage`
--
ALTER TABLE `garbage`
  MODIFY `garbageID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `gas_pumps`
--
ALTER TABLE `gas_pumps`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `gates`
--
ALTER TABLE `gates`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `graffiti`
--
ALTER TABLE `graffiti`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `hacker_log`
--
ALTER TABLE `hacker_log`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `helperacceptance`
--
ALTER TABLE `helperacceptance`
  MODIFY `TokenID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `houses`
--
ALTER TABLE `houses`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `house_wep`
--
ALTER TABLE `house_wep`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `h_bolopersons`
--
ALTER TABLE `h_bolopersons`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `h_bolovehicles`
--
ALTER TABLE `h_bolovehicles`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ic_log`
--
ALTER TABLE `ic_log`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6261;

--
-- AUTO_INCREMENT for table `ig_announcement`
--
ALTER TABLE `ig_announcement`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jails`
--
ALTER TABLE `jails`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `jail_sentences`
--
ALTER TABLE `jail_sentences`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kick_logs`
--
ALTER TABLE `kick_logs`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `kills`
--
ALTER TABLE `kills`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `mapping`
--
ALTER TABLE `mapping`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=279;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ooc_log`
--
ALTER TABLE `ooc_log`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3702;

--
-- AUTO_INCREMENT for table `phone_contacts`
--
ALTER TABLE `phone_contacts`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `players`
--
ALTER TABLE `players`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `player_inventory`
--
ALTER TABLE `player_inventory`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=261;

--
-- AUTO_INCREMENT for table `pm_log`
--
ALTER TABLE `pm_log`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2210;

--
-- AUTO_INCREMENT for table `radio_stations`
--
ALTER TABLE `radio_stations`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roleplay_test`
--
ALTER TABLE `roleplay_test`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `serverlogs`
--
ALTER TABLE `serverlogs`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54163;

--
-- AUTO_INCREMENT for table `sms`
--
ALTER TABLE `sms`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `speed_cameras`
--
ALTER TABLE `speed_cameras`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `street_data`
--
ALTER TABLE `street_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `teleports`
--
ALTER TABLE `teleports`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `trash_inventory`
--
ALTER TABLE `trash_inventory`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ucp_comments`
--
ALTER TABLE `ucp_comments`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `vehicles`
--
ALTER TABLE `vehicles`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=141;

--
-- AUTO_INCREMENT for table `vehicle_inventory`
--
ALTER TABLE `vehicle_inventory`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `warehouse`
--
ALTER TABLE `warehouse`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `weaponregistry`
--
ALTER TABLE `weaponregistry`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `weed_plants`
--
ALTER TABLE `weed_plants`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `xmr_categories`
--
ALTER TABLE `xmr_categories`
  MODIFY `XMRDBID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `xmr_stations`
--
ALTER TABLE `xmr_stations`
  MODIFY `XMRStationDBID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
