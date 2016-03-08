import org.sql2o.*;
import java.util.List;

public class Team {
  private int id;
  private String team_name;
  private final int MAX_PLAYERS;
  private int current_players;
  private int gm_id;


  public Team(String name, int gmId) {
    team_name = name;
    gm_id = gmId;
    MAX_PLAYERS = 8;
    current_players = 0;
  }

  public String getName() {
    return team_name;
  }

  public int getId() {
    return id;
  }

  public int getGmId() {
    return gm_id;
  }

  public int getCurrentPlayers() {
    return current_players;
  }

  @Override
  public boolean equals(Object otherTeam) {
    if(!(otherTeam instanceof Team)) {
      return false;
    } else {
      Team newTeam = (Team) otherTeam;
      return this.getId() == newTeam.getId() &&
        this.getGmId() == newTeam.getGmId() &&
        this.getCurrentPlayers() == newTeam.getCurrentPlayers() &&
        this.getName().equals(newTeam.getName());
    }
  }

  //CREATE

  public void save() {
    try(Connection con = DB.sql2o.open()) {
      String sql = "INSERT INTO teams (team_name, current_players, max_players, gm_id) VALUES (:name, :current_players, :max_players, :gm_id)";
      this.id = (int) con.createQuery(sql, true)
        .addParameter("name", team_name)
        .addParameter("current_players", current_players)
        .addParameter("max_players", MAX_PLAYERS)
        .addParameter("gm_id", gm_id)
        .executeUpdate()
        .getKey();
    }
  }

  //READ
  public static List<Team> all() {
    try(Connection con = DB.sql2o.open()) {
      String sql = "SELECT * FROM teams";
      return con.createQuery(sql)
        .executeAndFetch(Team.class);
    }
  }

  public static Team find(int id) {
    try(Connection con = DB.sql2o.open()) {
      String sql = "SELECT * FROM teams WHERE id=:id";
      return con.createQuery(sql)
        .addParameter("id", id)
        .executeAndFetchFirst(Team.class);
    }
  }
  //UPDATE

  public void updateName(String name) {
    team_name=name;
    try(Connection con = DB.sql2o.open()) {
      String sql = "UPDATE teams SET team_name=:team_name WHERE id=:id";
      con.createQuery(sql)
        .addParameter("team_name", team_name)
        .addParameter("id", id)
        .executeUpdate();
    }
  }

  //DELETE
  public void delete() {
    try(Connection con = DB.sql2o.open()) {
      String league = "SELECT league_id FROM leagues_teams WHERE team_id = :id";
      Integer league_id = (Integer) con.createQuery(league)
        .addParameter("id", id)
        .executeAndFetchFirst(Integer.class);
      League newLeague = League.find(league_id);
      int currentTeams = newLeague.getCurrentGms() -1;
      String sql = "DELETE FROM teams WHERE id=:id";
      String leagueJoinSql = "DELETE FROM leagues_teams WHERE team_id = :id";
      String playersJoinSql = "DELETE FROM players_teams WHERE team_id = :id";
      String gmSql = "UPDATE leagues SET current_gms=:new_current_gms WHERE id=:league_id";
      con.createQuery(sql)
        .addParameter("id", id)
        .executeUpdate();
      con.createQuery(leagueJoinSql)
        .addParameter("id", id)
        .executeUpdate();
      con.createQuery(playersJoinSql)
        .addParameter("id", id)
        .executeUpdate();
      con.createQuery(gmSql)
        .addParameter("league_id", league_id)
        .addParameter("new_current_gms", currentTeams)
        .executeUpdate();
    }
  } // add deletion from ROSTER join tables here!!!


  //JOIN TABLE INTERACTION
  public void addPlayer(Player newPlayer) {
    current_players++;
    try(Connection con = DB.sql2o.open()) {
      String sql = "INSERT INTO players_teams (team_id, player_id) VALUES (:team_id, :player_id)";
      String playerSql = "UPDATE teams SET current_players=:current_players WHERE id=:id";
      con.createQuery(sql)
        .addParameter("team_id", this.id)
        .addParameter("player_id", newPlayer.getId())
        .executeUpdate();
      con.createQuery(playerSql)
        .addParameter("id", this.id)
        .addParameter("current_players", current_players)
        .executeUpdate();
    }
  }

  public List<Player> allPlayers() {
    try(Connection con = DB.sql2o.open()) {
      String sql = "SELECT players.* FROM teams JOIN players_teams ON (teams.id = players_teams.team_id) JOIN players ON (players_teams.player_id = players.id) WHERE teams.id = :id";
      return con.createQuery(sql)
        .addParameter("id", id)
        .executeAndFetch(Player.class);
    }
  }

  public String evaluatePlayer(Player newPlayer) {
    if(current_players + 1 > MAX_PLAYERS) {
      return "You have already selected the maximum number of players";
    } else if (current_players == 0) {
      this.addPlayer(newPlayer);
      return newPlayer.getName() + " has been successfully added to " + this.getName();
    }
    Integer salaryCap = 104000;
    String sqlSalary = "SELECT SUM(players.salary) AS total_sum FROM teams JOIN players_teams ON teams.id = players_teams.team_id JOIN players ON players_teams.player_id = players.id WHERE teams.id = :id";
    try(Connection con = DB.sql2o.open()) {
      Integer salary = (Integer) con.createQuery(sqlSalary)
        .addParameter("id", this.id)
        .executeAndFetchFirst(Integer.class);

      if (salary + newPlayer.getSalary() < salaryCap) {
        this.addPlayer(newPlayer);
        return newPlayer.getName() + " has been successfully added to " + this.getName();
      } else {
        String capOverage = team_name + " does not have the available cap space to draft " + newPlayer.getName();
        capOverage += ". There is currently " + (salaryCap - salary) + " in cap space remaining.";
        return capOverage;
      }
    }
  }

  // ROSTER MANIPULATION
  // FANTASY POINT HANDLING
}
