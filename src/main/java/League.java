import org.sql2o.*;
import java.util.List;

public class League {
  private int id;
  private String league_name;
  private int current_gms;
  private final int MAX_GMS;

  public League(String name) {
    league_name = name;
    MAX_GMS = 10;
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
      String sql = "SELECT * FROM leagues";
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

  //DELETE


}
