# 🐇 PHP Package template

A template to write a php package, consist mostly of boilerplate code

Includes scripts to automate testing: [alecrabbit/sh-php-dev-helper](https://github.com/alecrabbit/sh-php-dev-helper)

### Usage
 Get you copy of specific version
 ```bash
 $ ppt_version="0.4.1" 
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

If you have `docker-compose` installed on your system 

```bash
$ docker-compose up -d                              # run container
$ docker-compose exec app composer install          # install dependencies    
``` 
and now you can run your tests with `phpunit`
```bash
$ docker-compose exec app ./vendor/bin/phpunit
```
or with `alecrabbit/sh-php-dev-helper`
```bash
$ ./.bin/php-tests --all                            # run tests
```
> Note: if `docker-compose` is not installed on your system `docker-compose*.yml` files and `.bin` dir (containing `alecrabbit/sh-php-dev-helper`) will be deleted during install

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
 File structure:
 ```
 ├── .bin
 │   └── ... <alecrabbit/sh-php-dev-helper>
 ├── CHANGELOG.md
 ├── composer.json
 ├── docker-compose-debug.yml
 ├── docker-compose.yml
 ├── .dockerignore
 ├── .env
 ├── .git
 │   └── ... <reposirory>
 ├── .gitattributes
 ├── .github
 │   └── ISSUE_TEMPLATE.md
 ├── .gitignore
 ├── LICENSE
 ├── phpcs.xml
 ├── phpunit.xml
 ├── psalm.xml
 ├── README.md
 ├── .scrutinizer.yml
 ├── src
 │   └── Looney
 │       └── BasicClass.php
 ├── TERMINAL_TITLE
 ├── tests
 │   ├── bootstrap.php
 │   ├── debug.php
 │   └── Unit
 │       └── BasicTest.php
 ├── TODO.md
 ├── .travis
 │   └── travis-init.sh
 └── .travis.yml
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


### Example Outputs
 
- [Setup script](.docs/setup-script.md)
- [Tests script](.docs/tests-script.md)

