CC=nasm
CCFLAGS=-f elf64 -o
LINKER=ld
LINKERFLAGS=-o
TARGET=asm_movements
TARGET_DIR=target
TARGET_FILE=$(TARGET_DIR)/$(TARGET)
SRC_DIR=src
SRC_FILE=$(SRC_DIR)/start.asm
OBJ_DIR=$(TARGET_DIR)/obj
OBJ_FILE=$(OBJ_DIR)/start.o
DEFAULT_GOAL:=build
.PHONY: clean remake
build: $(TARGET_FILE)
$(OBJ_FILE): $(SRC_FILE) $(OBJ_DIR)
	$(CC) $(CCFLAGS) $@ $<
$(OBJ_DIR):
	mkdir -p $@
$(TARGET_FILE): $(OBJ_FILE)
	$(LINKER) $(LINKERFLAGS) $@ $<
clean:
	@{\
		if [ -d $(TARGET_DIR) ]; then\
		rm -r $(TARGET_DIR);\
		fi;\
	}
remake: clean build
run: $(TARGET_FILE)
	./$<
