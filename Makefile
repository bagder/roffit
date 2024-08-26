##########################################################################
#
# Copyright (C) Daniel Stenberg, <daniel@haxx.se>, et al.
#
# This software is licensed as described in the file LICENSE, which
# you should have received as part of this distribution.
#
# You may opt to use, copy, modify, merge, publish, distribute and/or sell
# copies of the Software, and permit persons to whom the Software is
# furnished to do so, under the terms of the COPYING file.
#
# This software is distributed on an "AS IS" basis, WITHOUT WARRANTY OF ANY
# KIND, either express or implied.
#
# SPDX-License-Identifier: curl
#
##########################################################################
# default installation directory
PREFIX=/usr/local
BINDIR=$(PREFIX)/bin
MANDIR=$(PREFIX)/man

all:

install:
	install -Dm0755 roffit $(DESTDIR)$(BINDIR)/roffit
	install -Dm0644 roffit.1 $(DESTDIR)$(MANDIR)/man1/roffit.1

test:
	@perl roffit --bare < testpage.1 > testpage.dump
	@if cmp testpage.dump testpage.output; then \
	  echo "SUCCESS"; \
	else \
	  echo "FAIL"; \
	  diff -u testpage.output testpage.dump; \
	  exit 1; \
	fi
