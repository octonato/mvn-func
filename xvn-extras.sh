#!/bin/sh

function xvn-ins()
{
    xvn clean install "$@"
}

function xvn-ins-no-tests()
{
    xvn "-Dmaven.test.skip=true" clean install  "$@"
}

function xvn-no-tests()
{
    xvn "-Dmaven.test.skip=true" clean "$@"
}

function xvn-test()
{
    xvn clean test "$@"
}

function xvn-test-single()
{
    xvn test -Dtest=$1
}

