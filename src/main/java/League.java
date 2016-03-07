import org.sql2o.*;
import java.util.List;

public class League {
  private int id;
  private String league_name;

  public League(String name) {
    league_name = name;
  }

  public String getName() {
    return league_name;
  }

  public int getId() {
    return id;
  }


}
