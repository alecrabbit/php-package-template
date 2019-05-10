# 🐇 PHP Package template

A template to write a php package, consist mostly of boilerplate code

Includes bash scripts to automate testing

> Note: developed and tested on Ubuntu 18.04

### Usage
```bash
$ git clone https://github.com/alecrabbit/php-package-template.git
...
$ cd php-package-template
$ ./install
...
$ cd ..              # 'php-package-template' dir was renamed so don't forget to cd 
...
```

### Settings
#### Using script arguments
 You can pass parameters to setup script
 `./setup package_name package_owner "Your Name"`
 ```bash
 $ ./setup looney bunny "Bugs Bunny"
 ``` 
 it'll create `bunny/looney` package in `php-looney` dir

 `LICENSE` file:
 ```
 ...
 Copyright (c) 2019 Bugs Bunny
 ...
 ```
#### Using defaults file
Create a file `.php-package-template.defaults` in your home directory
```bash
$ touch ~/.php-package-template.defaults
```
Contents:
```
OWNER_NAME="Leeloo Dallas"          # Your name and lastname
OWNER=""velement"                   # your nickname on packagist
PACKAGE_NAME="multi-pass"           # default package name
```
This file will save you some time if you create a lot of packages :)

### Tested software

**Tested Operating Systems**

OS                                  | 
----------------------------------- | 
Ubuntu Linux (18.04 LTS)            | 

#### Setup script example output
```
Package template setup...
Version 0.2.12

Global settings found: /home/username/.php-package-template.defaults
Enter package owner name:
(Used in LICENSE file)
[Mike Wazowski] Bugs Bunny
Accepted value: 'Bugs Bunny'

Enter package owner:
(Used in composer.json line: "name": "owner/name"))
[mike-wazowski] Bugs-Bunny
Accepted value: 'bugs-bunny'

It should be unique among your packages!
Enter package name:
[monsters-inc] Looney -Tunes
Accepted value: 'looney-tunes'

Enter package description:
(Used in composer.json line: "description": "Your awesome description")
[Awesome library] 
Accepted value: 'Awesome library'

Enter package namespace:
[LooneyTunes] 
Accepted value: 'LooneyTunes'

Type 'y' to choose owner namespace otherwise no namespace will be used
Select namespace? y
1) No namespace
2) 'BugsBunny'
3) Enter your variant
Please enter your choice of owner namespace: 2
Accepted value: 'BugsBunny'

It should be new non-existent yet dir name!
Enter package directory:
('php-package-template' -> 'php-looney-tunes' ?)
[php-looney-tunes] 
Accepted value: 'php-looney-tunes'

Saving settings
Creating composer.json.result
{
  "name": "bugs-bunny/looney-tunes",
  "description": "Awesome library",
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
      "BugsBunny\\LooneyTunes\\": "src\\LooneyTunes"
    }
  },
  "autoload-dev": {
    "psr-4": {
      "BugsBunny\\Tests\\LooneyTunes\\": "tests"
    }
  },
  "minimum-stability": "beta",
  "prefer-stable": true
}
Settings:
Name: Bugs Bunny
Package: bugs-bunny/looney-tunes
Description: Awesome library
Namespace: BugsBunny\LooneyTunes
Directory: php-looney-tunes

Timeout 10 seconds... Continue setup? y
...
```

#### Running tests script
```bash
$ ./bin/tests --all
```
Example output
```
Tests, coverage, analysis and metrics script
Version: 0.2.12
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
Stopping php-monsters-inc_app_1 ... done
Removing php-monsters-inc_app_1 ... done
Removing network php-monsters-inc_default
Creating network "php-monsters-inc_default" with the default driver
Creating php-monsters-inc_app_1 ... done

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

Time: 73 ms, Memory: 6.00 MB

OK (1 test, 1 assertion)

Generating code coverage report in Clover XML format ... done

Generating code coverage report in HTML format ... done


Code Coverage Report:   
  2019-05-03 12:54:45   
                        
 Summary:               
  Classes: 100.00% (1/1)
  Methods: 100.00% (1/1)
  Lines:   100.00% (1/1)

\MonstersInc::MonstersInc\BasicClass
  Methods: 100.00% ( 1/ 1)   Lines: 100.00% (  1/  1)

PHPStan...
PHPStan - PHP Static Analysis Tool 0.11.5
 1/1 [****************************] 100%

                                                                                                                        
 [OK] No errors                                                                                                         
                                                                                                                        


Psalm config found...

Psalm...
Psalm 3.2.10@b9bece4cbcb3f342c8412618f73ca02db98064e8
Scanning files...
Analyzing files...

------------------------------
No errors found!
------------------------------

Checks took 0.22 seconds and used 27.032MB of memory
Psalm was able to infer types for 100% of the codebase

Generating report file: ./../tests/report.html

PHP Code Sniffer...
PHP_CodeSniffer version 3.4.2 (stable) by Squiz (http://www.squiz.net)

PHP Code Sniffer Beautifier...
PHP_CodeSniffer version 3.4.2 (stable) by Squiz (http://www.squiz.net)

No fixable errors were found

Time: 205ms; Memory: 6MB


Executed in 11s
Bye!
```
