TARGET = test

all:$(TARGET)

CC = gcc
CXX = g++-4.8
STRIP = strip
ARMCC = arm-linux-gcc
ARMSTRIP = arm-linux-strip

#where to install
INSTDIR = bin

#where are include files kept
INCLUDE = -I./
INCLUDE += -I./runoob_lib

#CFLAGS  = -g -Wall –lstdc++
CFLAGS = -g -Wall
CXXFLAGS = -g -Wall -std=c++11

LDFLAGS = -L./runoob_lib
LDFLAGS += -lrunoob

RANLIB = ranlib

SOURCES = test.c

C_SRCS = $(filter %.c, $(SOURCES))
CPP_SRCS = $(filter %.cpp, $(SOURCES))

C_OBJS = $(C_SRCS:%.c=%.o)
CPP_OBJS = $(CPP_SRCS:%.cpp=%.o)

$(C_OBJS):%.o:%.c
	#@mkdir -p release
	#@mkdir -p $(dir $@)
	$(CXX) $(CXXFLAGS) $(INCLUDE) -c $^ -o $@
	
$(CPP_OBJS):%.o:%.cpp
	#@mkdir -p release
	#@mkdir -p $(dir $@)
	$(CXX) $(CXXFLAGS) $(INCLUDE) -c $^ -o $@
	
$(TARGET):$(C_OBJS) $(CPP_OBJS)
	$(MAKE) -C ./runoob_lib/
	$(CXX) $(CXXFLAGS) $^ $(LDFLAGS) -o $@
	mkdir -p $(INSTDIR)/debug
	cp $@ $(INSTDIR)/debug
	mkdir -p $(INSTDIR)/release
	$(STRIP) $@
	cp $@ $(INSTDIR)/release
	
clean:
	@echo "cleanning project.."
	make -C ./runoob_lib/ clean
	-rm -rf release
	-rm -rf $(INSTDIR)
	-rm -rf $(TARGET)
	-rm -rf *.o
	@echo "clean completed"
	