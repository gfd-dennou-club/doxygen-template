all:
	@echo "cd doc && make doxygen.stamp"

clean:
	( cd doc && make clean )
