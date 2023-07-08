CC:=nasm
CCFLAGS:=-f elf64 -o
LINKER:=ld
LINKERFLAGS:=-o
TARGET:=hello_world
TARGET_DIR:=target
OBJS := $(TARGET_DIR)/start.o
SRC_DIR:=src
TARGET_FILE:=$(TARGET_DIR)/$(TARGET)
.DEFAULT_GOAL:= build
.PHONY: clean remake rerun
build: $(TARGET_FILE)
$(TARGET_DIR):
	mkdir $@
$(TARGET_FILE): $(OBJS)
	$(LINKER) $(LINKERFLAGS) $@ $^
$(TARGET_DIR)/%.o: $(SRC_DIR)/%asm $(TARGET_DIR)
	$(CC) $(CCFLAGS) $@ $<
run: $(TARGET_FILE)
	./$<
clean:
	@{\
		if [ -d $(TARGET_DIR) ]; then\
		rm -r $(TARGET_DIR);\
		fi;\
	}
remake: clean build
rerun: clean run
