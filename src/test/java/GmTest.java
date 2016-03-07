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

  // @Test
  // public void all_emptyAtFirst() {
  //   assertEquals(Restaurant.all().size(), 0);
  // }
  //
  // @Test
  // public void equals_returnsTrueIfRestaurantNamesAreTheSame() {
  //   Restaurant newResty = new Restaurant("Bobby", 1);
  //   Restaurant newRestyToo = new Restaurant("Bobby", 1);
  //   assertTrue(newResty.equals(newRestyToo));
  // }
}
