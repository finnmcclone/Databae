--CS374 Database Management Final Project 
--Finn McClone, Andi Brandsness, James Holtz, and Spencer Gariano

CREATE DATABASE  IF NOT EXISTS `Databae` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `Databae`;
-- MySQL dump 10.13  Distrib 8.0.21, for macos10.15 (x86_64)
--
-- Host: 127.0.0.1    Database: Databae
-- ------------------------------------------------------
-- Server version	8.0.22

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `MatchResponse`
--

DROP TABLE IF EXISTS `MatchResponse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MatchResponse` (
  `QuestionID` int NOT NULL,
  `ResponseID` varchar(45) NOT NULL,
  `ResponseText` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`QuestionID`,`ResponseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MatchResponse`
--

LOCK TABLES `MatchResponse` WRITE;
/*!40000 ALTER TABLE `MatchResponse` DISABLE KEYS */;
INSERT INTO `MatchResponse` VALUES (1,'Go out','You both prefer to go out. You and your match could spend a nice night out on the weekend!'),(1,'Stay in','You both prefer to stay in. You and your match can enjoy a night in on the weekend!'),(2,'No','You both think pineapple does not belong on pizza. In other words, you are the scum of the earth.'),(2,'Yes','You both think pineapple belongs on pizza. In other words, you are the scum of the earth.'),(3,'No','You and your match agree that cereal is not soup. The implications of cereal being soup would crumble our society. You and your match both understand that.'),(3,'Yes','You and your match agree that cereal IS soup! Does that mean milk is broth?'),(4,'Cat','You and your match are both cat people! Looks like you are purrrrfect for each other!'),(4,'Dog','You and your match are both dog people! Woof woof!'),(4,'Fish','You and your match both prefer a fish for a pet! Looks like you guys are already hooked!'),(4,'Mouse','You and your match both want a little mouse pet! '),(5,'Art','You\'ve matched on your favorite subject of art! We are also suprised that you matched with someone!'),(5,'English','You\'ve matched on your favorite subject of English! Write each other poems, or strongly worded argumentative essays. You choose!'),(5,'History','You\'ve matched on your favorite subject of Histroy! Time to write your history together!'),(5,'Math','You\'ve matched on your favorite subject of math! Are you cos^2? Because I am sin^2 and together we are 1!'),(5,'Science','You\'ve matched on your favorite subject of science! Looks like you have some chemistry together!'),(6,'The chomp chomp tiny arms one','When you go to MOD and you ask them to drizzle the barbeque sauce on your pizza... Your match agrees that chomp chomp tiny arms dino-nuggies are superior. '),(6,'The flying one','Speaking of barbeque sauce... Your match likes their dino-nuggies with wings! '),(6,'The long neck one','We hope your love lasts as long as the dino-nuggies neck. '),(6,'The one with the horns','My grandpa\'s barbeque sauce\'s secret recipe is unmatched. So are dino-nuggies with horns, and your match agrees'),(7,'Beck Taylor','You and your match are people pleasers, you both agree Beck Taylor is a stud. We\'ll be notifying him promptly. '),(7,'Lightning McQueen (Kachow!)','You and your match have similar taste in men, agreeing with the majority that Lightning McQueen is the biggest hunk of all time.'),(7,'Oprah Winfrey','Look under your seats! It\'s Oprah herself! You and your match just won an all expense paid trip to Sodexo: Ultimate Dining Experience!'),(7,'Pope Francis','You and your match love a man in charge. You both agree Pope Francis is beefcake!'),(8,'No','You and your match said \"no\" to the possibility of a little guy going around. You and your match are both no nonsense kind of people.'),(8,'Yes','Of COURSE there\'s a little guy going around. Your match agrees. You and your match are both clearly intellectuals. '),(9,'Bullwinkle','You enjoy skee ball? I\'m sure Bullwinkle would enjoy a game with you two.'),(9,'Gwenjamin','The answer to what you would name a moose is actually what you and your match must name your first born child! Can\'t wait to meet baby Gwenjamin!'),(9,'Jimmothy','\"To be fair, Jim... James. Jimothy? To be fair, Jimothy-- ah that sounds weird. Are you ok with being called Jim?\" - Michael Scott'),(9,'Mr. Moose','Naming a moose \"Mr. Moose\" is like labeling your hands left and right so you don\'t forget what they are.  You and your match aren\'t about ambiguity.'),(10,'FALSE','How many is green? FALSE?! Clearly you and your partner have not taken Color Geometry and do not understand the quantitative properties of green. '),(10,'TRUE','How many is green? You and your match are both optimists, answering TRUE!!');
/*!40000 ALTER TABLE `MatchResponse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PersonAnswers`
--

DROP TABLE IF EXISTS `PersonAnswers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PersonAnswers` (
  `PersonID` int NOT NULL,
  `QuestionID` int NOT NULL,
  `Answer` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`PersonID`,`QuestionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PersonAnswers`
--

LOCK TABLES `PersonAnswers` WRITE;
/*!40000 ALTER TABLE `PersonAnswers` DISABLE KEYS */;
INSERT INTO `PersonAnswers` VALUES (1,1,'Stay in'),(1,2,'Yes'),(1,3,'No'),(1,4,'Cat'),(1,5,'English'),(1,6,'The long neck one'),(1,7,'Lightning McQueen (Kachow!)'),(1,8,'Yes'),(1,9,'Gwenjamin'),(1,10,'TRUE'),(2,1,'Stay in'),(2,2,'No'),(2,3,'Yes'),(2,4,'Cat'),(2,5,'Math'),(2,6,'The flying one'),(2,7,'Lightning McQueen (Kachow!)'),(2,8,'Yes'),(2,9,'Mr. Moose'),(2,10,'TRUE'),(3,1,'Go out'),(3,2,'No'),(3,3,'No'),(3,4,'Dog'),(3,5,'Science'),(3,6,'The long neck one'),(3,7,'Lightning McQueen (Kachow!)'),(3,8,'No'),(3,9,'Jimmothy'),(3,10,'TRUE'),(4,1,'Stay in'),(4,2,'Yes'),(4,3,'Yes'),(4,4,'Dog'),(4,5,'History'),(4,6,'The long neck one'),(4,7,'Oprah Winfrey'),(4,8,'No'),(4,9,'Bullwinkle'),(4,10,'FALSE'),(5,1,'Go out'),(5,2,'No'),(5,3,'No'),(5,4,'Dog'),(5,5,'Art'),(5,6,'The long neck one'),(5,7,'Lightning McQueen (Kachow!)'),(5,8,'Yes'),(5,9,'Mr. Moose'),(5,10,'TRUE'),(6,1,'Go out'),(6,2,'Yes'),(6,3,'No'),(6,4,'Dog'),(6,5,'Science'),(6,6,'The long neck one'),(6,7,'Lightning McQueen (Kachow!)'),(6,8,'Yes'),(6,9,'Jimmothy'),(6,10,'TRUE'),(7,1,'Stay in'),(7,2,'No'),(7,3,'Yes'),(7,4,'Dog'),(7,5,'Science'),(7,6,'The chomp chomp tiny arms one'),(7,7,'Beck Taylor'),(7,8,'Yes'),(7,9,'Jimmothy'),(7,10,'TRUE'),(8,1,'Go out'),(8,2,'No'),(8,3,'Yes'),(8,4,'Mouse'),(8,5,'Art'),(8,6,'The chomp chomp tiny arms one'),(8,7,'Pope Francis'),(8,8,'Yes'),(8,9,'Jimmothy'),(8,10,'TRUE'),(9,1,'Go out'),(9,2,'No'),(9,3,'No'),(9,4,'Dog'),(9,5,'Math'),(9,6,'The flying one'),(9,7,'Pope Francis'),(9,8,'Yes'),(9,9,'Mr. Moose'),(9,10,'TRUE'),(10,1,'Go out'),(10,2,'No'),(10,3,'No'),(10,4,'Dog'),(10,5,'Science'),(10,6,'The chomp chomp tiny arms one'),(10,7,'Pope Francis'),(10,8,'Yes'),(10,9,'Mr. Moose'),(10,10,'TRUE'),(11,1,'Stay in'),(11,2,'No'),(11,3,'No'),(11,4,'Dog'),(11,5,'Math'),(11,6,'The flying one'),(11,7,'Lightning McQueen (Kachow!)'),(11,8,'Yes'),(11,9,'Jimmothy'),(11,10,'TRUE'),(12,1,'Go out'),(12,2,'Yes'),(12,3,'Yes'),(12,4,'Dog'),(12,5,'Math'),(12,6,'The one with the horns'),(12,7,'Lightning McQueen (Kachow!)'),(12,8,'No'),(12,9,'Gwenjamin'),(12,10,'TRUE'),(13,1,'Stay in'),(13,2,'Yes'),(13,3,'No'),(13,4,'Dog'),(13,5,'Science'),(13,6,'The flying one'),(13,7,'Oprah Winfrey'),(13,8,'No'),(13,9,'Bullwinkle'),(13,10,'TRUE'),(14,1,'Go out'),(14,2,'Yes'),(14,3,'No'),(14,4,'Dog'),(14,5,'Science'),(14,6,'The long neck one'),(14,7,'Beck Taylor'),(14,8,'Yes'),(14,9,'Gwenjamin'),(14,10,'TRUE'),(15,1,'Stay in'),(15,2,'No'),(15,3,'No'),(15,4,'Cat'),(15,5,'Science'),(15,6,'The chomp chomp tiny arms one'),(15,7,'Lightning McQueen (Kachow!)'),(15,8,'Yes'),(15,9,'Jimmothy'),(15,10,'TRUE'),(16,1,'Go out'),(16,2,'Yes'),(16,3,'No'),(16,4,'Mouse'),(16,5,'Science'),(16,6,'The flying one'),(16,7,'Lightning McQueen (Kachow!)'),(16,8,'Yes'),(16,9,'Bullwinkle'),(16,10,'TRUE'),(17,1,'Stay in'),(17,2,'Yes'),(17,3,'Yes'),(17,4,'Fish'),(17,5,'Science'),(17,6,'The one with the horns'),(17,7,'Lightning McQueen (Kachow!)'),(17,8,'No'),(17,9,'Gwenjamin'),(17,10,'TRUE'),(18,1,'Stay in'),(18,2,'No'),(18,3,'Yes'),(18,4,'Dog'),(18,5,'Science'),(18,6,'The chomp chomp tiny arms one'),(18,7,'Lightning McQueen (Kachow!)'),(18,8,'Yes'),(18,9,'Jimmothy'),(18,10,'TRUE'),(19,1,'Stay in'),(19,2,'No'),(19,3,'No'),(19,4,'Dog'),(19,5,'Math'),(19,6,'The chomp chomp tiny arms one'),(19,7,'Lightning McQueen (Kachow!)'),(19,8,'No'),(19,9,'Jimmothy'),(19,10,'FALSE'),(20,1,'Go out'),(20,2,'Yes'),(20,3,'No'),(20,4,'Dog'),(20,5,'Science'),(20,6,'The chomp chomp tiny arms one'),(20,7,'Lightning McQueen (Kachow!)'),(20,8,'Yes'),(20,9,'Mr. Moose'),(20,10,'TRUE'),(21,1,'Go out'),(21,2,'No'),(21,3,'No'),(21,4,'Dog'),(21,5,'Science'),(21,6,'The long neck one'),(21,7,'Lightning McQueen (Kachow!)'),(21,8,'Yes'),(21,9,'Gwenjamin'),(21,10,'TRUE'),(22,1,'Go out'),(22,2,'Yes'),(22,3,'No'),(22,4,'Dog'),(22,5,'Science'),(22,6,'The one with the horns'),(22,7,'Pope Francis'),(22,8,'Yes'),(22,9,'Mr. Moose'),(22,10,'TRUE'),(23,1,'Go out'),(23,2,'No'),(23,3,'No'),(23,4,'Cat'),(23,5,'Science'),(23,6,'The flying one'),(23,7,'Lightning McQueen (Kachow!)'),(23,8,'No'),(23,9,'Bullwinkle'),(23,10,'TRUE'),(24,1,'Stay in'),(24,2,'No'),(24,3,'Yes'),(24,4,'Dog'),(24,5,'Math'),(24,6,'The chomp chomp tiny arms one'),(24,7,'Lightning McQueen (Kachow!)'),(24,8,'Yes'),(24,9,'Jimmothy'),(24,10,'TRUE'),(25,1,'Stay in'),(25,2,'No'),(25,3,'No'),(25,4,'Dog'),(25,5,'Science'),(25,6,'The flying one'),(25,7,'Lightning McQueen (Kachow!)'),(25,8,'No'),(25,9,'Mr. Moose'),(25,10,'TRUE'),(26,1,'Stay in'),(26,2,'Yes'),(26,3,'No'),(26,4,'Dog'),(26,5,'Science'),(26,6,'The flying one'),(26,7,'Lightning McQueen (Kachow!)'),(26,8,'Yes'),(26,9,'Gwenjamin'),(26,10,'FALSE'),(27,1,'Stay in'),(27,2,'No'),(27,3,'Yes'),(27,4,'Dog'),(27,5,'Science'),(27,6,'The one with the horns'),(27,7,'Lightning McQueen (Kachow!)'),(27,8,'Yes'),(27,9,'Jimmothy'),(27,10,'TRUE'),(28,1,'Go out'),(28,2,'No'),(28,3,'Yes'),(28,4,'Cat'),(28,5,'English'),(28,6,'The long neck one'),(28,7,'Pope Francis'),(28,8,'No'),(28,9,'Jimmothy'),(28,10,'TRUE'),(29,1,'Go out'),(29,2,'Yes'),(29,3,'No'),(29,4,'Dog'),(29,5,'Math'),(29,6,'The chomp chomp tiny arms one'),(29,7,'Lightning McQueen (Kachow!)'),(29,8,'No'),(29,9,'Jimmothy'),(29,10,'TRUE'),(30,1,'Stay in'),(30,2,'Yes'),(30,3,'Yes'),(30,4,'Dog'),(30,5,'Science'),(30,6,'The one with the horns'),(30,7,'Beck Taylor'),(30,8,'Yes'),(30,9,'Jimmothy'),(30,10,'FALSE'),(31,1,'Go out'),(31,2,'Yes'),(31,3,'Yes'),(31,4,'Fish'),(31,5,'History'),(31,6,'The chomp chomp tiny arms one'),(31,7,'Pope Francis'),(31,8,'Yes'),(31,9,'Mr. Moose'),(31,10,'TRUE'),(32,1,'Go out'),(32,2,'Yes'),(32,3,'No'),(32,4,'Dog'),(32,5,'Math'),(32,6,'The long neck one'),(32,7,'Lightning McQueen (Kachow!)'),(32,8,'No'),(32,9,'Jimmothy'),(32,10,'TRUE'),(33,1,'Go out'),(33,2,'Yes'),(33,3,'Yes'),(33,4,'Dog'),(33,5,'Math'),(33,6,'The chomp chomp tiny arms one'),(33,7,'Lightning McQueen (Kachow!)'),(33,8,'Yes'),(33,9,'Gwenjamin'),(33,10,'FALSE'),(34,1,'Go out'),(34,2,'Yes'),(34,3,'Yes'),(34,4,'Dog'),(34,5,'Art'),(34,6,'The long neck one'),(34,7,'Lightning McQueen (Kachow!)'),(34,8,'Yes'),(34,9,'Jimmothy'),(34,10,'TRUE'),(35,1,'Stay in'),(35,2,'No'),(35,3,'No'),(35,4,'Cat'),(35,5,'Art'),(35,6,'The chomp chomp tiny arms one'),(35,7,'Lightning McQueen (Kachow!)'),(35,8,'Yes'),(35,9,'Gwenjamin'),(35,10,'FALSE'),(36,1,'Stay in'),(36,2,'Yes'),(36,3,'Yes'),(36,4,'Dog'),(36,5,'Art'),(36,6,'The chomp chomp tiny arms one'),(36,7,'Lightning McQueen (Kachow!)'),(36,8,'Yes'),(36,9,'Jimmothy'),(36,10,'TRUE'),(37,1,'Stay in'),(37,2,'Yes'),(37,3,'No'),(37,4,'Cat'),(37,5,'History'),(37,6,'The flying one'),(37,7,'Oprah Winfrey'),(37,8,'No'),(37,9,'Mr. Moose'),(37,10,'TRUE'),(38,1,'Go out'),(38,2,'Yes'),(38,3,'Yes'),(38,4,'Fish'),(38,5,'Math'),(38,6,'The chomp chomp tiny arms one'),(38,7,'Pope Francis'),(38,8,'Yes'),(38,9,'Gwenjamin'),(38,10,'FALSE'),(39,1,'Stay in'),(39,2,'Yes'),(39,3,'Yes'),(39,4,'Dog'),(39,5,'English'),(39,6,'The chomp chomp tiny arms one'),(39,7,'Pope Francis'),(39,8,'Yes'),(39,9,'Jimmothy'),(39,10,'TRUE'),(40,1,'Stay in'),(40,2,'Yes'),(40,3,'No'),(40,4,'Dog'),(40,5,'Science'),(40,6,'The chomp chomp tiny arms one'),(40,7,'Lightning McQueen (Kachow!)'),(40,8,'Yes'),(40,9,'Mr. Moose'),(40,10,'FALSE'),(41,1,'Go out'),(41,2,'Yes'),(41,3,'No'),(41,4,'Dog'),(41,5,'History'),(41,6,'The chomp chomp tiny arms one'),(41,7,'Pope Francis'),(41,8,'No'),(41,9,'Mr. Moose'),(41,10,'TRUE'),(42,1,'Stay in'),(42,2,'Yes'),(42,3,'No'),(42,4,'Dog'),(42,5,'Math'),(42,6,'The chomp chomp tiny arms one'),(42,7,'Lightning McQueen (Kachow!)'),(42,8,'Yes'),(42,9,'Mr. Moose'),(42,10,'TRUE');
/*!40000 ALTER TABLE `PersonAnswers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PersonInfo`
--

DROP TABLE IF EXISTS `PersonInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PersonInfo` (
  `ID` int NOT NULL,
  `FirstName` varchar(45) DEFAULT NULL,
  `LastName` varchar(45) DEFAULT NULL,
  `email` varchar(60) NOT NULL,
  `Bio` varchar(300) DEFAULT NULL,
  `ReferredBy` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`,`email`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `ID_UNIQUE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PersonInfo`
--

LOCK TABLES `PersonInfo` WRITE;
/*!40000 ALTER TABLE `PersonInfo` DISABLE KEYS */;
INSERT INTO `PersonInfo` VALUES (1,'Grant','Bowser','gbowser22@my.whitworth.edu','I am just a little boy going to whitworth to play music and learn another language. Things im currently interested in: spells, charms, potions, prophecies. I have a pet raccoon named Farquaad.','Andi Brandsness'),(2,'Jonas','Hildebrand','Jhildebrand22@my.whitworth.edu','The real world means nothing to me. I am consumed by the spin, a student of the spin, nothing but the spin is in my mind. The goal of reaching the infinite spin produced by the golden rectangle is not achievable with a faltering mindset. ','Andi Brandsness'),(3,'Payten','Weisenhaus','pweisenhaus22@my.whitworth.edu','im foot player in the weed symphony and i like pie but only on sundays maybe','James Holtz'),(4,'Esther','Stocker','Estocker22@my.whitworth.edu','I\'m a nerdy bookworm who loves Jesus, hiking, and coffee. ','James Holtz'),(5,'Jason','Schilling ','Jschilling22@my.whitworth.edu','i go to wigwort and i m majoring in music','James Holtz'),(6,'Logan','Todd','ltodd22@my.whitworth.edu','Go Pack Go','Finn McClone'),(7,'Ean','Peterson','epeterson23@my.whitworth.edu','Your father','Finn McClone'),(8,'Camren ','Langdon','Clangdon22@my.Whitworth.edu','Idaho and potatoes ','Finn McClone'),(9,'Adam','Callahan','acallahan23@my.whitworth.edu','Logan Todd\'s son','Finn McClone'),(10,'Connor','Florey','cflorey23@my.whitworth.edu','chillin','Finn McClone'),(11,'Carly ','Hoff','choff23@my.whitworth.edu ','elementary ed, swimmer','Finn McClone'),(12,'Willie','Walters ','wwalters22@my.Whitworth.edu','I am a young and attractive man interested in a financial career ','Finn McClone'),(13,'Isabella','Hackney','ihackney22@my.whitworth.edu','The girl you\'re too scared to approach because she has extreme RBF ','Finn McClone'),(14,'Ryan','Grady','rgrady21@my.whitworth.edu','If you can\'t find it, grind it','Finn McClone'),(15,'Cannon','Coats','ccoats21@my.whitworth.edu','A neutron walks into a bar and asks for a drink.  The bartender hands it to him and says \"it\'s free of charge\"\nSorry, I like bad jokes','Finn McClone'),(16,'Derek','Besch','dbesch22@my.whitworth.edu','i prefer smoked ghouda or something stinky. whatever cheese makes u gurgle a little. peepee poo poo che k!! thanks','James Holtz'),(17,'Isabel (Izy)','Iral','iiral23@my.whitworth.edu','No bio because I\'m deeply skeptical of the people with whom I share personal information. (Yes, I restructured the last sentence so I wouldn\'t end it with a preposition.) ','Finn McClone'),(18,'Maddy','Butler','mbutler24@my.whitworth.edu','Anything','Finn McClone'),(19,'Kaitlyn','Wornath ','kwornath23@my.whitworth.edu','Frozen grapes are the superior race','Finn McClone'),(20,'Jess','Defiesta','Jdefiesta22@my.Whitworth.edu','Coffee addict/Netflix enthusiast ','Finn McClone'),(21,'Aidan','Smith','Aidansmith23@my.Whitworth.edu','C/o 2023','Finn McClone'),(22,'Olivia','Morgenthaler','omorgenthaler23@my.whitworth.edu','I like tiktok dances, chemistry, food, and plants :)','Finn McClone'),(23,'Isabel ','Fetty','Ifetty22@my.Whitworth.edu','Close your rings ','Finn McClone'),(24,'Ashtyn','Petersen','apetersen23@my.whitworth.edu','anything ','Finn McClone'),(25,'Cameron','Lyon','Clyon21@my.whitworth.edu','','Finn McClone'),(26,'Isabel','Robertson ','irobertson22@my.whitworth.edu','I like Jesus, brownies, movies, and the color green. I take pinky promises very seriously, and I think volleyball is arguably the best sport in the world. Take me to pretty much anywhere tropical with a beach, and I will marry you on the spot? ','James Holtz'),(27,'Austin','Fogel','Afogel23@my.Whitworth.edu','Massive','Finn McClone'),(28,'Bekah','Blanchard','rblanchard22@my.whitworth.edu','likes long walks on the beach','James Holtz'),(29,'Brad','Kuraya','bkuraya22@my.Whitworth.edu','Musician and likes rice. ','James Holtz'),(30,'Kai','Wagner','kwagner22@my.whitworth.edu','James Holtz referred me.','James Holtz'),(31,'Nick','Beck','Nbeck22@my.whitworth.edu','I\'m in a relationship currently','Finn McClone'),(32,'Trenten','Nogle','tnogle22@my.whitworth.edu','I\'m a cs major and play clarinet. This is literally everything there is to know about me.','James Holtz'),(33,'Mikaela','Massie','mmassie22@my.whitworth.edu','I\'m a junior Math and Art History double major who is very confused about her future and also loves dogs.','James Holtz'),(34,'Jenna','Breedlove','jbreedlove22@my.whitworth.edu','I only want a boyfriend with great skills (nunchuck skills, bow hunting skills, computer hacking skills, etc)','James Holtz'),(35,'Meredith','Fultz','mfultz22@my.whitworth.edu','Looking for a big strong man who loves meatballs','Andi Brandsness'),(36,'Natalie','Whitlock','nwhitlock23@my.whitworth.edu','I am a clumsy, Jesus, music girl. Sometimes I drink orange juice after eating chocolate. ','James Holtz'),(37,'Mathias','Berg','mberg23@my.whitworth.edu','I am physically 20 years old, but probably more like 12 years old emotionally. I enjoy eating spaghetti with meat sauce and long evenings with no homework to do.','Andi Brandsness'),(38,'Teddy','Tel','Ttel20@my.Whitworth.edu','Sexy hunk looking for a partner to sail the Colorado river in world record time ','Andi Brandsness'),(39,'Grace ','Fleming ','Gfleming21@my.whitworth.edu','just your average 21 year old stuck in her glory days (2012). prolly watching Harry Potter or eating insane amounts of gummy worms ','James Holtz'),(40,'Michael','Harris','mharris21@my.whitworth.edu','I like snuggles and frisbee. I\'m currently in a relationship and am solely looking for a mother of my future child. ','James Holtz'),(41,'JD','Davies','Jdavies21@my.Whitworth.edu','My whole MO is pretty much day drinking in taquerias.','Finn McClone'),(42,'Spencer','Gariano','sgariano22@my.whitworth.edu ','But BBQ sauce tho','Finn McClone');
/*!40000 ALTER TABLE `PersonInfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Questions`
--

DROP TABLE IF EXISTS `Questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Questions` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `question` varchar(200) NOT NULL,
  `points` int DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Questions`
--

LOCK TABLES `Questions` WRITE;
/*!40000 ALTER TABLE `Questions` DISABLE KEYS */;
INSERT INTO `Questions` VALUES (1,'On a Saturday night, you would rather:',2),(2,'Is pineapple allowed on pizza?',3),(3,'Is cereal a soup?',1),(4,'I would choose a _____ as a pet.',4),(5,'My favorite subject is:',2),(6,'What is your favorite Dino-nuggy?',5),(7,'Who is hotter?',4),(8,'What if there was a little guy going around?',4),(9,'What would you name a moose?',4),(10,'How many is green?',5);
/*!40000 ALTER TABLE `Questions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-17 16:55:29
