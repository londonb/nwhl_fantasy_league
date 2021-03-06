import org.sql2o.*;

import java.util.*;

public class Player {
  private int id;
  private String player_name;
  private String pos; //position
  private int salary;
  private String url;
  private String profile_pic;

  public Player(String name) {
    player_name = name;
  }

  public String getName() {
    return player_name;
  }

  public int getId() {
    return id;
  }

  public int getSalary() {
    return salary;
  }

  public String getPos() {
    return pos;
  }

  public String getUrl() {
    return url;
  }

  public String getPic() {
    return profile_pic;
  }

  @Override
  public boolean equals(Object otherPlayer) {
    if(!(otherPlayer instanceof Player)) {
      return false;
    } else {
      Player newPlayer = (Player) otherPlayer;
      return this.getId() == newPlayer.getId() &&
        this.getName().equals(newPlayer.getName()) &&
        this.getPos().equals(newPlayer.getPos()) &&
        this.getSalary() == newPlayer.getSalary();
    }
  }

  //CREATE

  //READ
  public static List<Player> all() {
    try(Connection con = DB.sql2o.open()) {
      String sql = "SELECT * FROM players ORDER BY player_name";
      return con.createQuery(sql)
        .executeAndFetch(Player.class);
    }
  }

  public static Player find(int id) {
    try(Connection con = DB.sql2o.open()) {
      String sql = "SELECT * FROM players WHERE id=:id";
      return con.createQuery(sql)
        .addParameter("id", id)
        .executeAndFetchFirst(Player.class);
    }
  }

  // PLAYER PER WEEK AND CUMULATIVE STAT LINE INCLUDING FANTASY POINTS

  public List<Map<String, Object>> getStats(int week) {

    if(this.getPos().equals("G")) {
      try(Connection con = DB.sql2o.open()) {
        String sql = "SELECT * FROM goalies_stats WHERE player_id = :id AND week = :week";
        return con.createQuery(sql)
          .addParameter("id", id)
          .addParameter("week", week)
          .executeAndFetchTable().asList();
      }
    } else {
      try(Connection con = DB.sql2o.open()) {
        String sql = "SELECT * FROM skaters_stats WHERE player_id = :id AND week = :week";
        return con.createQuery(sql)
          .addParameter("id", id)
          .addParameter("week", week)
          .executeAndFetchTable().asList();
      }
    }
  }

  // CUMULATIVE FANTASY POINTS BY PLAYER
  public double getFantasyPoints(int week) {
    if(this.getPos().equals("G")){
      try(Connection con = DB.sql2o.open()){
        String sql = "SELECT SUM(goalies_stats.fantasy_points) FROM goalies_stats WHERE player_id = :id AND week <= :week";
        return (double) con.createQuery(sql)
          .addParameter("id", id)
          .addParameter("week", week)
          .executeAndFetchFirst(Double.class);
      }
    } else {
      try(Connection con = DB.sql2o.open()){
        String sql = "SELECT SUM(skaters_stats.fantasy_points) FROM skaters_stats WHERE player_id = :id AND week <= :week";
        return (double) con.createQuery(sql)
          .addParameter("id", id)
          .addParameter("week", week)
          .executeAndFetchFirst(Double.class);
      }
    }

  }
}
