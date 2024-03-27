import mysql.connector
import os
import json
import pandas as pd


if __name__ == '__main__':
    config_path = os.path.join(os.path.dirname(__file__), 'config.json')
    with open(config_path) as f:
        config_data = json.load(f)

    db = mysql.connector.connect(
        host=config_data['host'],
        user=config_data['user'],
        password=config_data['password'],
        database=config_data['database']
    )
    cursor = db.cursor()

    query_average = """
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
    """
    df_average = pd.read_sql_query(query_average, db)
    print(f"")
    # print(df_average)
    print('-----------------------------------')

    query_item = """
        SELECT cc.ChampionName, i.ItemName, m.Role ,COUNT(*) AS ItemCount
        FROM MatchItem m
        JOIN ChampionItem c ON m.ChampionItemID = c.ChampionItemID
        JOIN Item i ON c.ItemID = i.ItemID
        JOIN Champion cc ON c.ChampionID = cc.ChampionID
        GROUP BY cc.ChampionName, i.ItemName, m.Role
        ORDER BY ItemCount DESC;
    """
    df_item = pd.read_sql_query(query_item, db)
    print(f"Most popular items for each champion in each role")
    # print(df_item)


    query_champion = """
            SELECT c1.ChampionName AS Champion1, c2.ChampionName AS Champion2, COUNT(DISTINCT t1.MatchID) AS GamesPlayed
            FROM TeamPlayer tp1
            JOIN Team t1 ON tp1.TeamID = t1.TeamID
            JOIN Team t2 ON t1.MatchID = t2.MatchID AND t1.TeamID = t2.TeamID
            JOIN TeamPlayer tp2 ON tp1.TeamID = tp2.TeamID AND tp1.TeamPlayerID < tp2.TeamPlayerID AND t1.MatchID = t2.MatchID
            JOIN Champion c1 ON tp1.ChampionID = c1.ChampionID
            JOIN Champion c2 ON tp2.ChampionID = c2.ChampionID AND c1.ChampionID < c2.ChampionID
            GROUP BY Champion1, Champion2
            ORDER BY GamesPlayed DESC LIMIT 10;
    """
    print(f"Most popular champion pairs")
    df_champion = pd.read_sql_query(query_champion, db)
    # print(df_champion)
    
    
    
    with open('query_results.txt', 'w') as f:
        f.write(f"Average KDA, Death, Assist for each player on each champion with more than 10 games played\n")
        f.write(f"{df_average}\n")
        f.write('-----------------------------------\n')
        f.write(f"Most popular items for each champion in each role\n")
        f.write(f"{df_item}\n")
        f.write('-----------------------------------\n')
        f.write(f"Most popular champion pairs\n")
        f.write(f"{df_champion}\n")
    
