MAIN=main.exe

$(MAIN): main.o
	@echo Hello World
	gcc -Wall main.o -o $@

backup:
	@echo doing backup

main.o: main.c
	@echo Generate main.o file
	gcc -Wall -c main.c -o main.o

all: main.exe backup
