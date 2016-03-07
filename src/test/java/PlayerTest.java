import org.junit.*;
import static org.junit.Assert.*;

public class PlayerTest {

  @Rule
  public DatabaseRule database = new DatabaseRule();

  @Test
  public void all_alwaysSameSize() {
    assertEquals(Player.all().size(), 92);
  }

  @Test
  public void equals_returnsTrueIfAllPropertiesAreTheSame() {
    Player player1 = Player.find(5);
    Player player2 = Player.find(5);
    Player player3 = Player.find(6);
    assertTrue(player1.equals(player2));
    assertFalse(player1.equals(player3));
  }

  @Test
  public void find_returnsGmObjectFromId_true() {
    Player player1 = Player.find(5);
    Player player2 = Player.find(5);
    assertEquals(player1, player2);
  }
  //
  // @Test
  // public void update_updatesAllGmsVariables_true() {
  //   Gm newGm = new Gm("Masters of Luck");
  //   newGm.save();
  //   newGm.updateName("Cheryl");
  //   Gm otherGm = Gm.find(newGm.getId());
  //   assertEquals(newGm, otherGm);
  // }
  //
  // @Test
  // public void delete_deletesASpecificLeague() {
  //   Gm newGm = new Gm("Cheryl");
  //   Gm newGm2 = new Gm("Beryl");
  //   newGm.save();
  //   newGm2.save();
  //   newGm.delete();
  //   assertFalse(Gm.all().contains(newGm));
  // }

}
