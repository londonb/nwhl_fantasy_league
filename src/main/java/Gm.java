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

  @Override
  public boolean equals(Object otherGm) {
    if(!(otherGm instanceof Gm)) {
      return false;
    } else {
      Gm newGm = (Gm) otherGm;
      return this.getId() == newGm.getId() &&
        this.getName().equals(newGm.getName());

    }
  }

  //CREATE

  public void save() {
    try(Connection con = DB.sql2o.open()) {
      String sql = "INSERT INTO gms (user_name) VALUES (:name)";
      this.id = (int) con.createQuery(sql, true)
        .addParameter("name", user_name)
        .executeUpdate()
        .getKey();
    }
  }

  //READ
  public static List<Gm> all() {
    try(Connection con = DB.sql2o.open()) {
      String sql = "SELECT * FROM gms";
      return con.createQuery(sql)
        .executeAndFetch(Gm.class);
    }
  }

  public static Gm find(int id) {
    try(Connection con = DB.sql2o.open()) {
      String sql = "SELECT * FROM gms WHERE id=:id";
      return con.createQuery(sql)
        .addParameter("id", id)
        .executeAndFetchFirst(Gm.class);
    }
  }
  //UPDATE

  public void updateName(String name) {
    user_name=name;
    try(Connection con = DB.sql2o.open()) {
      String sql = "UPDATE gms SET user_name=:user_name WHERE id=:id";
      con.createQuery(sql)
        .addParameter("user_name", user_name)
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
      String sql = "DELETE FROM gms WHERE id=:id";
      con.createQuery(sql)
        .addParameter("id", id)
        .executeUpdate();
    }
  } 

  // JOIN TABLE INTERACTION

  public List<Team> allTeams() {
    try(Connection con = DB.sql2o.open()) {
      String sql = "SELECT * FROM teams WHERE gm_id = :id";
      return con.createQuery(sql)
        .addParameter("id", id)
        .executeAndFetch(Team.class);
    }
  }

}
