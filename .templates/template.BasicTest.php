<?php

namespace Tests\PACKAGE_NSPACE;

use PACKAGE_NSPACE\BasicClass;
use PHPUnit\Framework\TestCase;

class BasicTest extends TestCase
{
    /** @test */
    public function dummy():void
    {
        $this->assertTrue(BasicClass::get());
    }
}
