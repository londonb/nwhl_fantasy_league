import org.junit.*;
import static org.junit.Assert.*;

public class LeagueTest {

  @Rule
  public DatabaseRule database = new DatabaseRule();

  @Test
  public void league_instantiatesCorrectly_true() {
    League newLeague = new League("Masters of Puck");
    assertTrue(newLeague instanceof League);
  }

  @Test
  public void all_emptyAtFirst() {
    assertEquals(League.all().size(), 0);
  }

  @Test
  public void equals_returnsTrueIfAllDataAreTheSame() {
    League newLeague = new League("Masters of Puck");
    League newLeague2 = new League("Masters of Puck");
    assertTrue(newLeague.equals(newLeague2));
  }

  @Test
  public void save_savesObjectIntoDBWithID_true() {
    League newLeague = new League("Masters of Puck");
    newLeague.save();
    League savedLeague = League.all().get(0);
    assertEquals(savedLeague, newLeague);
  }

  @Test
  public void find_returnsLeagueObjectFromId_true() {
    League newLeague = new League("Masters of Puck");
    newLeague.save();
    League otherLeague = League.find(newLeague.getId());
    assertEquals(newLeague, otherLeague);
  }

  @Test
  public void update_updatesAllLeaguesVariables_true() {
    League newLeague = new League("Masters of Luck");
    newLeague.save();
    newLeague.updateName("Masters of Puck");
    League otherLeague = League.find(newLeague.getId());
    assertEquals(newLeague, otherLeague);
  }

  @Test
  public void delete_deletesASpecificLeague() {
    League newLeague = new League("Masters of Puck");
    League newLeague2 = new League("PowderPuck Girls");
    newLeague.save();
    newLeague2.save();
    newLeague.delete();
    assertFalse(League.all().contains(newLeague));
  }

  @Test
  public void addTeam_AddsATeamAndItsGMToLeague() {
    League newLeague = new League("Masters of Puck");
    League newLeague2 = new League("PowderPuck Girls");
    newLeague.save();
    newLeague2.save();
    Gm newGm = new Gm("Cheryl");
    Gm newGm2 = new Gm("Beryl");
    newGm.save();
    newGm2.save();
    Team newTeam = new Team("Cheryl's Team", newGm.getId());
    newTeam.save();
    newLeague.addTeam(newTeam);
    assertTrue(newLeague.allTeams().contains(newTeam));
  }
}
