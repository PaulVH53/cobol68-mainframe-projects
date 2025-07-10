# Ruta al módulo COBOL dinámico
COBFLAGS = -Wall

run: clean build
	@echo ">> Ejecutando aplicación..."
	COB_LIBRARY_PATH=lib ./bin/PROJ5

build: clean
	@echo ">> Creando carpeta bin/..."
	mkdir -p bin
	@echo ">> Compilando PROJ5.COB como ejecutable..."
	cobc $(COBFLAGS) -x -o bin/PROJ5 src/PROJ5.COB

clean:
	@echo ">> Limpiando directorio bin/..."
	rm -rf bin

