import org.junit.*;
import static org.junit.Assert.*;

public class GmTest {

  @Rule
  public DatabaseRule database = new DatabaseRule();

  @Test
  public void gm_instantiatesCorrectly_true() {
    Gm newGm = new Gm("Cheryl");
    assertTrue(newGm instanceof Gm);
  }

  @Test
  public void all_emptyAtFirst() {
    assertEquals(Gm.all().size(), 0);
  }

  @Test
  public void equals_returnsTrueIfNamesAreTheSame() {
    Gm newGm = new Gm("Cheryl");
    Gm newGm2 = new Gm("Cheryl");
    assertTrue(newGm.equals(newGm2));
  }

  @Test
  public void save_savesObjectIntoDBWithID_true() {
    Gm newGm = new Gm("Cheryl");
    newGm.save();
    Gm savedGm = Gm.all().get(0);
    assertEquals(savedGm, newGm);
  }

  @Test
  public void find_returnsGmObjectFromId_true() {
    Gm newGm = new Gm("Cheryl");
    newGm.save();
    Gm otherGm = Gm.find(newGm.getId());
    assertEquals(newGm, otherGm);
  }

  @Test
  public void update_updatesAllGmsVariables_true() {
    Gm newGm = new Gm("Masters of Luck");
    newGm.save();
    newGm.updateName("Cheryl");
    Gm otherGm = Gm.find(newGm.getId());
    assertEquals(newGm, otherGm);
  }

  @Test
  public void delete_deletesASpecificLeague() {
    Gm newGm = new Gm("Cheryl");
    Gm newGm2 = new Gm("Beryl");
    newGm.save();
    newGm2.save();
    newGm.delete();
    assertFalse(Gm.all().contains(newGm));
  }

  @Test
  public void allTeams_retrievesAllTeamsOwnedByGm() {
    Gm newGm = new Gm("Cheryl");
    Gm newGm2 = new Gm("Beryl");
    newGm.save();
    newGm2.save();
    Team newTeam = new Team("Cheryl's Team", newGm.getId());
    newTeam.save();
    Team newTeam2 = new Team("Beryl", newGm2.getId());
    newTeam2.save();
    assertFalse(newGm.allTeams().contains(newTeam2));
    assertTrue(newGm2.allTeams().contains(newTeam2));
  }

}
