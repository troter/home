if [ -z "$JAVA_HOME" ]
  if [ -e "/usr/libexec/java_home" ]
    set -x JAVA_HOME (/usr/libexec/java_home)
  end
  if [ -d "/usr/lib/jvm/java-openjdk" ]
    set -x JAVA_HOME /usr/lib/jvm/java-openjdk
  end
  if [ -d "/usr/lib/jvm/open-jdk" ]
    set -x JAVA_HOME /usr/lib/jvm/open-jdk
  end
end
