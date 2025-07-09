# Ruta al módulo COBOL dinámico
COBFLAGS = -Wall

run: clean build
	@echo ">> Ejecutando aplicación..."
	COB_LIBRARY_PATH=lib ./bin/PROJ4

build: clean
	@echo ">> Creando carpeta bin/..."
	mkdir -p bin
	@echo ">> Compilando PROJ4.COB como ejecutable..."
	cobc $(COBFLAGS) -x -o bin/PROJ4 src/PROJ4.COB

clean:
	@echo ">> Limpiando directorio bin/..."
	rm -rf bin

