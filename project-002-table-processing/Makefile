# Ruta al módulo COBOL dinámico
COBFLAGS = -Wall

run: clean build
	@echo ">> Ejecutando aplicación..."
	COB_LIBRARY_PATH=lib ./bin/PROJ2

build: clean
	@echo ">> Creando carpeta bin/..."
	mkdir -p bin
	@echo ">> Compilando PROJ2.COB como ejecutable..."
	cobc $(COBFLAGS) -x -o bin/PROJ2 src/PROJ2.COB

clean:
	@echo ">> Limpiando directorio bin/..."
	rm -rf bin

