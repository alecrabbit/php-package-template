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

```


After setup you can edit `.env` file if necessary
```
USER_ID=1000
GROUP_ID=1000
```
> Note: to get your `USER_ID` and `GROUP_ID`
> ```
> $ id username
> ```
Running tests script
> Note: output from older version of container
```
$ ./bin/tests --all
Tests and coverage script
Analysis enabled.
PHPMetrics disabled.
PHPUnit enabled.
Coverage enabled.
Beautifier enabled.
Container restart enabled.

Processing...

PhpUnit...

Found XDEBUG Filter file...

Running tests with coverage...

PHPUnit 7.5.5 by Sebastian Bergmann and contributors.

...

PHPStan...

PHPStan - PHP Static Analysis Tool 0.11.2

...

Psalm config found...

Psalm...

Psalm 3.0.15@c310a2dd86660944b3f15fb8486ab73d45066618

...

PHP Code Sniffer...

PHP_CodeSniffer version 3.4.0 (stable) by Squiz (http://www.squiz.net)

...

PHP Code Sniffer Beautifier...

PHP_CodeSniffer version 3.4.0 (stable) by Squiz (http://www.squiz.net)

...

Executed in 10s
Bye!

```
