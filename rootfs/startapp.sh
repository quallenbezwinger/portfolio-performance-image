#!/bin/sh

start_pp() {
    #change to workdpace dir, so that file open dialog in pp will show up mounted dir in left menu
    cd /opt/portfolio/workspace
    #start application
    exec /opt/portfolio/PortfolioPerformance > /config/log/pp_out.log 2> /config/log/pp_err.log
}

# start portfolio performance
start_pp