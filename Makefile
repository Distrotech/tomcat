TARBALL = output/release/v8.0.0/bin/apache-tomcat-8.0.0.tar.gz
PREFIX = /usr
LIBDIR = lib

all:	$(TARBALL) \
	output/build/bin/tool-wrapper.sh output/dist/webapps/docs/api/index-all.html \
	output/extras/catalina-ws.jar output/embed/ecj-4.3.1.jar

$(TARBALL):
	ant release

output/build/bin/tool-wrapper.sh:
	ant

output/dist/webapps/docs/api/index-all.html:
	ant javadoc

output/extras/catalina-ws.jar:
	ant extras

output/embed/ecj-4.3.1.jar:
	ant embed

test:	all
	ant test

install: all
	tar -C $(DESTDIR)$(PREFIX)/$(LIBDIR)/jvm -xf $(TARBALL)

clean:
	ant clean

distclean: clean
	rm -rf output
