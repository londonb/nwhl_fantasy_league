import org.sql2o.*;
import java.util.*;
import org.apache.commons.lang.StringUtils;

public class Team implements Comparable<Team> {
  private int id;
  private String team_name;
  private final int MAX_PLAYERS;
  private int current_players;
  private int gm_id;
  private double points;


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

  public double getPoints() {
    return points;
  }

  public int getGmId() {
    return gm_id;
  }

  public int getCurrentPlayers() {
    return current_players;
  }

  @Override
  public int compareTo(Team other) {
    return Double.compare(this.getPoints(), other.getPoints());
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
      String sql = "SELECT * FROM teams ORDER BY team_name";
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
      String rostersSql = "DELETE FROM rosters WHERE team_id = :id";
      con.createQuery(sql)
        .addParameter("id", id)
        .executeUpdate();
      con.createQuery(leagueJoinSql)
        .addParameter("id", id)
        .executeUpdate();
      con.createQuery(playersJoinSql)
        .addParameter("id", id)
        .executeUpdate();
      con.createQuery(rostersSql)
        .addParameter("id", id)
        .executeUpdate();
      con.createQuery(gmSql)
        .addParameter("league_id", league_id)
        .addParameter("new_current_gms", currentTeams)
        .executeUpdate();
    }
  }


  //JOIN TABLE INTERACTION
  public League getLeague() {
    String sql = "SELECT leagues.* FROM teams JOIN leagues_teams ON teams.id = leagues_teams.team_id JOIN leagues ON leagues_teams.league_id = leagues.id WHERE teams.id = :id";
    try(Connection con = DB.sql2o.open()) {
      return con.createQuery(sql)
        .addParameter("id", id)
        .executeAndFetchFirst(League.class);
    }
  }

  public void addPlayer(Player newPlayer) { //SHOULD BE ONLY CALLED FROM WITHIN evaluatePlayer
    current_players++;
    boolean starter = false;
    if (current_players < 6) {
      starter = true;
    }
    try(Connection con = DB.sql2o.open()) {
      String sql = "INSERT INTO players_teams (team_id, player_id, starter) VALUES (:team_id, :player_id, :starter)";
      String playerSql = "UPDATE teams SET current_players=:current_players WHERE id=:id";
      con.createQuery(sql)
        .addParameter("team_id", this.id)
        .addParameter("player_id", newPlayer.getId())
        .addParameter("starter", starter)
        .executeUpdate();
      con.createQuery(playerSql)
        .addParameter("id", this.id)
        .addParameter("current_players", current_players)
        .executeUpdate();
    }
  }

  public Integer currentSalarySpent() {
    String sql = "SELECT SUM(players.salary) AS total_sum FROM teams JOIN players_teams ON teams.id = players_teams.team_id JOIN players ON players_teams.player_id = players.id WHERE teams.id = :id";
    try(Connection con = DB.sql2o.open()) {
      return con.createQuery(sql)
        .addParameter("id", id)
        .executeAndFetchFirst(Integer.class);
    }
  }

  public String evaluatePlayer(Player newPlayer) { //THIS FN CALLS ADD PLAYER
    if(current_players + 1 > MAX_PLAYERS) {
      return "You have already selected the maximum number of players";
    } else if (newPlayer.getId() == 26) {
      return "Denna Laing is not a draftable player.";
    } else if (current_players == 0) {
      this.addPlayer(newPlayer);
      return newPlayer.getName() + " has been successfully added to " + this.getName();
    }
    Integer salaryCap = 125000;
    String sqlSalary = "SELECT SUM(players.salary) AS total_sum FROM teams JOIN players_teams ON teams.id = players_teams.team_id JOIN players ON players_teams.player_id = players.id WHERE teams.id = :id";
    try(Connection con = DB.sql2o.open()) {
      Integer salary = (Integer) con.createQuery(sqlSalary)
        .addParameter("id", this.id)
        .executeAndFetchFirst(Integer.class);

      if (salary + newPlayer.getSalary() <= salaryCap) {
        this.addPlayer(newPlayer);
        return newPlayer.getName() + " has been successfully added to " + this.getName();
      } else {
        String capOverage = team_name + " does not have the available cap space to draft " + newPlayer.getName();
        capOverage += ". There is currently $" + (salaryCap - salary) + " in cap space remaining.";
        return capOverage;
      }
    }
  }

  public List<Player> allPlayers() {
    try(Connection con = DB.sql2o.open()) {
      String sql = "SELECT players.* FROM teams JOIN players_teams ON (teams.id = players_teams.team_id) JOIN players ON (players_teams.player_id = players.id) WHERE teams.id = :id ORDER BY players.player_name";
      return con.createQuery(sql)
        .addParameter("id", id)
        .executeAndFetch(Player.class);
    }
  }

  // ROSTER MANIPULATION
  //select starters
  public void selectStarters(String[] players) {
    String sqlRemove = "UPDATE players_teams SET starter = false WHERE team_id = :team_id";
    String sqlAdd = "UPDATE players_teams SET starter = true WHERE player_id = ANY (string_to_array(:players, ',')::INT[]) AND team_id = :team_id";
    try(Connection con = DB.sql2o.open()) {
      con.createQuery(sqlRemove)
        .addParameter("team_id", id)
        .executeUpdate();
      con.createQuery(sqlAdd)
        .addParameter("team_id", id)
        .addParameter("players", StringUtils.join(players, ","))
        .executeUpdate();
    }
  }
  //find all starters

  public List<Player> allStarters() {
    try(Connection con = DB.sql2o.open()) {
      String sql = "SELECT players.* FROM teams JOIN players_teams ON (teams.id = players_teams.team_id) JOIN players ON (players_teams.player_id = players.id) WHERE teams.id = :id AND players_teams.starter = TRUE ORDER BY players.player_name";
      return con.createQuery(sql)
        .addParameter("id", id)
        .executeAndFetch(Player.class);
    }
  }
  //add to roster table

  public void setWeeklyRoster(int week) {
    try(Connection con= DB.sql2o.open()) {
      for (Player player : this.allStarters()) {
        String sql = "INSERT INTO rosters (team_id, player_id, week) VALUES (:team_id, :player_id, :week)";
        con.createQuery(sql)
          .addParameter("team_id", id)
          .addParameter("player_id", player.getId())
          .addParameter("week", week)
          .executeUpdate();
      }
    }
  }

  public List<Player> getWeeklyRoster(int week) {
    try(Connection con = DB.sql2o.open()) {
      String sql = "SELECT players.* FROM teams JOIN rosters ON (teams.id = rosters.team_id) JOIN players ON (rosters.player_id = players.id) WHERE teams.id = :id AND rosters.week = :week ORDER BY players.player_name";
      return con.createQuery(sql)
        .addParameter("id", id)
        .addParameter("week", week)
        .executeAndFetch(Player.class);
    }
  }

  // FANTASY POINT HANDLING
  public double getWeeklyPoints(int week) {
    List<Player> roster = this.getWeeklyRoster(week);
    double score = 0;
    for(Player starter : roster) {
      for(Map<String, Object> stats : starter.getStats(week)) {
        score += (double) stats.get("fantasy_points");
      }
    }
    this.points = score;
    return score;
  }

  public double getTotalPoints(int week) {
    double total = 0;
    for(int i=1 ; i <= week ; i++ ) {
      total += this.getWeeklyPoints(i);
    }
    this.points = total;
    return total;
  }
}
