<?php

namespace AlecRabbit\Tests\Package;

use AlecRabbit\Package\BasicClass;
use PHPUnit\Framework\TestCase;

class BasicTest extends TestCase
{
    /** @test */
    public function dummy():void
    {
        $this->assertTrue(BasicClass::get());
    }
}
