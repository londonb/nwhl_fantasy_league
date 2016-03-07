import org.junit.*;
import static org.junit.Assert.*;

public class TeamTest {

  @Rule
  public DatabaseRule database = new DatabaseRule();

  @Test
  public void team_instantiatesCorrectly_true() {
    Team newTeam = new Team("Cheryl");
    assertTrue(newTeam instanceof Team);
  }

  @Test
  public void all_emptyAtFirst() {
    assertEquals(Team.all().size(), 0);
  }

  @Test
  public void equals_returnsTrueIfNamesAreTheSame() {
    Team newTeam = new Team("Cheryl");
    Team newTeam2 = new Team("Cheryl");
    assertTrue(newTeam.equals(newTeam2));
  }

  @Test
  public void save_savesObjectIntoDBWithID_true() {
    Team newTeam = new Team("Cheryl");
    newTeam.save();
    Team savedTeam = Team.all().get(0);
    assertEquals(savedTeam, newTeam);
  }

  @Test
  public void find_returnsTeamObjectFromId_true() {
    Team newTeam = new Team("Cheryl");
    newTeam.save();
    Team otherTeam = Team.find(newTeam.getId());
    assertEquals(newTeam, otherTeam);
  }

  @Test
  public void update_updatesAllTeamsVariables_true() {
    Team newTeam = new Team("Masters of Luck");
    newTeam.save();
    newTeam.updateName("Cheryl");
    Team otherTeam = Team.find(newTeam.getId());
    assertEquals(newTeam, otherTeam);
  }

  @Test
  public void delete_deletesASpecificLeague() {
    Team newTeam = new Team("Cheryl");
    Team newTeam2 = new Team("Beryl");
    newTeam.save();
    newTeam2.save();
    newTeam.delete();
    assertFalse(Team.all().contains(newTeam));
  }

}
