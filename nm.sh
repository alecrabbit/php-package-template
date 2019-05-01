#!/usr/bin/env bash
name="Alec Rabbit"
package="php-counters"
prefix='php-'
if [[ $package == *"${prefix}"* ]]
then
  package=${package#"$prefix"}
fi
echo "${name}"
echo "${package}"
name=${name,,}
echo ${name// /}
