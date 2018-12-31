```bash
docker-compose -f docker-compose-debug.yml up -d
```

```bash
docker-compose exec app phpunit --coverage-html tests/tmp/coverage/html
```

```bash
docker-compose exec app phpunit --coverage-clover tests/tmp/coverage/clover.xml
```
### phpcs
```bash
docker run -it --rm -v $PWD:/app dralec/php-code-sniffer app/src
```
