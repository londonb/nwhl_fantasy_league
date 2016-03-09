import org.junit.*;
import static org.junit.Assert.*;
import java.util.*;

public class PlayerTest {

  @Rule
  public DatabaseRule database = new DatabaseRule();

  @Test
  public void all_alwaysSameSize() {
    assertEquals(Player.all().size(), 91);
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
    assertTrue(player1 instanceof Player);
    assertEquals(player1, player2);
  }

  @Test
  public void getId_retrievesId_true() {
    Player player1 = Player.find(5);
    assertEquals(player1.getId(), 5);
    assertEquals(player1.getName(), "Amber Moore");
  }

  @Test
  public void getStats_getsOneWeeksStats() {
    Player player1 = Player.find(53);
    List<Map<String, Object>> stats = player1.getStats(1);
    Player player2 = Player.find(76);
    List<Map<String, Object>> goalieStats = player2.getStats(3);
    assertEquals("F ", stats.get(0).get("pos"));
    assertEquals(18.6, stats.get(0).get("fantasy_points"));
    assertEquals("NYR33", goalieStats.get(0).get("pt_number"));
  }

  @Test
  public void getFantasyPoints_returnsCumulativePointTotal_week5() {
    Player player1 = Player.find(53);
    Player player2 = Player.find(76);
    assertEquals(41.6, player1.getFantasyPoints(5), 0);
    assertEquals(25.254150207, player2.getFantasyPoints(5), 0.1);
  }
}
