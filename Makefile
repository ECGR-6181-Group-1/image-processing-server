#Tool definitions
CC=gcc
CXX=g++

# paths
SRCDIR = ./src
BUILD = ./build
OUTDIR = ./output


#includes, libs, and flags
INCS = -I/usr/include/opencv4 -I./include

LIBS = -lopencv_core \
       -lopencv_imgproc \
       -lopencv_highgui \
       -lopencv_imgcodecs \

CFLAGS = $(INCS) -DOUTPUT_DIR='"$(OUTDIR)/"'
CXXFLAGS = $(CFLAGS) --std=c++11
LDFLAGS = $(LIBS)

# Source and object files
C_SOURCES = $(shell find $(SRCDIR) -maxdepth 1 -type f -name *.c)
CXX_SOURCES = $(shell find $(SRCDIR) -maxdepth 1 -type f -name *.cpp)
C_OBJS = $(patsubst $(SRCDIR)/%.c,$(BUILD)/%.o,$(C_SOURCES))
CXX_OBJS = $(patsubst $(SRCDIR)/%.cpp,$(BUILD)/%.o,$(CXX_SOURCES))

OBJECTS = $(C_OBJS) $(CXX_OBJS)

# Targets 
TARGET = test

all : $(TARGET)

$(TARGET) : $(OBJECTS)
	$(CXX) -o $@ $^ $(LDFLAGS)

$(BUILD)/%.o: $(SRCDIR)/%.c
	@mkdir -p $(BUILD)
	$(CC) -o $@ -c $< $(CFLAGS)

$(BUILD)/%.o: $(SRCDIR)/%.cpp
	@mkdir -p $(BUILD)
	$(CXX) -o $@ -c $< $(CXXFLAGS)

clean:
	rm -f $(TARGET) 
	rm -rf $(OUTDIR) $(BUILD)

.PHONY : clean all
