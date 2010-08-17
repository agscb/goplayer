package goplayer
{
  import org.asspec.SizedTest
  import org.asspec.basic.AbstractSuite

  public class MainSuite extends AbstractSuite implements SizedTest
  {
    public function get size() : uint { return 8 }

    override protected function populate() : void
    {
      add(URLSpecification)
      add(RTMPStreamPlayerSpecification)
    }
  }
}
