# PHP Package template

A template to write a php package, consist mostly of boilerplate code

Includes bash scripts to automate testing
### Usage
```
$ git clone https://github.com/alecrabbit/php-package-template.git
...
$ cd php-package-template
$ ./setup
```
Then follow the instructions
```
Package template setup...
Enter package owner [alecrabbit]: mikewazowski
Enter package name [moomba]: monster
Enter package description [PHP Library]: Awesome library Monsters Inc.
Enter package namespace [Monster]: 
Enter package dir [monster]: php-monster
Creating composer.json.result
{
  "name": "mikewazowski/monster",
  "description": "Awesome library Monsters Inc.",
  "type": "library",
  "require": {
    "php": ">=7.2"
  },
  "require-dev": {
    "phpunit/phpunit": "^8.0",
    "nunomaduro/collision": "^3.0",
    "symfony/var-dumper": "^4.2"
  },
  "license": "MIT",
  "autoload": {
    "psr-4": {
      "Monster\\": "src\\Monster"
    }
  },
  "autoload-dev": {
    "psr-4": {
      "Monster\\Tests\\": "tests"
    }
  },
  "minimum-stability": "beta",
  "prefer-stable": true
}
Parameters:
Directory: php-monster
Package: mikewazowski/monster
Description: Awesome library Monsters Inc.
Namespace: Monster

Continue? y
...
```

### Running tests script
```
$ ./bin/tests --all
Tests, coverage, analysis and metrics script
Version: 0.1.18
Main .env file found
Secondary .env file not found
Creating symlink to main .env file
Setting terminal title...

[ ON ]  Container restart
[ ON ]  Analysis
[ -- ]  PHPMetrics
[ -- ]  Multi-tester
[ ON ]  PHPUnit
[ ON ]  Coverage
[ ON ]  Beautifier

Restarting container...
Stopping monster_app_1 ... done
Removing monster_app_1 ... done
Removing network monster_default
Creating network "monster_default" with the default driver
Creating monster_app_1 ... done

Processing...

PHP version:
PHP 7.2.17 (cli) (built: Apr  6 2019 04:06:56) ( ZTS )
Copyright (c) 1997-2018 The PHP Group
Zend Engine v3.2.0, Copyright (c) 1998-2018 Zend Technologies
    with Xdebug v2.7.0, Copyright (c) 2002-2019, by Derick Rethans

PhpUnit...

Generating XDEBUG Filter...
PHPUnit 8.1.3 by Sebastian Bergmann and contributors.

Wrote Xdebug filter script to tests/tmp/xdebug-filter.php 

Running tests with coverage...
PHPUnit 8.1.3 by Sebastian Bergmann and contributors.

.                                                                   1 / 1 (100%)

Time: 72 ms, Memory: 6.00 MB

OK (1 test, 1 assertion)

Generating code coverage report in Clover XML format ... done

Generating code coverage report in HTML format ... done


Code Coverage Report:   
  2019-05-01 13:54:09   
                        
 Summary:               
  Classes: 100.00% (1/1)
  Methods: 100.00% (1/1)
  Lines:   100.00% (1/1)

\Monster::Monster\BasicClass
  Methods: 100.00% ( 1/ 1)   Lines: 100.00% (  1/  1)

PHPStan...
PHPStan - PHP Static Analysis Tool 0.11.5
                                                                                                                        
 [OK] No errors                                                                                                         
                                                                                                                        


Psalm config found...

Psalm...
Psalm 3.2.9@473c8cb83209de1b66a1487400c0ea47a2ee65cc
Scanning files...
Analyzing files...

------------------------------
No errors found!
------------------------------

Checks took 0.21 seconds and used 26.973MB of memory
Psalm was able to infer types for 100% of the codebase

Generating report file: ./../tests/report.html

PHP Code Sniffer...
PHP_CodeSniffer version 3.4.2 (stable) by Squiz (http://www.squiz.net)

PHP Code Sniffer Beautifier...
PHP_CodeSniffer version 3.4.2 (stable) by Squiz (http://www.squiz.net)

No fixable errors were found

Time: 201ms; Memory: 6MB


Executed in 10s
Bye!
```
