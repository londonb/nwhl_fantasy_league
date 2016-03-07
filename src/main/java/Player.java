import org.sql2o.*;
import java.util.List;

public class Player {
  private int id;
  private String player_name;
  private String pos; //position
  private int salary;


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
      String sql = "SELECT * FROM players";
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
  //UPDATE

  //DELETE

}