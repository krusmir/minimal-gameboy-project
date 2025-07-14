
# Makefile for MinimalGameboyProject using GBDK

# Tools
LCC = lcc

# Files
OUT_GB = MinimalGameboyProject.gb
SRC = main.c
OBJ = main.o
TEMP_FILES = *.asm *.lst *.ihx *.sym *.o

.PHONY: all clean

all: $(OUT_GB)

$(OBJ): $(SRC)
	$(LCC) -c -o $@ $<

$(OUT_GB): $(OBJ)
	$(LCC) -o $@ $^

clean:
	rm -f $(OUT_GB) $(TEMP_FILES)
