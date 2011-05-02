# default installation directory
INSTALLDIR=/usr/local/bin

all:

install:
	cp roffit $(DESTDIR)$(INSTALLDIR)

test:
	@perl roffit --bare < testpage.1 > testpage.dump
	@if cmp testpage.dump testpage.output; then \
	  echo "SUCCESS"; \
	else \
	  echo "FAIL"; \
	fi
