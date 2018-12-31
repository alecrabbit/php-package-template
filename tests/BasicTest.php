<?php

use PHPUnit\Framework\TestCase;

class BasicTest extends TestCase

{
    /** @test */
    public function Dummy():void
    {
        $this->assertEquals(1, 1);
    }

}