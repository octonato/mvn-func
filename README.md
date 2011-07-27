Some shell scripts for day-to-day work to ease interaction with maven.

Install
-------

Just import functions to your shell environment 

source xvn.sh
# optional
source xvn-extras.sh 

Usage
-----

xvn clean install path/to/projectA path/to/projectB

or if xvn-extras.sh is also loaded in your shell

xvn-ins path/to/projectA path/to/projectB

Execution will stop on first failure.


Known issues
------------

Need improvement on detection of pom files. 
Maven -s for alternative settings files will not work as the settings.xml will be considered a pom file.
