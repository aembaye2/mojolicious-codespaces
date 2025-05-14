#!/bin/bash
curl -L https://cpanmin.us | perl - --local-lib=~/perl5 App::cpanminus
eval $(perl -I ~/perl5/lib/perl5 -Mlocal::lib)
cpanm --installdeps .
