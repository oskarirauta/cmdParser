all: world
CXX?=g++
CXXFLAGS?=--std=c++17 -Wall
INCLUDES:=-I./include -I./examples/include -I.

OBJS:= \
	objs/main.o

CMDPARSER_DIR:=.
include Makefile.inc

world: parser

objs/main.o: examples/main.cpp
	$(CXX) $(CXXFLAGS) $(INCLUDES) -c -o $@ $<;

parser: $(CMDPARSER_OBJS) $(OBJS)
	$(CXX) $(CXXFLAGS) $(LDFLAGS) $^ -o $@;

clean:
	rm -f objs/*.o parser
