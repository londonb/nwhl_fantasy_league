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
  public void delete_deletesASpecificTeam() {
    Team newTeam = new Team("Cheryl", 1);
    Team newTeam2 = new Team("Beryl", 1);
    newTeam.save();
    newTeam2.save();
    League newLeague = new League("Masters of Puck");
    newLeague.save();
    newLeague.addTeam(newTeam);
    Player player1 = Player.find(5);
    Player player2 = Player.find(55);
    newTeam.evaluatePlayer(player1);
    newTeam.evaluatePlayer(player2);
    newTeam.delete();
    assertFalse(Team.all().contains(newTeam));
    assertEquals(newLeague.allTeams().size(), 0);
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
    Player player1 = Player.find(12);
    Player player2 = Player.find(55);
    Player player3 = Player.find(30);
    Player player4 = Player.find(89);
    Player player5 = Player.find(71);
    Player player6 = Player.find(39);

    Team newTeam = new Team("Cheryl", 1);
    newTeam.save();
    newTeam.evaluatePlayer(player1);
    newTeam.evaluatePlayer(player2);
    newTeam.evaluatePlayer(player3);
    newTeam.evaluatePlayer(player5);
    newTeam.evaluatePlayer(player6);
    newTeam.evaluatePlayer(player4);
    assertTrue(newTeam.allPlayers().contains(player3));
    assertFalse(newTeam.allPlayers().contains(player4));
  }

  @Test
  public void selectStarter_SpecificPlayerNowStarter_true() {
    Player player1 = Player.find(12);
    Player player2 = Player.find(55);
    Player player3 = Player.find(30);
    Player player4 = Player.find(3);
    Player player5 = Player.find(70);
    Player player6 = Player.find(39);

    Team newTeam = new Team("Cheryl", 1);
    newTeam.save();
    newTeam.evaluatePlayer(player1);
    newTeam.evaluatePlayer(player2);
    newTeam.evaluatePlayer(player3);
    newTeam.evaluatePlayer(player4);
    newTeam.evaluatePlayer(player5);
    newTeam.evaluatePlayer(player6);
    String[] starterIds = {"12", "55", "30", "3", "39"};
    newTeam.selectStarters(starterIds);
    assertTrue(newTeam.allStarters().contains(player6));
  }

  @Test
  public void setWeeklyRoster_AddsStartersToRosterTable_true() {
    Player player1 = Player.find(12);
    Player player2 = Player.find(55);
    Player player3 = Player.find(30);
    Player player4 = Player.find(3);
    Player player5 = Player.find(70);
    Player player6 = Player.find(39);

    Team newTeam = new Team("Cheryl", 1);
    newTeam.save();
    newTeam.evaluatePlayer(player1);
    newTeam.evaluatePlayer(player2);
    newTeam.evaluatePlayer(player3);
    newTeam.evaluatePlayer(player4);
    newTeam.evaluatePlayer(player5);
    newTeam.evaluatePlayer(player6);
    newTeam.setWeeklyRoster(3); //3 is week number

    assertFalse(newTeam.getWeeklyRoster(3).contains(player6));
    assertTrue(newTeam.getWeeklyRoster(3).contains(player3));
    assertEquals(newTeam.getWeeklyRoster(3), newTeam.allStarters());
  }
}
