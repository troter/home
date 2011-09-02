#!/bin/sh
# -*- mode:sh; coding:utf-8-unix -*-

# python
! [ -d 'hg-stable' ] && hg clone http://selenic.com/repo/hg-stable

# ruby
! [ -d 'rack'            ] && git clone git://github.com/rack/rack.git
! [ -d 'rack-contrib'    ] && git clone git://github.com/rack/rack-contrib.git
! [ -d 'sinatra'         ] && git clone git://github.com/sinatra/sinatra.git
! [ -d 'sinatra-contrib' ] && git clone git://github.com/sinatra/sinatra-contrib.git
! [ -d 'teambox'         ] && git clone git://github.com/teambox/teambox.git

# java
! [ -d 'seasar2'                 ] && svn co https://www.seasar.org/svn/s2container/trunk/seasar2/
! [ -d 's2-tiger'                ] && svn co https://www.seasar.org/svn/s2container/trunk/s2-tiger/
! [ -d 'cubby-project'           ] && svn co https://www.seasar.org/svn/cubby/trunk/cubby-project/
! [ -d 'doma'                    ] && svn co https://www.seasar.org/svn/doma/trunk/doma/
! [ -d 'slim3-read-only'         ] && svn co http://slim3.googlecode.com/svn/trunk/ slim3-read-only
! [ -d 'google-guice-read-only'  ] && svn co http://google-guice.googlecode.com/svn/trunk/ google-guice-read-only
! [ -d 'primefaces-read-only'    ] && svn co http://primefaces.googlecode.com/svn/primefaces/trunk/ primefaces-read-only
! [ -d 'jersey-1.6'              ] && svn co https://svn.java.net/svn/jersey~svn/tags/jersey-1.6
! [ -d 'resteasy-trunk'          ] && svn co https://resteasy.svn.sourceforge.net/svnroot/resteasy/trunk resteasy-trunk
! [ -d 'resteasy-jaxrs-2.1.0-ga' ] && svn co https://resteasy.svn.sourceforge.net/svnroot/resteasy/tags/RESTEASY_JAXRS_2_1_0_GA/ resteasy-jaxrs-2.1.0-ga
! [ -d 'geronimo-specs-trunk'    ] && svn co http://svn.apache.org/repos/asf/geronimo/specs/trunk/ geronimo-specs-trunk
! [ -d 'tomcat-trunk'            ] && svn co http://svn.apache.org/repos/asf/tomcat/trunk/ tomcat-trunk
! [ -d 'wicket-trunk'            ] && svn co http://svn.apache.org/repos/asf/wicket/trunk/ wicket-trunk
! [ -d 'junit'                   ] && git clone git://github.com/KentBeck/junit
! [ -d 'jenkins'                 ] && git clone git://github.com/jenkinsci/jenkins.git
! [ -d 'twitter4j'               ] && git clone git://github.com/yusuke/twitter4j.git
! [ -d 'malabar-mode'            ] && git clone git://github.com/espenhw/malabar-mode.git

# clojure
! [ -d 'clojure'         ] && git clone git://github.com/clojure/clojure.git
! [ -d 'clojure-contrib' ] && git clone git://github.com/clojure/clojure-contrib.git
! [ -d 'java.jdbc'       ] && git clone git://github.com/clojure/java.jdbc.git
! [ -d 'tools.macro'     ] && git clone git://github.com/clojure/tools.macro.git
! [ -d 'data.json'       ] && git clone git://github.com/clojure/data.json.git
! [ -d 'ring'            ] && git clone git://github.com/mmcgrana/ring.git
! [ -d 'clj-html'        ] && git clone git://github.com/mmcgrana/clj-html.git
! [ -d 'clj-record'      ] && git clone git://github.com/duelinmarkers/clj-record.git
! [ -d 'clj-http'        ] && git clone git://github.com/medSage/clj-http.git

# groovy
! [ -d 'grails-core' ] && git clone git://github.com/grails/grails-core.git