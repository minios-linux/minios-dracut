# Makefile for minios-dracut

PREFIX ?= /usr
BINDIR = $(PREFIX)/bin
DRACUTDIR = $(PREFIX)/lib/dracut
MODULESDIR = $(DRACUTDIR)/modules.d
CONFDIR = /etc/dracut.conf.d
DATADIR = $(PREFIX)/share/minios-dracut
MANDIR = $(PREFIX)/share/man

.PHONY: all install clean

all:
	@echo "Nothing to build. Run 'make install' to install."

install:
	# Install mkdracut script
	install -D -m 0755 mkdracut $(DESTDIR)$(BINDIR)/mkdracut
	
	# Install man page
	install -D -m 0644 mkdracut.1 $(DESTDIR)$(MANDIR)/man1/mkdracut.1
	
	# Install 90minios module
	install -d $(DESTDIR)$(MODULESDIR)/90minios
	install -m 0755 90minios/module-setup.sh $(DESTDIR)$(MODULESDIR)/90minios/
	install -m 0755 90minios/parse-minios.sh $(DESTDIR)$(MODULESDIR)/90minios/
	install -m 0755 90minios/minios-mount-root.sh $(DESTDIR)$(MODULESDIR)/90minios/
	install -m 0755 90minios/minios-init $(DESTDIR)$(MODULESDIR)/90minios/
	
	# Install 99minios-cleanup module
	install -d $(DESTDIR)$(MODULESDIR)/99minios-cleanup
	install -m 0755 99minios-cleanup/module-setup.sh $(DESTDIR)$(MODULESDIR)/99minios-cleanup/
	
	# Install configuration files
	install -D -m 0644 90-minios.conf $(DESTDIR)$(CONFDIR)/90-minios.conf
	
	# Install livekit binaries and libraries
	install -d $(DESTDIR)$(DATADIR)/bin
	install -m 0755 bin/* $(DESTDIR)$(DATADIR)/bin/
	install -D -m 0644 lib/livekitlib $(DESTDIR)$(DATADIR)/lib/livekitlib
	install -D -m 0644 usr/share/terminfo/l/linux $(DESTDIR)$(DATADIR)/usr/share/terminfo/l/linux

clean:
	@echo "Nothing to clean."

uninstall:
	rm -f $(DESTDIR)$(BINDIR)/mkdracut
	rm -f $(DESTDIR)$(MANDIR)/man1/mkdracut.1
	rm -rf $(DESTDIR)$(MODULESDIR)/90minios
	rm -rf $(DESTDIR)$(MODULESDIR)/99minios-cleanup
	rm -f $(DESTDIR)$(CONFDIR)/90-minios.conf
	rm -rf $(DESTDIR)$(DATADIR)
