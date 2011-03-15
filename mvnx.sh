#!/bin/sh

function mvnx()
{
    ARGS=""
    ARGS_LABEL=""
    POMS=""
    SEP="------------------------------------------------------------------------"
    
    if [ $# -gt 0 ] ; then
        for i in $@
        do
            if [ -d "$i" ] ; then
                POMS="$POMS ${i%%/}/pom.xml"
            elif [ -f "$i" ]; then
                POMS="$POMS $i"
            else
                ARGS="$ARGS $i" 
            fi
        
        done
    fi
    
    if [ -z "$POMS" ] ; then
        POMS="pom.xml"
    fi

    # print out all requests
    echo $SEP
    for POM in $POMS
    do    
        print-cmd $POM "$ARGS"
    done
    
    echo $SEP
    echo
    
    
    for POM in $POMS
    do
        if [ ! -f $POM ] ; then
            echo "$POM - pom file not found"
        else 
            
            if (mvn $ARGS -f $POM) ; then
                echo $SEP
                echo "Done"     
                print-cmd $POM "$ARGS"
            else

                echo $SEP    
                echo "Failed build"
                print-cmd $POM "$ARGS"

                break
            fi
                        
            echo $SEP
            echo

        fi
    done    

}

function print-cmd()
{
    if [ ! -z "$2" ] ; then
        ARGS_LABEL="[extra args:$2]"
    fi
    echo "[pom:$1] $ARGS_LABEL"
}