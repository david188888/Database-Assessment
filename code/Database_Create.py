import mysql.connector
import json
import os


class LoLDatabase:
    def __init__(self, config_data):
        self.mydb = mysql.connector.connect(
            host=config_data['host'],
            user=config_data['user'],
            password=config_data['password'],
            database=config_data['database']
        )
        self.mycursor = self.mydb.cursor()

    def show_database(self):
        self.mycursor.execute("SHOW DATABASES")
        for x in self.mycursor:
            print(x)

    def select_database(self):
        self.mycursor.execute("USE lol")

        self.mycursor.execute("SELECT DATABASE()")
        print(f"Database: {self.mycursor.fetchone()[0]} is used")

    def initialize_table(self):

        self.mycursor.execute("""
                           CREATE TABLE Player(
                                PlayerID INT AUTO_INCREMENT PRIMARY KEY,
                                PlayerName VARCHAR(255) NOT NULL
                           )
                           """)

        self.mycursor.execute("""
                           CREATE TABLE Champion(
                                ChampionID INT AUTO_INCREMENT PRIMARY KEY,
                                ChampionName VARCHAR(255) NOT NULL,
                                Ability VARCHAR(255),
                                PlayStyle VARCHAR(255)
                           )
                           """)

        self.mycursor.execute("""
                             CREATE TABLE PlayerChampion(
                                    PlayerChampionID INT AUTO_INCREMENT PRIMARY KEY,
                                    PlayerID INT,
                                    ChampionID INT,
                                    ChampionMasteryLevel INT,
                                    Achievement INT,
                                        FOREIGN KEY (PlayerID) REFERENCES Player(PlayerID),
                                        FOREIGN KEY (ChampionID) REFERENCES Champion(ChampionID)
                                )
                                """
                              )

        self.mycursor.execute("""
                           CREATE TABLE `Match`(
                                MatchID INT AUTO_INCREMENT PRIMARY KEY,
                                MatchDuration INT,
                                MatchType VARCHAR(255),
                                Map VARCHAR(255)
                           )
                           """)

        self.mycursor.execute("""
                            CREATE TABLE Rune(
                                RuneID INT AUTO_INCREMENT PRIMARY KEY,
                                RuneName VARCHAR(255) NOT NULL,
                                Effect VARCHAR(255),
                                Cost INT,
                                Stats VARCHAR(255)
                            )
                            """)

        self.mycursor.execute("""
                            CREATE TABLE ChampionRune(
                                ChampionRuneID INT AUTO_INCREMENT PRIMARY KEY,
                                RuneID INT,
                                ChampionID INT,
                                    FOREIGN KEY (RuneID) REFERENCES Rune(RuneID),
                                    FOREIGN KEY (ChampionID) REFERENCES Champion(ChampionID)
                                )
                                """
                              )

        self.mycursor.execute("""
                            CREATE TABLE Item(
                                ItemID INT AUTO_INCREMENT PRIMARY KEY,
                                ItemName VARCHAR(255) NOT NULL,
                                Cost INT,
                                Effect VARCHAR(255),
                                Stats VARCHAR(255)
                            )
                            """)

        self.mycursor.execute("""
                                CREATE TABLE ChampionItem(
                                    ChampionItemID INT AUTO_INCREMENT PRIMARY KEY,
                                    ItemID INT,
                                    ChampionID INT,
                                        FOREIGN KEY (ItemID) REFERENCES Item(ItemID),
                                        FOREIGN KEY (ChampionID) REFERENCES Champion(ChampionID)
                                )
                                """
                              )

        self.mycursor.execute("""
                                CREATE TABLE Team(
                                    TeamID INT AUTO_INCREMENT PRIMARY KEY,
                                    MatchID INT,
                                        FOREIGN KEY (MatchID) REFERENCES `Match`(MatchID)
                                )
                                """
                              )

        self.mycursor.execute("""
                             CREATE TABLE TeamPlayer(
                                TeamPlayerID INT AUTO_INCREMENT PRIMARY KEY,
                                TeamID INT,
                                PlayerID INT,
                                ChampionID INT,
                                Role VARCHAR(255),
                                `Kill` INT,
                                `Death` INT,
                                Assist INT,
                                GoldEarned INT,
                                MinionKilled INT,
                                Contribution VARCHAR(255),
                                    FOREIGN KEY (TeamID) REFERENCES Team(TeamID),
                                    FOREIGN KEY (PlayerID) REFERENCES Player(PlayerID),
                                    FOREIGN KEY (ChampionID) REFERENCES Champion(ChampionID)
                                    
                             )
                             """
                              )

        self.mycursor.execute("""
                             CREATE TABLE MatchRanking(
                                 MatchRankingID INT AUTO_INCREMENT PRIMARY KEY,
                                 PlayerID INT,
                                 MatchID INT,
                                 Outcome VARCHAR(255),
                                 `Rank` INT,
                                    FOREIGN KEY (PlayerID) REFERENCES Player(PlayerID),
                                    FOREIGN KEY (MatchID) REFERENCES `Match`(MatchID)
                                    
                                 
                             )
                             """
                              )

        self.mycursor.execute("""
                                CREATE TABLE Interaction(
                                    InteractionID INT AUTO_INCREMENT PRIMARY KEY,
                                    ObjectiveName VARCHAR(255) NOT NULL,
                                    TeamID INT,
                                    Impact VARCHAR(255),
                                        FOREIGN KEY (TeamID) REFERENCES Team(TeamID)
                                )
                                """
                              )

        self.mycursor.execute("""
                                CREATE TABLE Skin(
                                    SkinID INT AUTO_INCREMENT PRIMARY KEY,
                                    ChampionID INT,
                                    SkinName VARCHAR(255) NOT NULL,
                                        FOREIGN KEY (ChampionID) REFERENCES Champion(ChampionID)
                                        )
                                """
                              )

        self.mycursor.execute("""
                                CREATE TABLE PlayerSkin(
                                    PlayerSkinID INT AUTO_INCREMENT PRIMARY KEY,
                                    PlayerID INT,
                                    SkinID INT,
                                        FOREIGN KEY (PlayerID) REFERENCES Player(PlayerID),
                                        FOREIGN KEY (SkinID) REFERENCES Skin(SkinID)
                                )
                                """
                              )

        self.mycursor.execute("""
                              CREATE TABLE MatchItem (
                                    MatchItemID INT AUTO_INCREMENT PRIMARY KEY,
                                    MatchID INT,
                                    ChampionItemId INT,
                                    Role VARCHAR(255),
                                    FOREIGN KEY (MatchID) REFERENCES `Match`(MatchID),
                                    FOREIGN KEY (ChampionItemId) REFERENCES ChampionItem(ChampionItemId)
                                )
                              """)

    def create_table(self, table_name, column_name):
        self.mycursor.execute(
            "CREATE TABLE {} ({})".format(table_name, column_name))

    def insert_data(self, insert_query, values):
        self.mycursor.executemany(insert_query, values)
        self.mydb.commit()

    def show_tables(self):
        self.mycursor.execute("SHOW TABLES")
        for x in self.mycursor:
            print(x)

    def show_data(self, table_name):
        table_list = []
        self.mycursor.execute("SHOW TABLES")
        for x in self.mycursor:
            table_list.append(x)
        if (table_name,) in table_list:
            self.mycursor.execute("SELECT * FROM `{}`".format(table_name))
            for x in self.mycursor:
                print(x)
        else:
            print("Table not found")


if __name__ == '__main__':
    # read config file
    config_path = os.path.join(os.path.dirname(__file__), 'config.json')
    with open(config_path) as f:
        config_data = json.load(f)
    db = LoLDatabase(config_data)
    # db.show_database()
    # use LoL database
    db.select_database()
    # db.initialize_table()

    # db.show_tables()

    # insert data to database
    insert_player_query = "INSERT INTO Player (PlayerName) VALUES (%s)"
    player_values = [
        ('David',),
        ('John',),
        ('Tom',),
        ('Jerry',),
        ('Mike',),
    ]
    # db.insert_data(insert_player_query, player_values)
    # db.show_data('player')

    insert_champion_query = "INSERT INTO Champion (ChampionName, Ability, PlayStyle) VALUES (%s, %s, %s)"
    champion_values = [
        ('Aatrox', 'The Darkin Blade', 'Fighter'),
        ('Ahri', 'The Nine-Tailed Fox', 'Mage'),
        ('Akali', 'The Rogue Assassin', 'Assassin'),
        ('Aphelios', 'The Weapon of the Faithful', 'Marksman'),
        ('Annie', 'The Dark Child', 'Mage'),
        ('Camille', 'The Steel Shadow', 'Fighter'),
        ('Darius', 'The Hand of Noxus', 'Fighter'),
        ('Draven', 'The Glorious Executioner', 'Marksman'),
    ]
    # db.insert_data(insert_champion_query, champion_values)
    # db.show_data('champion')

    insert_match_query = "INSERT INTO `Match` (MatchDuration, MatchType, Map) VALUES (%s, %s, %s)"
    match_values = [
        (30, 'Ranked', 'Howling Abyss'),
        (25, 'Normal', 'Summoner\'s Rift'),
        (40, 'Ranked', 'Twisted Treeline'),
        (35, 'Ranked', 'Twisted Treeline'),
        (20, 'Normal', 'Howling Abyss'),
        (45, 'Ranked', 'Summoner\'s Rift'),
        (30, 'Ranked', 'Twisted Treeline'),
        (25, 'Normal', 'Howling Abyss'),
        (35, 'Ranked', 'Summoner\'s Rift'),
        (40, 'Ranked', 'Twisted Treeline'),
        (45, 'Ranked', 'Summoner\'s Rift'),
    ]
    # db.insert_data(insert_match_query, match_values)
    # db.show_data('match')

    insert_Team_query = "INSERT INTO Team (MatchID) VALUES (%s)"
    Team_values = [
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
        (11,),
    ]
    # db.insert_data(insert_Team_query, Team_values)
    # db.show_data('team')

    insert_TeamPlayer_query = "INSERT INTO TeamPlayer (TeamID, PlayerID, ChampionID, Role, `Kill`, Death, Assist, GoldEarned, MinionKilled, Contribution) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"
    TeamPlayer_values = [
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
        (22, 8, 7, 'Support', 7, 2, 15, 12000, 100, 'Damage'),
    ]
    db.insert_data(insert_TeamPlayer_query, TeamPlayer_values)
    # db.show_data('teamplayer')

    insert_item_query = "INSERT INTO Item (ItemName, Cost, Effect, Stats) VALUES (%s, %s, %s, %s)"
    item_values = [
        ('Control Ward', 175, 'Vision', 'Vision'),
        ('Sweeping Lens', 55, 'Vision', 'Vision'),
        ('Health Potion', 89, 'Health Regen', 'Health'),
        ('Mana Potion', 65, 'Mana Regen', 'Mana'),
        ('Doran\'s Blade', 450, 'Attack Damage', 'Attack Damage'),
    ]
    # db.insert_data(insert_item_query, item_values)

    insert_ChampionItem_query = "INSERT INTO ChampionItem (ItemID, ChampionID) VALUES (%s, %s)"
    ChampionItem_values = [
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
        (2, 5)
    ]
    # db.insert_data(insert_ChampionItem_query, ChampionItem_values)
    # db.show_data('championitem')

    # reference to Match and ChampionItem table
    insert_MatchItem_query = "INSERT INTO MatchItem (MatchID, ChampionItemID, Role) VALUES (%s, %s, %s)"
    MatchItem_values = [
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
        (11, 7, 'Support'),
    ]
    # db.insert_data(insert_MatchItem_query, MatchItem_values)
    # db.show_data('matchitem')

    insert_rune_query = "INSERT INTO Rune (RuneName, Effect, Cost, Stats) VALUES (%s, %s, %s, %s)"
    rune_values = [
        ('Kleptomancy', 'Gold for hitting champions', 504, 'Gold'),
        ('Lethal Tempo', 'Increased attack speed', 550, 'Attack Speed'),
        ('Phase Rush', 'Burst of speed', 840, 'Movement Speed'),
        ('Press the Attack', 'Bonus damage on hits', 400, 'Adaptive Damage'),
        ('Fleet Footwork', 'Energized attacks build', 1002, 'Attack Speed'),
        ('Guardian', 'Shield and haste allies', 860, 'Shield'),
        ('Hail of Blades', 'Fast attack speed boost', 798, 'Attack Speed'),
    ]
    # db.insert_data(insert_rune_query, rune_values)
    # db.show_data('rune')

    insert_ChampionRune_query = "INSERT INTO ChampionRune (RuneID, ChampionID) VALUES (%s, %s)"
    ChampionRune_values = [
        (1, 1),
        (2, 2),
        (3, 3),
        (4, 4),
        (1, 5),
        (2, 6),
        (3, 7),
        (4, 8),
        (1, 4),
        (5, 6),
        (6, 7),
        (2, 1)
    ]
    # db.insert_data(insert_ChampionRune_query, ChampionRune_values)
    # db.show_data('championrune')

    insert_PlayerChampion_query = "INSERT INTO PlayerChampion (PlayerID, ChampionID, ChampionMasterLevel, Achievement) VALUES (%s, %s, %s, %s)"
    PlayerChampion_values = [
        (1, 1, 70, 3),
        (1, 2, 80, 4),
        (2, 1, 90, 5),
        (2, 2, 100, 6),
        (3, 5, 70, 3),
        (3, 6, 80, 4),
        (4, 5, 90, 5),
        (4, 6, 100, 6),
        (5, 4, 70, 3),
        (5, 3, 80, 4),
        (5, 6, 90, 5),
        (5, 7, 100, 6),
        (6, 8, 90, 5),
        (6, 2, 100, 6),
        (7, 1, 70, 3),
        (7, 2, 80, 4),
        (7, 8, 90, 5),
        (8, 5, 90, 5),
        (8, 7, 100, 6),
        (9, 2, 70, 3),
        (9, 8, 80, 4),
        (10, 3, 90, 5),
        (10, 5, 100, 6),
    ]
    # db.insert_data(insert_PlayerChampion_query, PlayerChampion_values)
    # db.show_data('playerchampion')

    # reference to Player and Match table
    insert_MatchRanking_query = "INSERT INTO MatchRanking (PlayerID, MatchID, Outcome, `Rank`) VALUES (%s, %s, %s, %s)"
    MatchRanking_values = [
        (1, 1, 'Win', 1),
        (3, 1, 'Win', 2),
        (6, 1, 'Win', 3),
        (9, 1, 'Win', 4),
        (5, 1, 'Win', 5),
        (2, 1, 'Lose', 6),
        (4, 1, 'Lose', 7),
        (7, 1, 'Lose', 8),
        (10, 1, 'Lose', 9),
        (8, 1, 'Lose', 10),
        (1, 2, 'Win', 1),
        (3, 2, 'Win', 2),
        (6, 2, 'Win', 3),
        (9, 2, 'Win', 4),
        (5, 2, 'Win', 5),
        (2, 2, 'Lose', 6),
        (4, 2, 'Lose', 7),
        (7, 2, 'Lose', 8),
        (10, 2, 'Lose', 9),
        (8, 2, 'Lose', 10),
        (1, 3, 'Win', 1),
        (3, 3, 'Win', 2),
        (6, 3, 'Win', 3),
        (9, 3, 'Win', 4),
        (5, 3, 'Win', 5),
        (2, 3, 'Lose', 6),
        (4, 3, 'Lose', 7),
        (7, 3, 'Lose', 8),
        (10, 3, 'Lose', 9),
        (8, 3, 'Lose', 10),
        (1, 4, 'Win', 1),
        (3, 4, 'Win', 2),
        (6, 4, 'Win', 3),
        (9, 4, 'Win', 4),
        (5, 4, 'Win', 5),
        (2, 4, 'Lose', 6),
        (4, 4, 'Lose', 7),
        (7, 4, 'Lose', 8),
        (10, 4, 'Lose', 9),
        (8, 4, 'Lose', 10),
        (1, 5, 'Win', 1),
        (3, 5, 'Win', 2),
        (6, 5, 'Win', 3),
        (9, 5, 'Win', 4),
        (5, 5, 'Win', 5),
        (2, 5, 'Lose', 6),
        (4, 5, 'Lose', 7),
        (7, 5, 'Lose', 8),
        (10, 5, 'Lose', 9),
        (8, 5, 'Lose', 10),
        (1, 6, 'Win', 1),
        (3, 6, 'Win', 2),
        (6, 6, 'Win', 3),
        (9, 6, 'Win', 4),
        (5, 6, 'Win', 5),
        (2, 6, 'Lose', 6),
        (4, 6, 'Lose', 7),
        (7, 6, 'Lose', 8),
        (10, 6, 'Lose', 9),
        (8, 6, 'Lose', 10),
        (1, 7, 'Win', 1),
        (3, 7, 'Win', 2),
        (6, 7, 'Win', 3),
        (9, 7, 'Win', 4),
        (5, 7, 'Win', 5),
        (2, 7, 'Lose', 6),
        (4, 7, 'Lose', 7),
        (7, 7, 'Lose', 8),
        (10, 7, 'Lose', 9),
        (8, 7, 'Lose', 10),
        (1, 8, 'Win', 1),
        (3, 8, 'Win', 2),
        (6, 8, 'Win', 3),
        (9, 8, 'Win', 4),
        (5, 8, 'Win', 5),
        (2, 8, 'Lose', 6),
        (4, 8, 'Lose', 7),
        (7, 8, 'Lose', 8),
        (10, 8, 'Lose', 9),
        (8, 8, 'Lose', 10),
        (1, 9, 'Win', 1),
        (3, 9, 'Win', 2),
        (6, 9, 'Win', 3),
        (9, 9, 'Win', 4),
        (5, 9, 'Win', 5),
        (2, 9, 'Lose', 6),
        (4, 9, 'Lose', 7),
        (7, 9, 'Lose', 8),
        (10, 9, 'Lose', 9),
        (8, 9, 'Lose', 10),
        (1, 10, 'Win', 1),
        (3, 10, 'Win', 2),
        (6, 10, 'Win', 3),
        (9, 10, 'Win', 4),
        (5, 10, 'Win', 5),
        (2, 10, 'Lose', 6),
        (4, 10, 'Lose', 7),
        (7, 10, 'Lose', 8),
        (10, 10, 'Lose', 9),
        (8, 10, 'Lose', 10),
        (1, 11, 'Win', 1),
        (3, 11, 'Win', 2),
        (6, 11, 'Win', 3),
        (9, 11, 'Win', 4),
        (5, 11, 'Win', 5),
        (2, 11, 'Lose', 6),
        (4, 11, 'Lose', 7),
        (7, 11, 'Lose', 8),
        (10, 11, 'Lose', 9),
        (8, 11, 'Lose', 10),
    ]
    # db.insert_data(insert_MatchRanking_query, MatchRanking_values)
    # db.show_data('matchranking')

    insert_skin_query = "INSERT INTO Skin (SkinName, ChampionID) VALUES (%s, %s)"
    skin_values = [
        ('Blood Moon', 1),
        ('High Noon', 2),
        ('Project', 3),
        ('Star Guardian', 4),
        ('Pulsefire', 5),
        ('Blood Moon', 6),
        ('High Noon', 7),
        ('Project', 8),
    ]
    # db.insert_data(insert_skin_query, skin_values)
    # db.show_data('skin')

    insert_PlayerSkin_query = "INSERT INTO PlayerSkin (PlayerID, SkinID) VALUES (%s, %s)"
    PlayerSkin_values = [
        (1, 1),
        (1, 2),
        (2, 3),
        (2, 6),
        (3, 5),
        (3, 5),
        (4, 2),
        (4, 8),
        (5, 1),
        (5, 5),
    ]
    # db.insert_data(insert_PlayerSkin_query, PlayerSkin_values)
    # db.show_data('playerskin')

    insert_Interaction_query = "INSERT INTO Interaction (TeamID, ObjectiveName, Impact) VALUES (%s, %s, %s)"
    Interaction_values = [
        (1, 'Baron', 'Break the build'),
        (1, 'Dragon', 'gain the advantage'),
        (2, 'Baron', 'Break the build'),
        (2, 'Trrets', 'Win the game'),
        (3, 'Dragon', 'gain the advantage'),
        (4, 'Baron', 'Break the build'),
        (5, 'Dragon', 'gain the advantage'),
        (6, 'Turrets', 'Win the game'),
        (7, 'Baron', 'Break the build'),
        (8, 'Dragon', 'gain the advantage'),
        (9, 'Baron', 'Break the build'),
        (10, 'Turrets', 'Win the game'),
        (11, 'Dragon', 'gain the advantage'),
        (12, 'Baron', 'Break the build'),
        (13, 'Dragon', 'gain the advantage'),
        (14, 'Turrets', 'Win the game'),
        (15, 'Baron', 'Break the build'),
        (16, 'Dragon', 'gain the advantage'),
        (17, 'Baron', 'Break the build'),
        (18, 'Turrets', 'Win the game'),
        (19, 'Dragon', 'gain the advantage'),
        (20, 'Baron', 'Break the build'),
        (21, 'Dragon', 'gain the advantage'),
        (22, 'Turrets', 'Win the game'),
    ]
    # db.insert_data(insert_Interaction_query, Interaction_values)
    # db.show_data('interaction')
