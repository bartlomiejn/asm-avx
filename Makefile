CMAKE ?= cmake
CXX ?= g++

ROOTDIR := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
SRCDIR := $(ROOTDIR)/src
OUTDIR := $(ROOTDIR)/out

DEFAULT_NAME := default
DEFAULT_SRC := $(SRCDIR)/$(DEFAULT_NAME).cpp
NOAVX_NAME := no-avx
NOAVX_SRC := $(SRCDIR)/$(DEFAULT_NAME).cpp

CXXFLAGS_VERBOSE_ASM := -Wall -Wa,-adhln -fno-exceptions \
	-fno-asynchronous-unwind-tables -masm=intel -S -fverbose-asm
CXXFLAGS_ASM := -Wall -fno-exceptions -fno-asynchronous-unwind-tables

.PHONY = build

build:
	$(CXX) -O3 -Wall -o $(OUTDIR)/$(DEFAULT_NAME) $(DEFAULT_SRC)

verbose-asm:
	$(CXX) $(CXXFLAGS_VERBOSE_ASM) -O0 -o $(OUTDIR)/$(DEFAULT_NAME).O0.readable.s $(DEFAULT_SRC)
	$(CXX) $(CXXFLAGS_VERBOSE_ASM) -O1 -o $(OUTDIR)/$(DEFAULT_NAME).O1.readable.s $(DEFAULT_SRC)
	$(CXX) $(CXXFLAGS_VERBOSE_ASM) -O2 -o $(OUTDIR)/$(DEFAULT_NAME).O2.readable.s $(DEFAULT_SRC)
	$(CXX) $(CXXFLAGS_VERBOSE_ASM) -O3 -o $(OUTDIR)/$(DEFAULT_NAME).O3.readable.s $(DEFAULT_SRC)
	$(CXX) $(CXXFLAGS_VERBOSE_ASM) -Os -o $(OUTDIR)/$(DEFAULT_NAME).Os.readable.s $(DEFAULT_SRC)
	$(CXX) $(CXXFLAGS_ASM) -O0 -c -o $(OUTDIR)/$(DEFAULT_NAME).O0.s $(DEFAULT_SRC)
	$(CXX) $(CXXFLAGS_ASM) -O1 -c -o $(OUTDIR)/$(DEFAULT_NAME).O1.s $(DEFAULT_SRC)
	$(CXX) $(CXXFLAGS_ASM) -O2 -c -o $(OUTDIR)/$(DEFAULT_NAME).O2.s $(DEFAULT_SRC)
	$(CXX) $(CXXFLAGS_ASM) -O3 -c -o $(OUTDIR)/$(DEFAULT_NAME).O3.s $(DEFAULT_SRC)
	$(CXX) $(CXXFLAGS_ASM) -Os -c -o $(OUTDIR)/$(DEFAULT_NAME).Os.s $(DEFAULT_SRC)

	$(CXX) $(CXXFLAGS_VERBOSE_ASM) -mno-avx -mno-avx2 -O0 -o $(OUTDIR)/$(NOAVX_NAME).O0.readable.s $(NOAVX_SRC)
	$(CXX) $(CXXFLAGS_VERBOSE_ASM) -mno-avx -mno-avx2 -O1 -o $(OUTDIR)/$(NOAVX_NAME).O1.readable.s $(NOAVX_SRC)
	$(CXX) $(CXXFLAGS_VERBOSE_ASM) -mno-avx -mno-avx2 -O2 -o $(OUTDIR)/$(NOAVX_NAME).O2.readable.s $(NOAVX_SRC)
	$(CXX) $(CXXFLAGS_VERBOSE_ASM) -mno-avx -mno-avx2 -O3 -o $(OUTDIR)/$(NOAVX_NAME).O3.readable.s $(NOAVX_SRC)
	$(CXX) $(CXXFLAGS_VERBOSE_ASM) -mno-avx -mno-avx2 -Os -o $(OUTDIR)/$(NOAVX_NAME).Os.readable.s $(NOAVX_SRC)
	$(CXX) $(CXXFLAGS_ASM) -mno-avx -mno-avx2 -O0 -c -o $(OUTDIR)/$(NOAVX_NAME).O0.s $(NOAVX_SRC)
	$(CXX) $(CXXFLAGS_ASM) -mno-avx -mno-avx2 -O1 -c -o $(OUTDIR)/$(NOAVX_NAME).O1.s $(NOAVX_SRC)
	$(CXX) $(CXXFLAGS_ASM) -mno-avx -mno-avx2 -O2 -c -o $(OUTDIR)/$(NOAVX_NAME).O2.s $(NOAVX_SRC)
	$(CXX) $(CXXFLAGS_ASM) -mno-avx -mno-avx2 -O3 -c -o $(OUTDIR)/$(NOAVX_NAME).O3.s $(NOAVX_SRC)
	$(CXX) $(CXXFLAGS_ASM) -mno-avx -mno-avx2 -Os -c -o $(OUTDIR)/$(NOAVX_NAME).Os.s $(NOAVX_SRC)
