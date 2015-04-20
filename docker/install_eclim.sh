#!/usr/bin/env bash
java -Dvim.files=$HOME/.vim -Declipse.home=/opt/eclipse -jar /opt/eclim/eclim_2.4.1.jar install && rm /opt/eclim/eclim_2.4.1.jar
