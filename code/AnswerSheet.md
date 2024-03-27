#    <center>JC2504 Principles and Practice of Database Systems Assignment</center>

---
<!-- omit in toc -->
## Table of answer sheet
- [JC2504 Principles and Practice of Database Systems Assignment](#jc2504-principles-and-practice-of-database-systems-assignment)
    - [1. Entity types](#1-entity-types)
    - [2. Attributes of each entity type](#2-attributes-of-each-entity-type)
    - [3. ER Diagram of the database](#3-er-diagram-of-the-database)
    - [4. Database schema](#4-database-schema)
    - [5. Create the database schema in MySQL](#5-create-the-database-schema-in-mysql)
    - [6. Insert data into the tables](#6-insert-data-into-the-tables)
    - [7. Write SQL queries to retrieve statistics for players and champions](#7-write-sql-queries-to-retrieve-statistics-for-players-and-champions)
    - [8. Write SQL queries to retrieve popularity of item build](#8-write-sql-queries-to-retrieve-popularity-of-item-build)
    - [9. Write SQL queries to  finds the most common champion combinations in LOL](#9-write-sql-queries-to--finds-the-most-common-champion-combinations-in-lol)
---




### **1. Entity types**
``` text
Champion 
Rune
ChampionRune
Item
ChampionItem
Match
Player
PlayerChampion
Team
TeamPlayer
MatchRanking
Interaction
Skin
PlayerSkin
MatchItem
```

### **2. Attributes of each entity type**

#### Champion
- ChampionID 
- ChampionName
- Ability
- PlayStyle

#### Rune
- RuneID 
- RuneName
- Effect
- Cost
- Stats

#### ChampionRune
- ChampionRuneID
- RuneID 
- ChampionID 

#### Item
- ItemID 
- ItemName
- Effect
- Cost
- Stats

#### ChampionItem
-  ChampionItemID 
-  ItemID 
-  ChampionID 

#### Match
-  MatchID 
-  MatchDuration
-  MatchType
-  Map

#### Player
-  PlayerID 
-  PlayerName

#### PlayerChampion
-  PlayerChampionID 
-  PlayerID 
-  ChampionID 
-  ChampionMasteryLevel
-  Achievement

#### Team
-  TeamID 
-  MatchID 

#### TeamPlayer
-  TeamPlayerID 
-  TeamID 
-  PlayerID 
-  ChampionID 
-  Kill
-  Death
-  Assist
-  GoldEarned
-  MinionKilled
-  Role
-  Contribution

#### MatchRanking
-  MatchRankingID 
-  PlayerID 
-  MatchID 
-  Outcome
-  Rank

#### Interaction
-  InteractionID 
-  TeamID 
-  ObjectiveName
-  Impact

#### Skin
-  SkinID 
-  ChampionID 
-  SkinName
  
#### PlayerSkin
-  PlayerSkinID 
-  PlayerID 
-  SkinID 

#### MatchItem
-  MatchItemID 
-  MatchID 
-  ChampionItemId
-  Role

---
### **3. ER Diagram of the database**
![ER Diagram](ER_diagram.png)
---
---

### **4. Database schema** 
#### Champion
- ##### Column :
    - ChampionID 
    - ChampionName
     - Ability
     - PlayStyle
-  ##### Primary Key:
     - ChampionID
-   ##### Foreign Key:
     - None

#### Rune
-  ##### Column :
      - RuneID 
     - RuneName
      - Effect
     - Cost
     - Stats
-  ##### Primary Key:
    - RuneID
-  ##### Foreign Key:
    - None

#### ChampionRune
-  ##### Column :
    - ChampionRuneID
    - RuneID 
    - ChampionID 
-  ##### Primary Key:
    - ChampionRuneID
    -  ##### Foreign Key:
    - RuneID
    - ChampionID


#### Item
- ##### Column :
    - ItemID 
     - ItemName
     - Effect
    - Cost
     - Stats
-  ##### Primary Key:
    - ItemID
-  ##### Foreign Key:
     - None

#### ChampionItem
-  ##### Column :
      - ChampionItemID 
      - ItemID 
      - ChampionID 
-  ##### Primary Key:
      - ChampionItemID
-  ##### Foreign Key:
     - ItemID
     - ChampionID



#### Match
-  ##### Column :
     - MatchID 
    - MatchDuration
    - MatchType
       - Map
-  ##### Primary Key:
      - MatchID
 -  ##### Foreign Key:
     - None



#### Player
-  ##### Column :
    - PlayerID 
    - PlayerName
-  ##### Primary Key:
    - PlayerID
-  ##### Foreign Key:
    - None


#### PlayerChampion
-  ##### Column :
    - PlayerChampionID 
    - PlayerID 
    - ChampionID 
    - ChampionMasteryLevel
    - Achievement
-  ##### Primary Key:
    - PlayerChampionID
-  ##### Foreign Key:
    - PlayerID
    - ChampionID



#### Team
-  ##### Column :
     - TeamID 
    - MatchID 
-  ##### Primary Key:
     - TeamID
-  ##### Foreign Key:
      - MatchID

#### TeamPlayer
-  ##### Column :
    - TeamPlayerID 
     - TeamID 
     - PlayerID 
     - ChampionID 
    - Kill
     - Death
     - Assist
     - GoldEarned
     - MinionKilled
     - Role
     - Contribution
-  ##### Primary Key:
     - TeamPlayerID
-  ##### Foreign Key:
     - TeamID
      - PlayerID
     - ChampionID


#### MatchRanking
-  ##### Column :
    - MatchRankingID 
    - PlayerID 
    - MatchID 
    - Outcome
    - Rank
-  ##### Primary Key:
    - MatchRankingID
-  ##### Foreign Key:
    - PlayerID
    - MatchID


#### Interaction
-  ##### Column :
    - InteractionID 
    - TeamID 
    - ObjectiveName
    - Impact
-  ##### Primary Key:
    - InteractionID
- ##### Foreign Key:
    - TeamID



#### Skin
-  ##### Column :
    - SkinID 
    - ChampionID 
    - SkinName
-  ##### Primary Key:
    - SkinID
-  ##### Foreign Key:
    - ChampionID


#### PlayerSkin
- ##### Column :
     - PlayerSkinID 
     - PlayerID 
    - SkinID 
-  ##### Primary Key:
     - PlayerSkinID
-  ##### Foreign Key:
    - PlayerID
     - SkinID

#### MatchItem
-  ##### Column :
     - MatchItemID 
     - MatchID 
    - ChampionItemId
    - Role
 -  ##### Primary Key:
     - MatchItemID
 -  ##### Foreign Key:
    - MatchID
    - ChampionItemId
---

### **5. Create the database schema in MySQL**
```sql
# create player table
CREATE TABLE Player (
    PlayerID INT AUTO_INCREMENT ##### Primary KEY,
    PlayerName VARCHAR(255) NOT NULL
);

# create champion table
CREATE TABLE Champion (
    ChampionID INT AUTO_INCREMENT ##### Primary KEY,
    ChampionName VARCHAR(255) NOT NULL,
    Ability VARCHAR(50),
    PlayStyle VARCHAR(50)
);

# create playerchampion table
CREATE TABLE PlayerChampion (
    PlayerChampionID INT AUTO_INCREMENT ##### Primary KEY,
    PlayerID INT,
    ChampionID INT,
    ChampionMasteryLevel INT,
    Achievement INT,
    ##### Foreign KEY (PlayerID) REFERENCES Player(PlayerID),
    ##### Foreign KEY (ChampionID) REFERENCES Champion(ChampionID)
);

# create match table
CREATE TABLE `Match` (
    MatchID INT AUTO_INCREMENT ##### Primary KEY,
    MatchDuration INT,
    MatchType VARCHAR(255),
    Map VARCHAR(255)
);

# create rune table
CREATE TABLE Rune (
    RuneID INT AUTO_INCREMENT ##### Primary KEY,
    RuneName VARCHAR(255) NOT NULL,
    Effect VARCHAR(255),
    Cost INT,
    Stats VARCHAR(255)
);

# create championrune table
CREATE TABLE ChampionRune (
    ChampionRuneID INT AUTO_INCREMENT ##### Primary KEY,
    RuneID INT,
    ChampionID INT,
    ##### Foreign KEY (RuneID) REFERENCES Rune(RuneID),
    ##### Foreign KEY (ChampionID) REFERENCES Champion(ChampionID)
);

# create item table
CREATE TABLE Item (
    ItemID INT AUTO_INCREMENT ##### Primary KEY,
    ItemName VARCHAR(255) NOT NULL,
    Effect VARCHAR(255),
    Cost INT,
    Stats VARCHAR(255)
);

# create championitem table
CREATE TABLE ChampionItem (
    ChampionItemID INT AUTO_INCREMENT ##### Primary KEY,
    ItemID INT,
    ChampionID INT,
    ##### Foreign KEY (ItemID) REFERENCES Item(ItemID),
    ##### Foreign KEY (ChampionID) REFERENCES Champion(ChampionID)
);

# create team table
CREATE TABLE Team (
    TeamID INT AUTO_INCREMENT ##### Primary KEY,
    MatchID INT,
    ##### Foreign KEY (MatchID) REFERENCES `Match`(MatchID)
);

# create teamplayer table
CREATE TABLE TeamPlayer (
    TeamPlayerID INT AUTO_INCREMENT ##### Primary KEY,
    TeamID INT,
    PlayerID INT,
    ChampionID INT,
    `Kill` INT,
    `Death` INT,
    Assist INT,
    GoldEarned INT,
    MinionKilled INT,
    Role VARCHAR(255),
    Contribution VARCHAR(255),
    ##### Foreign KEY (TeamID) REFERENCES Team(TeamID),
    ##### Foreign KEY (PlayerID) REFERENCES Player(PlayerID),
    ##### Foreign KEY (ChampionID) REFERENCES Champion(ChampionID)
);

# create matchranking table
CREATE TABLE MatchRanking (
    MatchRankingID INT AUTO_INCREMENT ##### Primary KEY,
    PlayerID INT,
    MatchID INT,
    Outcome VARCHAR(255),
    Rank INT,
    ##### Foreign KEY (PlayerID) REFERENCES Player(PlayerID),
    ##### Foreign KEY (MatchID) REFERENCES `Match`(MatchID)
);

# create interaction table
CREATE TABLE Interaction (
    InteractionID INT AUTO_INCREMENT ##### Primary KEY,
    TeamID INT,
    ObjectiveName VARCHAR(255),
    Impact VARCHAR(255),
    ##### Foreign KEY (TeamID) REFERENCES Team(TeamID)
);

# create skin table
CREATE TABLE Skin (
    SkinID INT AUTO_INCREMENT ##### Primary KEY,
    ChampionID INT,
    SkinName VARCHAR(255),
    ##### Foreign KEY (ChampionID) REFERENCES Champion(ChampionID)
);

# create playerskin table
CREATE TABLE PlayerSkin (
    PlayerSkinID INT AUTO_INCREMENT ##### Primary KEY,
    PlayerID INT,
    SkinID INT,
    ##### Foreign KEY (PlayerID) REFERENCES Player(PlayerID),
    ##### Foreign KEY (SkinID) REFERENCES Skin(SkinID)
);

# create matchitem table
CREATE TABLE MatchItem (
    MatchItemID INT AUTO_INCREMENT ##### Primary KEY,
    MatchID INT,
    ChampionItemId INT,
    Role VARCHAR(255),
    ##### Foreign KEY (MatchID) REFERENCES `Match`(MatchID),
    ##### Foreign KEY (ChampionItemId) REFERENCES ChampionItem(ChampionItemID)
);
```

### **6. Insert data into the tables**
```sql
# insert data into player table
INSERT INTO Player (PlayerName) VALUES
    ('David'),
    ('John'),
    ('Tom'),
    ('Jerry'),
    ('Mike');

# insert data into champion table
INSERT INTO Champion (ChampionName, Ability, PlayStyle) VALUES
    ('Aatrox', 'The Darkin Blade', 'Fighter'),
    ('Ahri', 'The Nine-Tailed Fox', 'Mage'),
    ('Akali', 'The Rogue Assassin', 'Assassin'),
    ('Aphelios', 'The Weapon of the Faithful', 'Marksman'),
    ('Annie', 'The Dark Child', 'Mage'),
    ('Camille', 'The Steel Shadow', 'Fighter'),
    ('Darius', 'The Hand of Noxus', 'Fighter'),
    ('Draven', 'The Glorious Executioner', 'Marksman');
# insert data into team table
INSERT INTO Team (MatchID) VALUES
        (1,),
        (1,),
        (2,),
        (2,),
        (3,),
        (3,),
        (4,),
        (4,),
        (5,),
        (5,),
        (6,),
        (6,),
        (7,),
        (7,),
        (8,),
        (8,),
        (9,),
        (9,),
        (10,),
        (10,),
        (11,),
        (11,);

# insert data into teamplayer table
INSERT INTO TeamPlayer (TeamID, PlayerID, ChampionID, Role, `Kill`, Death, Assist, GoldEarned, MinionKilled, Contribution) VALUES
        (1, 1, 1, 'Top', 10, 2, 5, 15000, 200, 'Damage'),
        (1, 3, 5, 'Mid', 12, 3, 6, 16000, 250, 'Damage'),
        (1, 6, 8, 'Jungle', 8, 7, 7, 14000, 150, 'Damage'),
        (1, 9, 2, 'ADC', 15, 1, 8, 17000, 300, 'Damage'),
        (1, 5, 7, 'Support', 2, 2, 15, 12000, 100, 'Damage'),
        (2, 2, 5, 'Top', 10, 2, 5, 15000, 200, 'Damage'),
        (2, 4, 6, 'Mid', 12, 3, 6, 16000, 250, 'Damage'),
        (2, 7, 2, 'Jungle', 8, 4, 7, 14000, 150, 'Damage'),
        (2, 10, 3, 'ADC', 15, 7, 8, 17000, 300, 'Damage'),
        (2, 8, 7, 'Support', 2, 2, 15, 12000, 100, 'Damage'),
        (3, 1, 1, 'Top', 10, 2, 5, 15000, 200, 'Damage'),
        (3, 3, 5, 'Mid', 18, 9, 3, 16000, 250, 'Damage'),
        (3, 6, 8, 'Jungle', 8, 7, 7, 14000, 150, 'Damage'),
        (3, 9, 2, 'ADC', 15, 1, 8, 17000, 300, 'Damage'),
        (3, 5, 7, 'Support', 2, 2, 15, 12000, 100, 'Damage'),
        (4, 2, 5, 'Top', 10, 2, 5, 15000, 200, 'Damage'),
        (4, 4, 6, 'Mid', 12, 3, 7, 16000, 250, 'Damage'),
        (4, 7, 2, 'Jungle', 8, 4, 7, 14000, 150, 'Damage'),
        (4, 10, 3, 'ADC', 15, 1, 8, 17000, 300, 'Damage'),
        (4, 8, 7, 'Support', 2, 2, 15, 12000, 100, 'Damage'),
        (5, 1, 1, 'Top', 10, 2, 5, 15000, 200, 'Damage'),
        (5, 3, 5, 'Mid', 17, 4, 8, 16000, 250, 'Damage'),
        (5, 6, 8, 'Jungle', 8, 4, 7, 14000, 150, 'Damage'),
        (5, 9, 2, 'ADC', 15, 1, 8, 17000, 300, 'Damage'),
        (5, 5, 7, 'Support', 2, 2, 15, 12000, 100, 'Damage'),
        (6, 7, 2, 'Top', 10, 2, 5, 15000, 200, 'Damage'),
        (6, 4, 6, 'Mid', 12, 3, 6, 16000, 250, 'Damage'),
        (6, 2, 5, 'Jungle', 8, 4, 7, 14000, 150, 'Damage'),
        (6, 10, 3, 'ADC', 15, 1, 8, 17000, 300, 'Damage'),
        (6, 8, 7, 'Support', 2, 2, 15, 12000, 100, 'Damage'),
        (7, 1, 1, 'Top', 10, 2, 5, 15000, 200, 'Damage'),
        (7, 3, 5, 'Mid', 10, 2, 3, 16000, 250, 'Damage'),
        (7, 6, 8, 'Jungle', 8, 4, 7, 14000, 150, 'Damage'),
        (7, 9, 2, 'ADC', 15, 1, 8, 17000, 300, 'Damage'),
        (7, 5, 7, 'Support', 2, 2, 15, 12000, 100, 'Damage'),
        (8, 2, 2, 'Top', 10, 2, 5, 15000, 200, 'Damage'),
        (8, 4, 6, 'Mid', 12, 3, 6, 16000, 250, 'Damage'),
        (8, 7, 8, 'Jungle', 8, 4, 7, 14000, 150, 'Damage'),
        (8, 10, 5, 'ADC', 15, 1, 8, 17000, 300, 'Damage'),
        (8, 8, 7, 'Support', 2, 2, 15, 12000, 100, 'Damage'),
        (9, 1, 1, 'Top', 10, 2, 5, 15000, 200, 'Damage'),
        (9, 3, 5, 'Mid', 18, 9, 2, 16000, 250, 'Damage'),
        (9, 6, 8, 'Jungle', 8, 4, 7, 14000, 150, 'Damage'),
        (9, 9, 2, 'ADC', 15, 1, 7, 17000, 300, 'Damage'),
        (9, 5, 6, 'Support', 2, 2, 15, 12000, 100, 'Damage'),
        (10, 2, 5, 'Top', 10, 2, 5, 15000, 200, 'Damage'),
        (10, 4, 6, 'Mid', 12, 3, 6, 16000, 250, 'Damage'),
        (10, 7, 2, 'Jungle', 8, 7, 7, 14000, 150, 'Damage'),
        (10, 10, 3, 'ADC', 15, 1, 8, 17000, 300, 'Damage'),
        (10, 8, 7, 'Support', 7, 2, 15, 12000, 100, 'Damage'),
        (11, 1, 1, 'Top', 10, 2, 5, 15000, 200, 'Damage'),
        (11, 3, 5, 'Mid', 4, 1, 4, 16000, 250, 'Damage'),
        (11, 6, 8, 'Jungle', 8, 4, 7, 14000, 150, 'Damage'),
        (11, 9, 2, 'ADC', 15, 1, 7, 17000, 300, 'Damage'),
        (11, 5, 6, 'Support', 2, 7, 15, 12000, 100, 'Damage'),
        (12, 2, 2, 'Top', 10, 2, 5, 15000, 200, 'Damage'),
        (12, 4, 6, 'Mid', 12, 7, 6, 16000, 250, 'Damage'),
        (12, 7, 8, 'Jungle', 8, 4, 7, 14000, 150, 'Damage'),
        (12, 10, 5, 'ADC', 15, 1, 8, 17000, 300, 'Damage'),
        (12, 8, 7, 'Support', 7, 2, 15, 12000, 100, 'Damage'),
        (13, 1, 1, 'Top', 10, 2, 5, 15000, 200, 'Damage'),
        (13, 3, 5, 'Mid', 15, 7, 2, 16000, 250, 'Damage'),
        (13, 6, 8, 'Jungle', 8, 4, 7, 14000, 150, 'Damage'),
        (13, 9, 2, 'ADC', 15, 1, 7, 17000, 300, 'Damage'),
        (13, 5, 6, 'Support', 2, 7, 15, 12000, 100, 'Damage'),
        (14, 2, 5, 'Top', 10, 2, 5, 15000, 200, 'Damage'),
        (14, 4, 6, 'Mid', 12, 3, 6, 16000, 250, 'Damage'),
        (14, 7, 2, 'Jungle', 8, 4, 7, 14000, 150, 'Damage'),
        (14, 10, 3, 'ADC', 15, 1, 8, 17000, 300, 'Damage'),
        (14, 8, 7, 'Support', 2, 2, 15, 12000, 100, 'Damage'),
        (15, 1, 1, 'Top', 7, 2, 7, 15000, 200, 'Damage'),
        (15, 3, 5, 'Mid', 13, 2, 2, 16000, 250, 'Damage'),
        (15, 6, 8, 'Jungle', 8, 7, 4, 14000, 150, 'Damage'),
        (15, 9, 2, 'ADC', 15, 1, 8, 17000, 300, 'Damage'),
        (15, 5, 7, 'Support', 2, 2, 15, 12000, 100, 'Damage'),
        (16, 2, 2, 'Top', 7, 2, 5, 15000, 200, 'Damage'),
        (16, 4, 5, 'Mid', 7, 3, 6, 16000, 250, 'Damage'),
        (16, 7, 1, 'Jungle', 8, 4, 7, 14000, 150, 'Damage'),
        (16, 10, 3, 'ADC', 15, 1, 8, 17000, 300, 'Damage'),
        (16, 8, 7, 'Support', 2, 2, 15, 12000, 100, 'Damage'),
        (17, 1, 1, 'Top', 10, 7, 5, 15000, 200, 'Damage'),
        (17, 3, 5, 'Mid', 12, 10, 11, 16000, 250, 'Damage'),
        (17, 6, 8, 'Jungle', 8, 5, 7, 14000, 150, 'Damage'),
        (17, 9, 2, 'ADC', 15, 1, 8, 17000, 300, 'Damage'),
        (17, 5, 3, 'Support', 2, 2, 15, 12000, 100, 'Damage'),
        (18, 2, 2, 'Top', 10, 2, 7, 15000, 200, 'Damage'),
        (18, 4, 6, 'Mid', 12, 3, 6, 16000, 250, 'Damage'),
        (18, 7, 8, 'Jungle', 8, 7, 7, 14000, 150, 'Damage'),
        (18, 10, 3, 'ADC', 7, 1, 8, 17000, 300, 'Damage'),
        (18, 8, 7, 'Support', 2, 2, 15, 12000, 100, 'Damage'),
        (19, 1, 1, 'Top', 10, 2, 5, 15000, 200, 'Damage'),
        (19, 3, 5, 'Mid', 7, 3, 6, 16000, 250, 'Damage'),
        (19, 6, 8, 'Jungle', 8, 4, 7, 14000, 150, 'Damage'),
        (19, 9, 2, 'ADC', 15, 1, 8, 17000, 300, 'Damage'),
        (19, 5, 4, 'Support', 7, 2, 15, 12000, 100, 'Damage'),
        (20, 7, 2, 'Top', 10, 7, 5, 15000, 200, 'Damage'),
        (20, 4, 6, 'Mid', 12, 3, 6, 16000, 250, 'Damage'),
        (20, 2, 1, 'Jungle', 8, 4, 7, 14000, 150, 'Damage'),
        (20, 10, 3, 'ADC', 15, 7, 8, 17000, 300, 'Damage'),
        (20, 8, 7, 'Support', 2, 2, 15, 12000, 100, 'Damage'),
        (21, 1, 1, 'Top', 10, 2, 5, 15000, 200, 'Damage'),
        (21, 3, 5, 'Mid', 12, 3, 7, 16000, 250, 'Damage'),
        (21, 6, 8, 'Jungle', 8, 4, 7, 14000, 150, 'Damage'),
        (21, 9, 2, 'ADC', 15, 1, 8, 17000, 300, 'Damage'),
        (21, 5, 3, 'Support', 2, 7, 15, 12000, 100, 'Damage'),
        (22, 2, 1, 'Top', 10, 2, 5, 15000, 200, 'Damage'),
        (22, 4, 6, 'Mid', 12, 3, 6, 16000, 250, 'Damage'),
        (22, 7, 2, 'Jungle', 8, 5, 7, 14000, 150, 'Damage'),
        (22, 10, 3, 'ADC', 15, 1, 8, 17000, 300, 'Damage'),
        (22, 8, 7, 'Support', 7, 2, 15, 12000, 100, 'Damage');


# insert data into item table
INSERT INTO Item (ItemName, Effect, Cost, Stats) VALUES
        ('Control Ward', 175, 'Vision', 'Vision'),
        ('Sweeping Lens', 55, 'Vision', 'Vision'),
        ('Health Potion', 89, 'Health Regen', 'Health'),
        ('Mana Potion', 65, 'Mana Regen', 'Mana'),
        ('Doran\'s Blade'', 450, 'Attack Damage', 'Attack Damage');

# insert data into `Match` table
INSERT INTO `Match` (MatchDuration, MatchType, Map) VALUES
        (30, 'Ranked', 'Howling Abyss'),
        (25, 'Normal', 'Summoner\'s' Rift'),
        (40, 'Ranked', 'Twisted Treeline'),
        (35, 'Ranked', 'Twisted Treeline'),
        (20, 'Normal', 'Howling Abyss'),
        (45, 'Ranked', 'Summoner\'s' Rift'),
        (30, 'Ranked', 'Twisted Treeline'),
        (25, 'Normal', 'Howling Abyss'),
        (35, 'Ranked', 'Summoner\'s' Rift'),
        (40, 'Ranked', 'Twisted Treeline'),
        (45, 'Ranked', 'Summoner\'s' Rift');




# insert data into championitem table
INSERT INTO ChampionItem (ItemID, ChampionID) VALUES
        (1, 1),
        (2, 2),
        (3, 3),
        (4, 4),
        (1, 5),
        (2, 6),
        (3, 7),
        (4, 8),
        (1, 3),
        (2, 4),
        (3, 1),
        (4, 2),
        (3, 5),
        (4, 6),
        (1, 7),
        (3, 2),
        (2, 5);

# insert data into matchitem table
INSERT INTO MatchItem (MatchID, ChampionItemId, Role) VALUES
        (1, 1, 'Top'),
        (1, 5, 'Mid'),
        (1, 8, 'Jungle'),
        (1, 2, 'ADC'),
        (1, 7, 'Support'),
        (1, 5, 'Top'),
        (1, 6, 'Mid'),
        (1, 2, 'Jungle'),
        (1, 3, 'ADC'),
        (1, 7, 'Support'),
        (2, 1, 'Top'),
        (2, 5, 'Mid'),
        (2, 8, 'Jungle'),
        (2, 2, 'ADC'),
        (2, 7, 'Support'),
        (2, 5, 'Top'),
        (2, 6, 'Mid'),
        (2, 2, 'Jungle'),
        (2, 3, 'ADC'),
        (2, 7, 'Support'),
        (3, 1, 'Top'),
        (3, 5, 'Mid'),
        (3, 8, 'Jungle'),
        (3, 2, 'ADC'),
        (3, 7, 'Support'),
        (3, 2, 'Top'),
        (3, 6, 'Mid'),
        (3, 5, 'Jungle'),
        (3, 3, 'ADC'),
        (3, 7, 'Support'),
        (4, 1, 'Top'),
        (4, 5, 'Mid'),
        (4, 8, 'Jungle'),
        (4, 2, 'ADC'),
        (4, 7, 'Support'),
        (4, 2, 'Top'),
        (4, 6, 'Mid'),
        (4, 8, 'Jungle'),
        (4, 5, 'ADC'),
        (4, 7, 'Support'),
        (5, 1, 'Top'),
        (5, 5, 'Mid'),
        (5, 8, 'Jungle'),
        (5, 2, 'ADC'),
        (5, 6, 'Support'),
        (5, 5, 'Top'),
        (5, 6, 'Mid'),
        (5, 2, 'Jungle'),
        (5, 3, 'ADC'),
        (5, 7, 'Support'),
        (5, 1, 'Top'),
        (5, 5, 'Mid'),
        (5, 8, 'Jungle'),
        (5, 2, 'ADC'),
        (5, 7, 'Support'),
        (6, 1, 'Top'),
        (6, 5, 'Mid'),
        (6, 8, 'Jungle'),
        (6, 2, 'ADC'),
        (6, 6, 'Support'),
        (6, 2, 'Top'),
        (6, 6, 'Mid'),
        (6, 8, 'Jungle'),
        (6, 5, 'ADC'),
        (6, 7, 'Support'),
        (7, 1, 'Top'),
        (7, 5, 'Mid'),
        (7, 8, 'Jungle'),
        (7, 2, 'ADC'),
        (7, 6, 'Support'),
        (7, 5, 'Top'),
        (7, 6, 'Mid'),
        (7, 2, 'Jungle'),
        (7, 3, 'ADC'),
        (7, 7, 'Support'),
        (8, 1, 'Top'),
        (8, 5, 'Mid'),
        (8, 8, 'Jungle'),
        (8, 2, 'ADC'),
        (8, 7, 'Support'),
        (8, 2, 'Top'),
        (8, 5, 'Mid'),
        (8, 1, 'Jungle'),
        (8, 3, 'ADC'),
        (8, 7, 'Support'),
        (9, 1, 'Top'),
        (9, 5, 'Mid'),
        (9, 8, 'Jungle'),
        (9, 2, 'ADC'),
        (9, 3, 'Support'),
        (9, 2, 'Top'),
        (9, 6, 'Mid'),
        (9, 8, 'Jungle'),
        (9, 3, 'ADC'),
        (9, 7, 'Support'),
        (10, 1, 'Top'),
        (10, 5, 'Mid'),
        (10, 8, 'Jungle'),
        (10, 2, 'ADC'),
        (10, 4, 'Support'),
        (10, 2, 'Top'),
        (10, 6, 'Mid'),
        (10, 1, 'Jungle'),
        (10, 3, 'ADC'),
        (10, 7, 'Support'),
        (11, 1, 'Top'),
        (11, 5, 'Mid'),
        (11, 8, 'Jungle'),
        (11, 2, 'ADC'),
        (11, 3, 'Support'),
        (11, 1, 'Top'),
        (11, 6, 'Mid'),
        (11, 2, 'Jungle'),
        (11, 3, 'ADC'),
        (11, 7, 'Support');
```



### **7. Write SQL queries to retrieve statistics for players and champions**
```sql
    SELECT p.PlayerName, c.ChampionName, AVG(tp.Kill) AS AverageKDA, AVG(tp.Death) AS AverageDeath, AVG(tp.Assist) AS AverageAssist, COUNT(*) AS GamesPlayed
    FROM TeamPlayer tp
    JOIN Player p ON tp.PlayerID = p.PlayerID
    JOIN Champion c ON tp.ChampionID = c.ChampionID
    GROUP BY p.PlayerName, c.ChampionName
    HAVING GamesPlayed > 10
    ORDER BY 
        AverageKDA DESC,
        AverageDeath ASC,
        AverageAssist DESC;
```

### **8. Write SQL queries to retrieve popularity of item build**
```sql
SELECT cc.ChampionName, i.ItemName, m.Role ,COUNT(*) AS ItemCount
        FROM MatchItem m
        JOIN ChampionItem c ON m.ChampionItemID = c.ChampionItemID
        JOIN Item i ON c.ItemID = i.ItemID
        JOIN Champion cc ON c.ChampionID = cc.ChampionID
        GROUP BY cc.ChampionName, i.ItemName, m.Role
        ORDER BY ItemCount DESC;
```

### **9. Write SQL queries to  finds the most common champion combinations in LOL**
```sql
SELECT c1.ChampionName AS Champion1, c2.ChampionName AS Champion2, COUNT(DISTINCT t1.MatchID) AS GamesPlayed
        FROM TeamPlayer tp1
        JOIN Team t1 ON tp1.TeamID = t1.TeamID
        JOIN Team t2 ON t1.MatchID = t2.MatchID AND t1.TeamID = t2.TeamID
        JOIN TeamPlayer tp2 ON tp1.TeamID = tp2.TeamID AND tp1.TeamPlayerID < tp2.TeamPlayerID AND t1.MatchID = t2.MatchID
        JOIN Champion c1 ON tp1.ChampionID = c1.ChampionID
        JOIN Champion c2 ON tp2.ChampionID = c2.ChampionID AND c1.ChampionID < c2.ChampionID
        GROUP BY Champion1, Champion2
        ORDER BY GamesPlayed DESC LIMIT 10;
```
##### Query Result:
![Query_result](./queryresult.png)


  