-include vars.mak

SOURCES = echoserver.c          
OBJECTS = echoserver.o 
          
TARGET = ../echoserver

#$(TARGET): $(OBJECTS) \
# 	   @$(CHK_DIR_EXISTS) ../bin/ || $(MKDIR) ../bin/ \
#	   $(CC) $(CFLAGS) $(TARGET) $(OBJECTS)

echoserver: $(OBJECTS)
	    $(CC) $(CFLAGS) echoserver $(OBJECTS) #$(LIBS)
$(OBJECTS) :    $(SOURCES)
		$(CC) -c $(SOURCES)

libtranlayer.a:    tranlayer.o
		$(AR) libtranlayer.a tranlayer.o

liberrhand.a:      errhand.o
		$(AR) liberrhand.a errhand.o

echo.o: echo.c
	$(CC) $(CFLAGS) -c echo.c

tranlayer.o:    tranlayer.o
		$(CC) -c tranlayer.c
errhand.o:      errhand.o
		$(CC) -c errhand.c

clean:  
	-$(DEL_FILE) $(OBJECTS)
	-$(DEL_FILE) $(OBJECTS2)

install: 	echoserver
		@$(CHK_DIR_EXISTS) $(INSTDIR) || $(MKDIR) $(INSTDIR)
		$(COPY) echoserver $(INSTDIR)
