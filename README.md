# 🐇 PHP Package template

A template to write a php package, consist mostly of boilerplate code

Includes bash scripts to automate testing

### Usage
 Get you copy of specific version
 ```bash
 $ ppt_version="0.3.0" 
 $ wget -qO- "https://github.com/alecrabbit/php-package-template/archive/${ppt_version}.tar.gz" \
 | tar -xzv && cd php-package-template-${ppt_version}
 ...
 ```
or latest commit from master branch
```bash
$ git clone https://github.com/alecrabbit/php-package-template.git
...
$ cd php-package-template
```
Run setup script and follow the instructions
```
$ ./install
...                  # follow the instructions
$ cd ..              # 'php-package-template(-<version>)' dir was renamed so don't forget to cd 
$ cd <your-new-package-dir>              
```
##### Bundled `docker-compose*.yml` files
```bash
$ docker-compose up -d
$ docker-compose exec app composer install
``` 
and now you can run your tests
```bash
$ docker-compose exec app ./vendor/bin/phpunit
```
or
```bash
$ ./bin/tests --all
```
> Note: if `docker-compose` is not installed on your system `docker-compose*.yml` files and `bin` dir will be deleted during install

### Settings
#### Using script arguments
 You can pass parameters to setup script
 ```
$ ./install -h
Usage:
./install [options]

Options:
    -h                 - show this help message and exit
    -y                 - do not ask questions
    -p name            - package name
    -o owner           - package owner
    -n name            - package owner name
    -s namespace       - package owner namespace
    -x                 - do not use package owner namespace, overrides '-s' option
```
For example
 ```bash
 $ ./install -p looney -o bunny -n "Bugs Bunny"
 ``` 
will create `bunny/looney` package in `php-looney` dir

`LICENSE` file:
 ```
  Copyright (c) 2019 Bugs Bunny
 ```
 `src\BasicClass.php` file:
 ```php
<?php declare(strict_types=1);
 
 namespace BugsBunny\Looney;
 
 class BasicClass
 {
     public static function get(): bool
     {
         return true;
     }
 }
 ```
#### Using defaults file
Create a file `.ppt_settings.defaults` in your home directory. This file will save you some time if you create a lot of packages.
```bash
$ touch ~/.ppt_settings.defaults
```
Contents:
```
PPT_COLOR="auto"                                        # color setting for install script
PPT_PACKAGE_DIR_PREFIX="php-"                           # package dir name prefix
PPT_PACKAGE_DIR_SUFFIX=""                               # package dir name suffix

PPT_PACKAGE_OWNER="bugs-bunny"                          # your nickname on packagist
PPT_PACKAGE_OWNER_NAME="Bugs Bunny"                     # your name and lastname
PPT_PACKAGE_NAME="looney-package"                       # default package name
PPT_PACKAGE_DESCRIPTION="Awesome package description"   # decsription
PPT_PACKAGE_NAMESPACE="LooneyTunes"                     # package namespace
PPT_PACKAGE_OWNER_NAMESPACE=""                          # package owner namespace
PPT_PACKAGE_DIR="php-looney-package"                    # default package dir name
```

### Tested Operating Systems

OS                                  | 
----------------------------------- | 
Ubuntu Linux (18.04 LTS)            | 

#### Setup script example output
```bash
$ ./install
```
```
🔧 Package template setup...
Version 0.3.0
It should be unique among your packages!
 Enter package name:
 [looney-package] 
 Accepted value: 'looney-package'

 Enter package owner:
 (Used in composer.json line: "name": "owner/name"))
 [bugs-bunny] 
 Accepted value: 'bugs-bunny'

 Enter package owner name:
 (Used in LICENSE file)
 [Bugs Bunny] 
 Accepted value: 'Bugs Bunny'

 Enter package description:
 (Used in composer.json line: "description": "Your awesome description")
 [Awesome package description] 
 Accepted value: 'Awesome package description'

 Enter package namespace:
 [LooneyPackage] 
 Accepted value: 'LooneyPackage'

 Enter package owner namespace:
 [] 
 Accepted value: ''

It should be new non-existent yet dir name!
 Enter package dir:
 [php-looney-package] 
 Accepted value: 'php-looney-package'

Creating directory '.settings'
Preparing setup
Using values:
Name: Bugs Bunny
Package: bugs-bunny/looney-package
Description: Awesome package description
Namespace: LooneyPackage
Directory: php-looney-package

Saved '.results/.env'
Saved '.results/composer.json'
Saved '.results/CHANGELOG.md'
Saved '.results/README.md'
Saved '.results/.github/ISSUE_TEMPLATE.md'
Saved '.results/LICENSE'
Saved '.results/TERMINAL_TITLE'
Saved '.results/TODO.md'
Saved '.results/src/LooneyPackage/BasicClass.php'
Saved '.results/tests/Unit/BasicTest.php'
Saved '.results/.gitattributes'
Saved '.results/.gitignore'
Files prepared
Continue setup? [y/n] y
Installing
Copying files...
🛑 docker-compose is not installed
Renaming package dir
Cleaning up...
Removing files...
Repository
Initializing new git repository
Adding files

🛑 ppt:ERROR Can't commit: git user credentials not configured

Successfully installed new package in '/tmp/php-looney-package'
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
