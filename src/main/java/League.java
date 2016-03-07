import org.sql2o.*;
import java.util.List;

public class League {
  private int id;
  private String leagueName;

  public League(String name) {
    leagueName = name;
  }

  public String getName() {
    return leagueName;
  }

  public int getId() {
    return id;
  }


}
