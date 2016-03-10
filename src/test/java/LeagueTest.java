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

  @Test
  public void rankTeams_returnsTeamsInRankedByCumulativePoints() {
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

    newTeam.evaluatePlayer(Player.find(12));
    newTeam.evaluatePlayer(Player.find(70));
    newTeam.evaluatePlayer(Player.find(55));
    newTeam.evaluatePlayer(Player.find(1));
    newTeam.evaluatePlayer(Player.find(3));
    newTeam2.evaluatePlayer(Player.find(90));
    newTeam2.evaluatePlayer(Player.find(7));
    newTeam2.evaluatePlayer(Player.find(42));
    newTeam2.evaluatePlayer(Player.find(74));
    newTeam2.evaluatePlayer(Player.find(82));
    newTeam3.evaluatePlayer(Player.find(5));
    newTeam3.evaluatePlayer(Player.find(88));
    newTeam3.evaluatePlayer(Player.find(19));
    newTeam3.evaluatePlayer(Player.find(27));
    newTeam3.evaluatePlayer(Player.find(33));
    newTeam4.evaluatePlayer(Player.find(29));
    newTeam4.evaluatePlayer(Player.find(67));
    newTeam4.evaluatePlayer(Player.find(35));
    newTeam4.evaluatePlayer(Player.find(73));
    newTeam4.evaluatePlayer(Player.find(34));
    newTeam.setWeeklyRoster(1);
    newTeam.setWeeklyRoster(2);
    newTeam.setWeeklyRoster(3);
    newTeam.setWeeklyRoster(4);
    newTeam.setWeeklyRoster(5);
    newTeam.setWeeklyRoster(6);
    newTeam.setWeeklyRoster(7);
    newTeam.setWeeklyRoster(8);
    newTeam2.setWeeklyRoster(1);
    newTeam2.setWeeklyRoster(2);
    newTeam2.setWeeklyRoster(3);
    newTeam2.setWeeklyRoster(4);
    newTeam2.setWeeklyRoster(5);
    newTeam2.setWeeklyRoster(6);
    newTeam2.setWeeklyRoster(7);
    newTeam2.setWeeklyRoster(8);
    newTeam3.setWeeklyRoster(1);
    newTeam3.setWeeklyRoster(2);
    newTeam3.setWeeklyRoster(3);
    newTeam3.setWeeklyRoster(4);
    newTeam3.setWeeklyRoster(5);
    newTeam3.setWeeklyRoster(6);
    newTeam3.setWeeklyRoster(7);
    newTeam3.setWeeklyRoster(8);
    newTeam4.setWeeklyRoster(1);
    newTeam4.setWeeklyRoster(2);
    newTeam4.setWeeklyRoster(3);
    newTeam4.setWeeklyRoster(4);
    newTeam4.setWeeklyRoster(5);
    newTeam4.setWeeklyRoster(6);
    newTeam4.setWeeklyRoster(7);
    newTeam4.setWeeklyRoster(8);
    double[] original = {newTeam.getTotalPoints(10), newTeam2.getTotalPoints(10),  newTeam3.getTotalPoints(10), newTeam4.getTotalPoints(10)};

    assertEquals(newLeague.rankTeams(10).get(0).getPoints(), original[0], 0);
    assertEquals(newLeague.rankTeams(10).get(1).getPoints(), original[1], 0);
    assertEquals(newLeague.rankTeams(10).get(2).getPoints(), original[3], 0);
    assertEquals(newLeague.rankTeams(10).get(3).getPoints(), original[2], 0);
    //assertEquals(newLeague.rankTeams(10).get(0).getPoints(), newTeam2.getPoints(), 0);
  }

  @Test
  public void rankWeeklyTeams_returnsTeamsRankedByWeeklyResult() {
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

    newTeam.evaluatePlayer(Player.find(12));
    newTeam.evaluatePlayer(Player.find(70));
    newTeam.evaluatePlayer(Player.find(55));
    newTeam.evaluatePlayer(Player.find(1));
    newTeam.evaluatePlayer(Player.find(3));
    newTeam2.evaluatePlayer(Player.find(90));
    newTeam2.evaluatePlayer(Player.find(7));
    newTeam2.evaluatePlayer(Player.find(42));
    newTeam2.evaluatePlayer(Player.find(74));
    newTeam2.evaluatePlayer(Player.find(82));
    newTeam3.evaluatePlayer(Player.find(5));
    newTeam3.evaluatePlayer(Player.find(88));
    newTeam3.evaluatePlayer(Player.find(19));
    newTeam3.evaluatePlayer(Player.find(27));
    newTeam3.evaluatePlayer(Player.find(33));
    newTeam4.evaluatePlayer(Player.find(29));
    newTeam4.evaluatePlayer(Player.find(67));
    newTeam4.evaluatePlayer(Player.find(35));
    newTeam4.evaluatePlayer(Player.find(73));
    newTeam4.evaluatePlayer(Player.find(34));
    newTeam.setWeeklyRoster(7);
    newTeam2.setWeeklyRoster(7);
    newTeam3.setWeeklyRoster(7);
    newTeam4.setWeeklyRoster(7);
    double[] original = {newTeam.getWeeklyPoints(7), newTeam2.getWeeklyPoints(7),  newTeam3.getWeeklyPoints(7), newTeam4.getWeeklyPoints(7)};
    assertEquals(newLeague.rankWeeklyTeams(7).get(0).getPoints(), original[3], 0);
    assertEquals(newLeague.rankWeeklyTeams(7).get(1).getPoints(), original[0], 0);
    assertEquals(newLeague.rankWeeklyTeams(7).get(2).getPoints(), original[1], 0);
    assertEquals(newLeague.rankWeeklyTeams(7).get(3).getPoints(), original[2], 0);
  }

}
