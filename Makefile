TCVER = 8.0.0
OUTDIR = output/release/v$(TCVER)/bin
TARBALL = $(OUTDIR)/apache-tomcat-$(TCVER).tar.gz
DOCTARBALL = $(OUTDIR)/apache-tomcat-$(TCVER)-fulldocs.tar.gz
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
	install -d $(DESTDIR)$(PREFIX)/$(LIBDIR)/jvm $(DESTDIR)$(PREFIX)/share/doc
	tar -C $(DESTDIR)$(PREFIX)/$(LIBDIR)/jvm -xf $(TARBALL)
	tar -C $(DESTDIR)$(PREFIX)/share/doc -xf $(DOCTARBALL)



clean:
	ant clean

distclean: clean
	rm -rf output
