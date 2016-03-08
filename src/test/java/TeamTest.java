import org.junit.*;
import static org.junit.Assert.*;

public class TeamTest {

  @Rule
  public DatabaseRule database = new DatabaseRule();

  @Test
  public void team_instantiatesCorrectly_true() {
    Team newTeam = new Team("Cheryl", 1);
    assertTrue(newTeam instanceof Team);
  }

  @Test
  public void all_emptyAtFirst() {
    assertEquals(Team.all().size(), 0);
  }

  @Test
  public void equals_returnsTrueIfNamesAreTheSame() {
    Team newTeam = new Team("Cheryl", 1);
    Team newTeam2 = new Team("Cheryl", 1);
    assertTrue(newTeam.equals(newTeam2));
  }

  @Test
  public void save_savesObjectIntoDBWithID_true() {
    Team newTeam = new Team("Cheryl", 1);
    newTeam.save();
    Team savedTeam = Team.all().get(0);
    assertEquals(savedTeam, newTeam);
  }

  @Test
  public void find_returnsTeamObjectFromId_true() {
    Team newTeam = new Team("Cheryl", 1);
    newTeam.save();
    Team otherTeam = Team.find(newTeam.getId());
    assertEquals(newTeam, otherTeam);
  }

  @Test
  public void update_updatesAllTeamsVariables_true() {
    Team newTeam = new Team("Masters of Luck", 1);
    newTeam.save();
    newTeam.updateName("Cheryl");
    Team otherTeam = Team.find(newTeam.getId());
    assertEquals(newTeam, otherTeam);
  }

  @Test
  public void delete_deletesASpecificLeague() {
    Team newTeam = new Team("Cheryl", 1);
    Team newTeam2 = new Team("Beryl", 1);
    newTeam.save();
    newTeam2.save();
    newTeam.delete();
    assertFalse(Team.all().contains(newTeam));
  }

  @Test
  public void addPlayer_AddsAPlayerToTeam() {
    Team newTeam = new Team("Cheryl", 1);
    Team newTeam2 = new Team("Beryl", 1);
    Player newPlayer = Player.find(5);
    newTeam.save();
    newTeam2.save();
    newTeam.addPlayer(newPlayer);
    assertTrue(newTeam.allPlayers().contains(newPlayer));
  }

  @Test
  public void evaluatePlayer_ChecksValidityOfPlayerChoice_false() {
    Player player1 = Player.find(5);
    Player player2 = Player.find(55);
    Player player3 = Player.find(6);
    Player player4 = Player.find(45);
    Team newTeam = new Team("Cheryl", 1);
    newTeam.save();
    newTeam.evaluatePlayer(player1);
    newTeam.evaluatePlayer(player2);
    newTeam.evaluatePlayer(player3);
    newTeam.evaluatePlayer(player4);
    assertTrue(newTeam.allPlayers().contains(player3));
    assertFalse(newTeam.allPlayers().contains(player4));
  }
}
