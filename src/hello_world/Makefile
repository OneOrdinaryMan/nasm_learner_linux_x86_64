CC=nasm
CCFLAGS=-f elf64 -o
LINKER=ld
LINKERFLAGS=-o
TARGET=hello_world
TARGET_DIR=target
SRC_DIR=src
START_FILE=$(SRC_DIR)/start.asm
TARGET_FILE=$(TARGET_DIR)/$(TARGET)
.DEFAULT_GOAL:=build
.PHONY: clean remake
build: $(TARGET_FILE)
$(TARGET_DIR):
	mkdir $@
$(TARGET_DIR)/temp.o: $(START_FILE) $(TARGET_DIR)
	$(CC) $(CCFLAGS) $@ $<
$(TARGET_FILE): $(TARGET_DIR)/temp.o
	$(LINKER) $(LINKERFLAGS) $@ $<
clean:
	@{\
		if [ -d $(TARGET_DIR) ];then\
		rm -rf $(TARGET_DIR);\
		fi;\
	}
remake: clean build
run: $(TARGET_FILE)
	./$<
