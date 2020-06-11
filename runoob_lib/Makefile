TARGET = librunoob.so

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

#CFLAGS  = -g -Wall –lstdc++
CFLAGS = -g -Wall
CXXFLAGS = -g -Wall -std=c++11

LDFLAGS = -L./

RANLIB = ranlib

SOURCES = runoob_main.cpp runoob_base_func.cpp

C_SRCS = $(filter %.c, $(SOURCES))
CPP_SRCS = $(filter %.cpp, $(SOURCES))

C_OBJS = $(C_SRCS:%.c=release/%.o)
CPP_OBJS = $(CPP_SRCS:%.cpp=release/%.o)

$(C_OBJS):release/%.o:%.c
	@mkdir -p release
	@mkdir -p $(dir $@)
	$(CXX) $(CXXFLAGS) -shared -fPIC -c $^ -o $@
	
$(CPP_OBJS):release/%.o:%.cpp
	@mkdir -p release
	@mkdir -p $(dir $@)
	$(CXX) $(CXXFLAGS) -shared -fPIC -c $^ -o $@
	
$(TARGET):$(C_OBJS) $(CPP_OBJS)
	$(CXX) -shared -fPIC -o $@ $^
	#$(RANLIB) $@
	mkdir -p $(INSTDIR)/debug
	cp $@ $(INSTDIR)/debug
	mkdir -p $(INSTDIR)/release
	#$(STRIP) $@
	cp $@ $(INSTDIR)/release
	
clean:
	@echo "cleanning project.."
	-rm -rf release
	-rm -rf $(INSTDIR)
	-rm -rf $(TARGET)
	@echo "clean completed"
	