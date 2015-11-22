CFLAGS := -Wall -march=native -Wno-incompatible-pointer-types -Wno-unused-function
LDFLAGS := -lm
LIB := liblstm.so
RM := rm -f
CC := gcc

.PHONY: debug release clean

debug: CFLAGS += -g3
debug: $(LIB)

release: CFLAGS += -O2
release: $(LIB)

install: $(LIB)
	install liblstm.so /usr/local/lib/liblstm.so
	install lstm.h /usr/local/include/lstm.h

$(LIB): lstm.c lstm.h
	$(CC) $(LDFLAGS) $(CFLAGS) -fPIC -shared lstm.c -o $(LIB)

clean:
	$(RM) $(LIB)

