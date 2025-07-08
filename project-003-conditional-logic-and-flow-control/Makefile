# Ruta al módulo COBOL dinámico
COBFLAGS = -Wall

run: clean build
	@echo ">> Ejecutando aplicación..."
	COB_LIBRARY_PATH=lib ./bin/PROJ3

build: clean
	@echo ">> Creando carpeta bin/..."
	mkdir -p bin
	@echo ">> Compilando PROJ3.COB como ejecutable..."
	cobc $(COBFLAGS) -x -o bin/PROJ3 src/PROJ3.COB

clean:
	@echo ">> Limpiando directorio bin/..."
	rm -rf bin

