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
  }

  public String getName() {
    return league_name;
  }

  public int getId() {
    return id;
  }

  //CREATE

  //READ
  public static List<League> all() {
    try(Connection con = DB.sql2o.open()) {
      String sql = "SELECT * FROM leagues";
      return con.createQuery(sql)
        .executeAndFetch(League.class);
    }
  }
  //UPDATE

  //DELETE


}
