dc-e app <?php
/**
 * User: alec
 * Date: 31.10.18
 * Time: 16:34
 */

use PHPUnit\Framework\TestCase;

class BasicTest extends TestCase

{
    /** @test */
    public function Dummy():void
    {
        $this->assertEquals(1, 1);
    }

}