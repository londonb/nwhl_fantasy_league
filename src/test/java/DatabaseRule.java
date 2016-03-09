import org.junit.rules.ExternalResource;
import org.sql2o.*;

public class DatabaseRule extends ExternalResource {

  protected void before() {
    DB.sql2o = new Sql2o("jdbc:postgresql://localhost:5432/nwhl_fantasy_test", null, null);
  }

  protected void after() {
    try(Connection con = DB.sql2o.open()) {
      String deleteGmsQuery = "DELETE FROM gms *;";
      String deleteLeaguesQuery = "DELETE FROM leagues *;";
      String deleteTeamsQuery = "DELETE FROM teams *;";
      String deleteLeagues_TeamsQuery = "DELETE FROM leagues_teams *;";
      String deletePlayers_TeamsQuery = "DELETE FROM players_teams *;";
      String deleteGmsLeaguesQuery = "DELETE FROM gms_leagues *;";
      String deleteRosterQuery = "DELETE FROM rosters *;";

      con.createQuery(deleteGmsQuery).executeUpdate();
      con.createQuery(deleteLeaguesQuery).executeUpdate();
      con.createQuery(deleteTeamsQuery).executeUpdate();
      con.createQuery(deleteLeagues_TeamsQuery).executeUpdate();
      con.createQuery(deletePlayers_TeamsQuery).executeUpdate();
      con.createQuery(deleteRosterQuery).executeUpdate();
      con.createQuery(deleteGmsLeaguesQuery).executeUpdate();
    }
  }
}
