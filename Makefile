# Compiler and flags
CXX = g++
CXXFLAGS = -Wall -Iincludes

# Directories
SRCDIR = src
INCDIR = includes
OBJDIR = obj
BINDIR = bin

# Files
SOURCES = $(wildcard $(SRCDIR)/*.c)
OBJECTS = $(patsubst $(SRCDIR)/%.c, $(OBJDIR)/%.o, $(SOURCES))
MAIN = main.cpp
EXEC = $(BINDIR)/main

# Targets
all: $(EXEC)

$(EXEC): $(OBJECTS) $(MAIN)
	@mkdir -p $(BINDIR)
	$(CXX) $(CXXFLAGS) -o $@ $^

$(OBJDIR)/%.o: $(SRCDIR)/%.c
	@mkdir -p $(OBJDIR)
	$(CXX) $(CXXFLAGS) -c -o $@ $<

run: $(EXEC)
	./$(EXEC)

clean:
	rm -rf $(OBJDIR) $(BINDIR)

.PHONY: all run clean