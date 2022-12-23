#!/bin/sh

start_pp() {
    exec /opt/portfolio/PortfolioPerformance > /config/pp_out.log 2> /config/pp_err.log
}

# start portfolio performance
start_pp