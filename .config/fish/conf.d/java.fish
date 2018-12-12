switch (uname)
	case Linux
		export JAVA_HOME=(readlink -f /usr/bin/javac | sed "s:bin/javac::")
	case Darwin
		export JAVA_HOME=(/usr/libexec/java_home)
	case '*'
		export JAVA_HOME=""
end
