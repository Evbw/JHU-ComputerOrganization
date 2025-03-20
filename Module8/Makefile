ALL: converter
LIB=libConversions.o
CC=gcc

converter: converter.o $(LIB)
	$(CC) $@.o $(LIB) -g -o $@
.s.o:
	$(CC) $(@:.o=.s) -g -c -o $@
