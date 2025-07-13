# Ruta al módulo COBOL dinámico
COBFLAGS = -Wall

run: clean build
	@echo ">> Ejecutando aplicación..."
	COB_LIBRARY_PATH=lib ./bin/PROJ6

build: clean
	@echo ">> Creando carpeta bin/..."
	mkdir -p bin
	@echo ">> Compilando PROJ6.COB como ejecutable..."
	cobc $(COBFLAGS) -x -o bin/PROJ6 src/PROJ6.COB

clean:
	@echo ">> Limpiando directorio bin/..."
	rm -rf bin

