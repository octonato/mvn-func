#!/bin/sh

function mvn-ins()
{
    mvnx clean install "$@"
}

function mvn-ins-no-tests()
{
    mvnx "-Dmaven.test.skip=true" clean install  "$@"
}

function mvn-no-tests()
{
    mvnx "-Dmaven.test.skip=true" clean "$@"
}

function mvn-test()
{
    mvnx clean test "$@"
}

function mvn-test-single()
{
    mvnx test -Dtest=$1
}

