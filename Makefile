CC = gcc
CCWIN = /usr/local/i386-mingw32-4.3.0/bin/i386-mingw32-gcc
CFLAGS_OSX = -lusb -framework CoreFoundation -framework IOKit -lreadline
CFLAGS_LNX = -lusb -lreadline
CFLAGS_WIN = -lusb -lreadline
CFLAGS_MACWIN = -lusb -lreadline -I"/usr/local/lib"

all:
		@echo 'ERROR: no platform defined.'
		@echo 'LINUX USERS: make linux'
		@echo 'MAC OS X USERS: make macosx'
	 	@echo 'WINDOWS USERS: make win'
		@echo 'MAC OS X USERS compiling for windows using mingw: make macwin'
macosx:	
		@echo 'Buildling irecovery (Mac Os X)'			
		@$(CC) irecovery.c -o irecovery $(CFLAGS_OSX)
linux:
		@echo 'Buildling irecovery (Linux)'
		@$(CC) irecovery.c -o irecovery $(CFLAGS_LNX)
win:
		@echo 'Buildling irecovery (Windows)'
		@$(CC) irecovery.c -o irecovery -I "C:\MinGW\include" -L "C:\MinGW\lib" $(CFLAGS_WIN)
macwin:
		@echo 'Building Windows binary on Mac OS X'
		@$(CCWIN) irecovery.c -o irecovery.exe -I "/usr/local/i386-mingw32-4.3.0/include" -L "/usr/local/i386-mingw32-4.3.0/lib" $(CFLAGS_MACWIN)

clean:
		@echo 'Cleaning...'
		@rm -rf *.o *.exe irecovery
		@echo 'Cleaning finished.'
