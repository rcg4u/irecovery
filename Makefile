CC = gcc
CCWIN = /usr/local/i386-mingw32-4.3.0/bin/i386-mingw32-gcc
CFLAGS_OSX = -lusb -framework CoreFoundation -framework IOKit -lreadline
CFLAGS_OSXLIB1 = -lusb-1.0 -framework CoreFoundation -framework IOKit -lreadline
CFLAGS_LNX = -lusb -lreadline
CFLAGS_WIN = -lusb -lreadline
CFLAGS_MACWIN = -lusb -lreadline -I"/usr/local/include"
SNOWFILE="irecovery-ih8sn0w"
GREYFILE="irecoverygreysyntax"
MYFILE="irecovery"

all:
		@echo 'ERROR: no platform defined.'
		@echo 'LINUX USERS: make linux'
		@echo 'MAC OS X USERS: make macosx'
	 	@echo 'WINDOWS USERS: make win'
		@echo 'MAC OS X USERS compiling for windows using mingw: make macwin'
macosx:	
		@echo 'Building irecovery (Mac OS X) Greyfile or IH8sn0w file is to be used with libusb 1.0 if it errors out dont cry just use the default one irecovery its built with earlier USB lib'			
		@$(CC) $(MYFILE).c -o irecovery $(CFLAGS_OSX)
		@$(CC) $(GREYFILE).c -o $(GREYFILE) $(CFLAGS_OSXLIB1)
		@$(CC) $(SNOWFILE).c -o $(SNOWFILE) $(CFLAGS_OSXLIB1)

linux:
		@echo 'Building irecovery (Linux)'
		@$(CC) irecovery.c -o irecovery $(CFLAGS_LNX)
		@$(CC) irecoverygreysyntax.c -o irecoverygs. $(CFLAGS_LNX)
win:
		@echo 'Building irecovery (Windows)'
		@$(CC) irecovery.c -o irecovery -I "C:\MinGW\include" -L "C:\MinGW\lib" $(CFLAGS_WIN)
		@$(CC) irecoverygreysyntax.c -o irecoverygs. $(CFLAGS_WIN)
macwin:
		@echo 'Building Windows binary on Mac OS X'
		@$(CCWIN) irecovery.c -o irecovery.exe -I "/usr/local/i386-mingw32-4.3.0/include" -L "/usr/local/i386-mingw32-4.3.0/lib" $(CFLAGS_MACWIN)
		@$(CCWIN) irecoverygreysyntax.c -o irecoverygs. $(CFLAGS_MACWIN)

clean:
		@echo 'Cleaning...'
		@rm -rf *.o *.exe
		@rm -v $(GREYFILE) $(SNOWFILE) $(MYFILE)
		@echo 'Cleaning finished.'
