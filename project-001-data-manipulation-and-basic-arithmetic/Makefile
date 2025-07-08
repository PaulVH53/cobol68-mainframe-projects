# Ruta al módulo COBOL dinámico
COBFLAGS = -Wall

run: clean build
	@echo ">> Ejecutando aplicación..."
	COB_LIBRARY_PATH=lib ./bin/PROJ1

build: clean
	@echo ">> Creando carpeta bin/..."
	mkdir -p bin
	@echo ">> Compilando PROJ1.COB como ejecutable..."
	cobc $(COBFLAGS) -x -o bin/PROJ1 src/PROJ1.COB

clean:
	@echo ">> Limpiando directorio bin/..."
	rm -rf bin

