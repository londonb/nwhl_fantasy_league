import org.sql2o.*;
import java.util.*;

public class League {
  private int id;
  private String league_name;
  private int current_gms;
  private final int MAX_GMS;

  public League(String name) {
    league_name = name;
    MAX_GMS = 8;
    current_gms = 0;
  }

  public String getName() {
    return league_name;
  }

  public int getId() {
    return id;
  }

  public int getCurrentGms() {
    return current_gms;
  }

  @Override
  public boolean equals(Object otherLeague) {
    if(!(otherLeague instanceof League)) {
      return false;
    } else {
      League newLeague = (League) otherLeague;
      return this.getId() == newLeague.getId() &&
        this.getName().equals(newLeague.getName()) &&
        this.getCurrentGms() == newLeague.getCurrentGms();

    }
  }

  //CREATE

  public void save() {
    try(Connection con = DB.sql2o.open()) {
      String sql = "INSERT INTO leagues (league_name, current_gms, MAX_GMS) VALUES (:name, :current_gms, :MAX_GMS)";
      this.id = (int) con.createQuery(sql, true)
        .addParameter("name", league_name)
        .addParameter("current_gms", current_gms)
        .addParameter("MAX_GMS", MAX_GMS)
        .executeUpdate()
        .getKey();
    }
  }

  //READ
  public static List<League> all() {
    try(Connection con = DB.sql2o.open()) {
      String sql = "SELECT * FROM leagues ORDER BY league_name";
      return con.createQuery(sql)
        .executeAndFetch(League.class);
    }
  }

  public static League find(int id) {
    try(Connection con = DB.sql2o.open()) {
      String sql = "SELECT * FROM leagues WHERE id=:id";
      return con.createQuery(sql)
        .addParameter("id", id)
        .executeAndFetchFirst(League.class);
    }
  }
  //UPDATE

  public void updateName(String name) {
    league_name=name;
    try(Connection con = DB.sql2o.open()) {
      String sql = "UPDATE leagues SET league_name=:league_name WHERE id=:id";
      con.createQuery(sql)
        .addParameter("league_name", league_name)
        .addParameter("id", id)
        .executeUpdate();
    }
  }

  //DELETE
  public void delete() {
    List<Team> myTeams = this.allTeams();
    for (Team team : myTeams) {
      team.delete();
    }
    try(Connection con = DB.sql2o.open()) {
      String sql = "DELETE FROM leagues WHERE id=:id";
      con.createQuery(sql)
        .addParameter("id", id)
        .executeUpdate();
    }
  }


  //JOIN TABLE INTERACTION
  public void addTeam(Team newTeam) {
    current_gms++;
    try(Connection con = DB.sql2o.open()) {
      String sql = "INSERT INTO leagues_teams (league_id, team_id) VALUES (:league_id, :team_id)";
      String gmSql = "UPDATE leagues SET current_gms=:current_gms WHERE id=:id";
      String joinSql = "INSERT INTO gms_leagues (gm_id, league_id) VALUES (:gm_id, :league_id) ";
      con.createQuery(sql)
        .addParameter("league_id", id)
        .addParameter("team_id", newTeam.getId())
        .executeUpdate();
      con.createQuery(joinSql)
        .addParameter("league_id", id)
        .addParameter("gm_id", newTeam.getGmId())
        .executeUpdate();
      con.createQuery(gmSql)
        .addParameter("id", this.id)
        .addParameter("current_gms", current_gms)
        .executeUpdate();
    }
  }

  public List<Team> allTeams() {
    try(Connection con = DB.sql2o.open()) {
      String sql = "SELECT teams.* FROM leagues JOIN leagues_teams ON (leagues.id = leagues_teams.league_id) JOIN teams ON (leagues_teams.team_id = teams.id) WHERE leagues.id = :id";
      return con.createQuery(sql)
        .addParameter("id", id)
        .executeAndFetch(Team.class);
    }
  }

  public boolean draftNotStarted() {
    return (this.allDrafted().size() == 0);
  }

  public List<Player> allDrafted() {
    try(Connection con = DB.sql2o.open()) {
      String sql = "SELECT players.* FROM leagues JOIN leagues_teams ON (leagues.id = leagues_teams.league_id) JOIN players_teams ON (leagues_teams.team_id = players_teams.team_id) JOIN players ON (players_teams.player_id = players.id) WHERE leagues.id = :id";
      return con.createQuery(sql)
      .addParameter("id", id)
      .executeAndFetch(Player.class);
    }
  }

  public static List<League> availableLeagues() {
    try(Connection con = DB.sql2o.open()) {
      String sql = "SELECT * FROM leagues WHERE current_gms < max_gms";
      return con.createQuery(sql)
      .executeAndFetch(League.class);
    }
  }

  // ESTABLISH DRAFT ORDER

  public List<Team> draftOrder() {
    List<Team> teams = this.allTeams();
    Random drafter = new Random();
    Collections.shuffle(teams, drafter);
    return teams;
  }
  
  // List<Team> drafting = testTeam.draftOrder();
  // int leagueSize = drafting.size();
  // int draftPosition = 0;
  // if (draftPosition < leagueSize * 8) {
  //   Team currentTeam = drafting.get(draftPosition % leagueSize);
  //   //add player logic - use evaluateplayer() not addplayer()
  //   draftPosition++; // pass this around via hidden form fields or cookies
  // }

//RANK TEAMS

  public List<Team> rankTeams(int week) { //cumulative through specified week
    List<Team> teams = this.allTeams();

    for (Team team : teams) {
      team.getTotalPoints(week);
    }
    Collections.sort(teams);
    Collections.reverse(teams);
    return teams;
  }


}
