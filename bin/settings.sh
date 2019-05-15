#!/usr/bin/env bash
COVERAGE=0
PROPAGATE=0
ANALYZE=0
BEAUTY=0
PHPUNIT=0
METRICS=0
MULTI_TEST=0
EXEC=1
HELP=0
RESTART_CONTAINER=1

#echo "$@" # for debug
for arg
do
    case "$arg" in
        --propagate)
            PROPAGATE=1
            ;;
    esac
done

for arg
do
    case "$arg" in
        --help)
            HELP=1
            if [[ ${PROPAGATE} == 1 ]]
                then
                    params+=("$arg")
            fi
            ;;
        --no-exec)
            EXEC=0
            ;;
        --no-restart)
            RESTART_CONTAINER=0
            ;;
        --unit)
            PHPUNIT=1
            ;;
        --analyze)
            ANALYZE=1
            ;;
        --coverage)
            PHPUNIT=1
            COVERAGE=1
            ;;
        --propagate)
            PROPAGATE=1
            ;;
        --beauty)
            BEAUTY=1
            ;;
        --beautify)
            BEAUTY=1
            ;;
        --all)
            ANALYZE=1
            COVERAGE=1
            PHPUNIT=1
            BEAUTY=1
            ;;
        --metrics)
            METRICS=1
            ;;
        --multi)
            MULTI_TEST=1
            ;;
        *)
            if [[ ${PROPAGATE} == 1 ]]
                then
                    params+=("$arg")
                else
                    echo "settings.sh: Unknown argument/option ${arg}"
                    exit 0
            fi
            ;;
     esac
done
set -- "${params[@]}"  # overwrites the original positional params
#echo "$@" # for debug

SOURCE_DIR="src"

PSALM_CONFIG="./../psalm.xml"
PSALM_LEVEL=3
PHPSTAN_LEVEL=7
PHPSTAN_CONFIG="./../phpstan.neon"
TESTS_DIR="tests"
TMP_DIR_PARTIAL="tmp"
TMP_DIR="${TESTS_DIR}/${TMP_DIR_PARTIAL}"
PHPMETRICS_DIR="phpmetrics"
COVERAGE_DIR="coverage"
PHPMETRICS_OUTPUT_DIR="${TMP_DIR}/${PHPMETRICS_DIR}"
PHPUNIT_COVERAGE_HTML_REPORT="${TMP_DIR}/${COVERAGE_DIR}/html"
PHPUNIT_COVERAGE_CLOVER_REPORT="${TMP_DIR}/${COVERAGE_DIR}/clover.xml"
XDEBUG_FILTER_FILE="${TMP_DIR}/xdebug-filter.php"
TEST_REPORT_INDEX="./../${TESTS_DIR}/report.html"
TERMINAL_TITLE_FILE="TERMINAL_TITLE"
TITLE_FILE="./../${TERMINAL_TITLE_FILE}"
ENV_FILE=".env"
MAIN_ENV_FILE="../${ENV_FILE}"
HEADER="$(basename $(dirname "$(pwd)"))"

PKG_SETTINGS_DIR=".settings";
COMPOSER_JSON_TEMPLATE="template.composer.json"
COMPOSER_JSON_FILE="${PKG_SETTINGS_DIR}/composer.json.result"
CHANGELOG_MD_TEMPLATE="template.CHANGELOG.md"
CHANGELOG_MD_FILE="${PKG_SETTINGS_DIR}/CHANGELOG.md.result"
README_MD_TEMPLATE="template.README.md"
README_MD_FILE="${PKG_SETTINGS_DIR}/README.md.result"

GIT_ATTR_FILE=".gitattributes.dist";
DIST_ENV_FILE=".env.dist";
DIST_DEFAULTS=".defaults.dist";
GLOBAL_DIST_DEFAULTS="${HOME}/.php-package-template.defaults"

if [[ ${COVERAGE} == 1 ]]
then
  DOCKER_COMPOSE_FILE="./../docker-compose-debug.yml"
else
  DOCKER_COMPOSE_FILE="./../docker-compose.yml"
fi

DOCKER_ENV_FILE="./../.env"

