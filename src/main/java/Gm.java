import org.sql2o.*;
import java.util.List;

public class Gm {
  private int id;
  private String user_name;


  public Gm(String name) {
    user_name = name;
  }

  public String getName() {
    return user_name;
  }

  public int getId() {
    return id;
  }


}
