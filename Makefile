CMAKE ?= cmake
CXX ?= g++

ROOTDIR := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
SRCDIR := $(ROOTDIR)/src
OUTDIR := $(ROOTDIR)/out

SRC := $(SRCDIR)/main.cpp

CXXFLAGS_ASM := -Wall -fno-exceptions -fno-asynchronous-unwind-tables \
	-masm=intel -S -fverbose-asm

.PHONY = build

build:
	$(CXX) -O3 -Wall -o $(OUTDIR)/main $(SRC)

verbose-asm:
	$(CXX) $(CXXFLAGS_ASM) -O0 -o $(OUTDIR)/main.O0.s $(SRC)
	$(CXX) $(CXXFLAGS_ASM) -O1 -o $(OUTDIR)/main.O1.s $(SRC)
	$(CXX) $(CXXFLAGS_ASM) -O2 -o $(OUTDIR)/main.O2.s $(SRC)
	$(CXX) $(CXXFLAGS_ASM) -O3 -o $(OUTDIR)/main.O3.s $(SRC)
	$(CXX) $(CXXFLAGS_ASM) -Os -o $(OUTDIR)/main.Os.s $(SRC)
