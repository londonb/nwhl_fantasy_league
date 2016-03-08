import org.junit.*;
import static org.junit.Assert.*;
import java.util.List;

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

  @Test
  public void allDrafted_CollectsAllPlayeysThatHaveBeenDrafted() {
    League newLeague = new League("Masters of Puck");
    newLeague.save();
    Player player1 = Player.find(12);
    Player player2 = Player.find(55);
    Player player3 = Player.find(30);
    Player player4 = Player.find(89);
    Player player5 = Player.find(71);
    Player player6 = Player.find(39);

    Team newTeam = new Team("Cheryl", 1);
    newTeam.save();
    Team newTeam2 = new Team("Beryl", 1);
    newTeam2.save();
    newLeague.addTeam(newTeam);
    newLeague.addTeam(newTeam2);
    newTeam.evaluatePlayer(player1);
    newTeam.evaluatePlayer(player2);
    newTeam.evaluatePlayer(player3);
    newTeam.evaluatePlayer(player5);
    newTeam.evaluatePlayer(player6);
    newTeam2.evaluatePlayer(player4);
    assertEquals(6, newLeague.allDrafted().size());
  }

  @Test
  public void draftOrder_returnsTeamsInDraftOrder() {
    Team newTeam = new Team("Cheryl", 1);
    newTeam.save();
    Team newTeam2 = new Team("Beryl", 2);
    newTeam2.save();
    Team newTeam3 = new Team("Maisie", 3);
    newTeam3.save();
    Team newTeam4 = new Team("Killler", 4);
    newTeam4.save();
    League newLeague = new League("Masters of Puck");
    newLeague.save();
    newLeague.addTeam(newTeam);
    newLeague.addTeam(newTeam2);
    newLeague.addTeam(newTeam3);
    newLeague.addTeam(newTeam4);
    List<Team> testTeams = newLeague.allTeams();
    //assertEquals(testTeams.get(1).getName(), newLeague.draftOrder().get(1).getName());
    //assertEquals(testTeams, newLeague.draftOrder());
    assertFalse(testTeams.equals(newLeague.draftOrder()));
    assertTrue(newLeague.draftOrder().contains(newTeam3));
  }

}
