export CC = gcc
export CXX = g++
export CFLAGS = -w -O3 -pthread

INSTALL_PATH=bin/
BIN = onlinebiratm
OBJ = onlineinference.o onlinelearn.o
.PHONY: clean all

all: $(BIN)

onlinebiratm:onlinebiratm.cpp onlinebiratm.h onlineinference.o onlinelearn.o onlineutils.h
onlineinference.o: onlineinference.cpp onlineutils.h onlineinference.h onlinebiratm.h
onlinelearn.o: onlinelearn.cpp onlineutils.h onlinelearn.h onlinebiratm.h

$(BIN) : 
	$(CXX) $(CFLAGS) -o $@ $(filter %.cpp %.o %.c, $^)

$(OBJ) :
	$(CXX) -c $(CFLAGS) -o $@ $(filter %.cpp %.c, $^)

install:
	cp -f -r $(BIN) $(INSTALL_PATH)

clean:
	$(RM) $(OBJ) $(BIN) *~
