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

  // @Test
  // public void equals_returnsTrueIfRestaurantNamesAreTheSame() {
  //   Restaurant newResty = new Restaurant("Bobby", 1);
  //   Restaurant newRestyToo = new Restaurant("Bobby", 1);
  //   assertTrue(newResty.equals(newRestyToo));
  // }
}
