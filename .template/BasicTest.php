<?php

namespace <PACKAGE_OWNR_NSPACE>Tests\<PACKAGE_NSPACE>;

use <PACKAGE_OWNR_NSPACE><PACKAGE_NSPACE>\BasicClass;
use PHPUnit\Framework\TestCase;

class BasicTest extends TestCase
{
    /** @test */
    public function dummy():void
    {
        $this->assertTrue(BasicClass::get());
        $this->assertFalse(BasicClass::get(5));
    }
}
