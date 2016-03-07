import org.sql2o.*;
import java.util.List;

public class Gm {
  private int id;
  private String userName;

  public Gm(String name) {
    userName = name;
  }

  public String getName() {
    return userName;
  }

  public int getId() {
    return id;
  }


}
