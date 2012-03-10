#!/bin/sh
# -*- mode:sh; coding:utf-8-unix -*-

# python
! [ -d 'cpython'   ] && hg clone http://hg.python.org/cpython
! [ -d 'jython'    ] && hg clone https://bitbucket.org/jython/jython
! [ -d 'pypy'      ] && hg clone https://bitbucket.org/pypy/pypy
! [ -d 'hg-stable' ] && hg clone http://selenic.com/repo/hg-stable
! [ -d 'freehg'    ] && hg clone https://bitbucket.org/danielmartins/freehg
! [ -d 'sqlalchemy' ] && hg clone https://bitbucket.org/zzzeek/sqlalchemy
! [ -d 'requests'   ] && git clone git://github.com/kennethreitz/requests.git
! [ -d 'werkzeug'   ] && git clone git://github.com/mitsuhiko/werkzeug.git
! [ -d 'jinja2'     ] && git clone git://github.com/mitsuhiko/jinja2.git
! [ -d 'tornado'    ] && git clone git://github.com/facebook/tornado.git

# flask
! [ -d 'flask'            ] && git clone git://github.com/mitsuhiko/flask.git
! [ -d 'flask-oauth'      ] && git clone git://github.com/mitsuhiko/flask-oauth.git
! [ -d 'flask-evolution'  ] && git clone git://github.com/adamrt/flask-evolution.git
! [ -d 'flask-sqlalchemy' ] && git clone git://github.com/mitsuhiko/flask-sqlalchemy.git

# django
! [ -d 'django'                ] && hg clone https://bitbucket.org/django/django
! [ -d 'django-piston'         ] && hg clone https://bitbucket.org/jespern/django-piston
! [ -d 'django-registration'   ] && hg clone https://bitbucket.org/ubernostrum/django-registration
! [ -d 'django-admin-tools'    ] && hg clone https://bitbucket.org/izi/django-admin-tools
! [ -d 'django-storages'       ] && hg clone https://bitbucket.org/david/django-storages
! [ -d 'south'                 ] && hg clone https://bitbucket.org/andrewgodwin/south
! [ -d 'django-nonrel'         ] && hg clone https://bitbucket.org/wkornewald/django-nonrel
! [ -d 'django-profiles'       ] && hg clone https://bitbucket.org/ubernostrum/django-profiles
! [ -d 'django-mediagenerator' ] && hg clone https://bitbucket.org/wkornewald/django-mediagenerator
! [ -d 'django-autocomplete'   ] && hg clone https://bitbucket.org/tyrion/django-autocomplete
! [ -d 'django-oauth'          ] && hg clone https://bitbucket.org/david/django-oauth
! [ -d 'django-oauth-plus'     ] && hg clone https://bitbucket.org/david/django-oauth-plus
! [ -d 'django-localeurl'      ] && hg clone https://bitbucket.org/carljm/django-localeurl
! [ -d 'django-model-utils'    ] && hg clone https://bitbucket.org/carljm/django-model-utils
! [ -d 'django-form-utils'     ] && hg clone https://bitbucket.org/carljm/django-form-utils
! [ -d 'django-filetransfers'  ] && hg clone https://bitbucket.org/wkornewald/django-filetransfers
! [ -d 'django-rest-framework' ] && git clone git://github.com/tomchristie/django-rest-framework.git
! [ -d 'django-extensions'     ] && git clone git://github.com/django-extensions/django-extensions.git
! [ -d 'django-notification'   ] && git clone git://github.com/jtauber/django-notification.git
! [ -d 'easy-thumbnails'       ] && git clone git://github.com/SmileyChris/easy-thumbnails.git
! [ -d 'django-nose'           ] && git clone git://github.com/jbalogh/django-nose.git

# ruby
! [ -d 'ruby'            ] && git clone git://github.com/shyouhei/ruby.git
! [ -d 'jruby'           ] && git clone git://github.com/jruby/jruby.git
! [ -d 'rubinius'        ] && git clone git://github.com/rubinius/rubinius.git
! [ -d 'rack'            ] && git clone git://github.com/rack/rack.git
! [ -d 'rack-contrib'    ] && git clone git://github.com/rack/rack-contrib.git
! [ -d 'sinatra'         ] && git clone git://github.com/sinatra/sinatra.git
! [ -d 'sinatra-contrib' ] && git clone git://github.com/sinatra/sinatra-contrib.git
! [ -d 'omniauth'        ] && git clone git://github.com/intridea/omniauth.git
! [ -d 'factory_girl'    ] && git clone git://github.com/thoughtbot/factory_girl.git
! [ -d 'state_machine'   ] && git clone git://github.com/pluginaweek/state_machine.git
! [ -d 'aasm'            ] && git clone git://github.com/rubyist/aasm.gti

# rails
! [ -d 'rails'           ] && git clone git://github.com/rails/rails.git
! [ -d 'arel'            ] && git clone git://github.com/rails/arel.git
# rails data structure
! [ -d 'acts_as_list'    ] && git clone git://github.com/swanandp/acts_as_list.git
! [ -d 'acts_as_tree'    ] && git clone git://github.com/amerine/acts_as_tree.git
! [ -d 'ancestry'        ] && git clone git://github.com/stefankroes/ancestry.git
# rails auth
! [ -d 'clearance'       ] && git clone git://github.com/thoughtbot/clearance.git
! [ -d 'devise'          ] && git clone git://github.com/plataformatec/devise.git
! [ -d 'authlogic'       ] && git clone git://github.com/binarylogic/authlogic.git
! [ -d 'sorcery'         ] && git clone git://github.com/NoamB/sorcery.git
! [ -d 'restful-authentication' ] && git clone git://github.com/technoweenie/restful-authentication.git
# rails file upload
! [ -d 'paperclip'       ] && git clone git://github.com/thoughtbot/paperclip.git
! [ -d 'file-uploader'   ] && git clone git://github.com/valums/file-uploader.git
# rails paginate
! [ -d 'will_paginate'   ] && git clone git://github.com/mislav/will_paginate.git
! [ -d 'kaminari'        ] && git clone git://github.com/amatsuda/kaminari.git
# rails test
! [ -d 'email-spec'      ] && git clone git://github.com/bmabey/email-spec.git
! [ -d 'rspec-rails'     ] && git clone git://github.com/rspec/rspec-rails.git
! [ -d 'factory_girl_rails' ] && git clone git://github.com/thoughtbot/factory_girl_rails.git
# rails etc
! [ -d 'rails3-application-templates' ] && git clone git://github.com/RailsApps/rails3-application-templates.git
! [ -d 'complex-form-examples' ] && git clone git://github.com/ryanb/complex-form-examples.git
! [ -d 'exception_notification' ] && git clone git://github.com/smartinez87/exception_notification.git
! [ -d 'rails_best_practices' ] && git clone git://github.com/railsbp/rails_best_practices.git
! [ -d 'rails-style-guide' ] && git clone git://github.com/bbatsov/rails-style-guide.git
! [ -d 'rails3_acts_as_paranoid' ] && git clone git://github.com/goncalossilva/rails3_acts_as_paranoid.git
! [ -d 'dm-rails'        ] && git clone git://github.com/datamapper/dm-rails.git
! [ -d 'dm-core'         ] && git clone git://github.com/datamapper/dm-core.git
! [ -d 'acts_as_api'     ] && git clone git://github.com/fabrik42/acts_as_api.git
! [ -d 'rails-footnotes' ] && git clone git://github.com/josevalim/rails-footnotes.git
! [ -d 'pjax_rails'      ] && git clone git://github.com/rails/pjax_rails.git
! [ -d 'nested_form'     ] && git clone git://github.com/ryanb/nested_form.git
! [ -d 'simple_form'     ] && git clone git://github.com/plataformatec/simple_form.git
! [ -d 'teambox'         ] && git clone git://github.com/teambox/teambox.git

# java
! [ -d 'seasar2'                 ] && svn co https://www.seasar.org/svn/s2container/trunk/seasar2/
! [ -d 's2-tiger'                ] && svn co https://www.seasar.org/svn/s2container/trunk/s2-tiger/
! [ -d 'cubby-project'           ] && svn co https://www.seasar.org/svn/cubby/trunk/cubby-project/
! [ -d 'doma'                    ] && svn co https://www.seasar.org/svn/doma/trunk/doma/
! [ -d 'slim3-read-only'         ] && svn co http://slim3.googlecode.com/svn/trunk/ slim3-read-only
! [ -d 'google-guice-read-only'  ] && svn co http://google-guice.googlecode.com/svn/trunk/ google-guice-read-only
! [ -d 'primefaces-read-only'    ] && svn co http://primefaces.googlecode.com/svn/primefaces/trunk/ primefaces-read-only
! [ -d 'h2database-read-only'    ] && svn co http://h2database.googlecode.com/svn/trunk/ h2database-read-only
! [ -d 'jersey-1.9.1'            ] && svn co https://svn.java.net/svn/jersey~svn/tags/jersey-1.9.1
! [ -d 'jersey-trunk'            ] && svn co https://svn.java.net/svn/jersey~svn/trunk/jersey jersey-trunk
! [ -d 'resteasy-trunk'          ] && svn co https://resteasy.svn.sourceforge.net/svnroot/resteasy/trunk resteasy-trunk
! [ -d 'resteasy-jaxrs-2.1.0-ga' ] && svn co https://resteasy.svn.sourceforge.net/svnroot/resteasy/tags/RESTEASY_JAXRS_2_1_0_GA/ resteasy-jaxrs-2.1.0-ga
! [ -d 'geronimo-specs-trunk'    ] && svn co http://svn.apache.org/repos/asf/geronimo/specs/trunk/ geronimo-specs-trunk
! [ -d 'tomcat-trunk'            ] && svn co http://svn.apache.org/repos/asf/tomcat/trunk/ tomcat-trunk
! [ -d 'wicket-trunk'            ] && svn co http://svn.apache.org/repos/asf/wicket/trunk/ wicket-trunk
! [ -d 'maven-3'                 ] && svn co http://svn.apache.org/repos/asf/maven/maven-3/trunk maven-3
! [ -d 'org.eclipse.jetty.project' ] && git clone http://git.eclipse.org/c/jetty/org.eclipse.jetty.project.git
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
! [ -d 'groovy'      ] && git://github.com/russel/groovy.git
! [ -d 'grails-core' ] && git clone git://github.com/grails/grails-core.git

# erlang
! [ -d 'rabbitmq-codegen' ] && hg clone http://hg.rabbitmq.com/rabbitmq-codegen
! [ -d 'rabbitmq-server'  ] && hg clone http://hg.rabbitmq.com/rabbitmq-server

# scheme
! [ -d 'Gauche'       ] && git clone git://gauche.git.sourceforge.net/gitroot/gauche/Gauche
! [ -d 'nendo'        ] && git clone git://github.com/kiyoka/nendo.git
! [ -d 'stklos'       ] && hg clone http://www.stklos.net/hg/hgweb.cgi stklos
! [ -d 'chicken-core' ] && git clone git://code.call-cc.org/chicken-core
