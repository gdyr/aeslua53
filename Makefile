DIST=aeslua53-0.0.1
LIBDIR=/usr/local/lib/lua/5.3

SUBMODULES=aes buffer ciphermode gf util

FILES= Copyright.txt \
	   Changelog \
	   License.txt \
	   Makefile \
	   README \
	   README.html

.PHONY: dist install uninstall test speed
   
dist:
	mkdir -p $(DIST)
	cp -rf src $(DIST)
	cp -rf lib $(DIST)
	cp -f $(FILES) $(DIST)
	find . -name .svn -print0 | xargs -0 rm -rf
	tar cvzf $(DIST).tar.gz $(DIST)
	zip -9 -r $(DIST).zip $(DIST)
	
uninstall:
	rm -rf $(LIBDIR)/aeslua $(LIBDIR)/aeslua.lua

test:
	echo "require('aeslua'); print(aeslua.decrypt('key', aeslua.encrypt('key', 'hello world')))" | LUA_PATH="src/?.lua" lua
	LUA_PATH="src/?.lua" lua src/test/testaes.lua

speed:
	LUA_PATH="src/?.lua" lua src/test/aesspeed.lua
