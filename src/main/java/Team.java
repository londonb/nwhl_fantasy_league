import org.sql2o.*;
import java.util.List;

public class Team {
  private int id;
  private String team_name;
  private final int MAX_PLAYERS;
  private int current_players;


  public Team(String name) {
    team_name = name;
    MAX_PLAYERS = 8;
    current_players = 0;
  }

  public String getName() {
    return team_name;
  }

  public int getId() {
    return id;
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
        this.getCurrentPlayers() == newTeam.getCurrentPlayers() &&
        this.getName().equals(newTeam.getName());
    }
  }

  //CREATE

  public void save() {
    try(Connection con = DB.sql2o.open()) {
      String sql = "INSERT INTO teams (team_name, current_players, max_players) VALUES (:name, :current_players, :max_players)";
      this.id = (int) con.createQuery(sql, true)
        .addParameter("name", team_name)
        .addParameter("current_players", current_players)
        .addParameter("max_players", MAX_PLAYERS)
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
      String sql = "DELETE FROM teams WHERE id=:id";
      con.createQuery(sql)
        .addParameter("id", id)
        .executeUpdate();
    }
  } // add deletion from join tables AND LEAGUES here!!!


}
