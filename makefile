# Makefile for managing projects

# Importing enviorment variables
include .env
export $(shell sed 's/=.*//' .env)

# CPP Commands

CPP_BUILD_DIR := $(CPP_PROJECT_DIR)/build

cpp_clean:
	@echo "Cleaning build directory..."
	@if [ -d "$(CPP_BUILD_DIR)" ]; then \
		echo "Removing $(CPP_BUILD_DIR)..."; \
		rm -rf $(CPP_BUILD_DIR); \
	else \
		echo "No build directory to remove."; \
	fi

cpp_compile:
	@echo "Compiling the code..."
	mkdir -p $(CPP_BUILD_DIR)
	cd $(CPP_BUILD_DIR) && cmake .. && cmake --build .
	@echo "Code compiled successfully."


cpp_run:
	@echo "Running the program..."
	@if [ ! -d "$(CPP_BUILD_DIR)" ]; then \
		echo "Build directory doesn't exist. Compiling first..."; \
		$(MAKE) compile; \
	fi
	@if [ ! -f "$(CPP_BUILD_DIR)/$(CPP_BIN_NAME)" ]; then \
		echo "Binary not found. Make sure your target is named '$(CPP_BIN_NAME)'."; \
		exit 1; \
	fi
	@echo "Executing binary with args: $(ARGS)"
	@$(CPP_BUILD_DIR)/$(CPP_BIN_NAME) $(ARGS)


# TS Commands

TS_BUILD_DIR := $(TS_ROOT_DIR)/${TS_DIST_DIR}
TS_ENTRY_FILE_PATH := $(TS_BUILD_DIR)/src/${TS_MAIN_FILE}.js

ts_clean:
	@echo "Cleaning dist directory..."
	@if [ -d "$(TS_BUILD_DIR)" ]; then \
		echo "Removing $(TS_BUILD_DIR)..."; \
		rm -rf $(TS_BUILD_DIR); \
	else \
		echo "No build directory to remove."; \
	fi

ts_compile:
	@echo "Compiling the code..."
	mkdir -p $(TS_BUILD_DIR)
	cd $(TS_ROOT_DIR) && npx tsc && cd ..
	@echo "Code compiled successfully."



ts_run:
	@echo "Running the program..."
	@if [ ! -d "$(TS_BUILD_DIR)" ]; then \
		echo "Build directory doesn't exist. Compiling first..."; \
		$(MAKE) ts_compile; \
	fi
	@if [ ! -f "$(TS_ENTRY_FILE_PATH)" ]; then \
		echo "Binary not found. Make sure your target is named '$(TS_MAIN_FILE)'."; \
		exit 1; \
	fi
	@echo "Executing binary with args: $(ARGS)"
	node ${TS_ENTRY_FILE_PATH} ${ARGS}


# PY Commands

PY_ENTRY_FILE_PATH := $(PY_ROOT_DIR)/${PY_MAIN_FILE}.py

py_clean:
	@echo "Cleaning __pycache__ folders under $(PY_ROOT_DIR)..."
	@find $(PY_ROOT_DIR) -type d -name "__pycache__" -exec rm -rf {} +
	@echo "Done cleaning."

py_run:
	@echo "Running the program..."
	@if [ ! -d "$(PY_ROOT_DIR)" ]; then \
		echo "The root directy does not exist ..."; \
		exit 1; \
	fi
	@if [ ! -f "$(PY_ENTRY_FILE_PATH)" ]; then \
		echo "Python File not found. Make sure your target is named '$(PY_ENTRY_FILE_PATH)'."; \
		exit 1; \
	fi

	@echo "Running script via venv python..."
	@${PY_VENV_NAME}/bin/python3 ${PY_ENTRY_FILE_PATH} ${ARGS}


# ALL

clean:
	$(MAKE) cpp_clean && $(MAKE) ts_clean

compile:
	$(MAKE) cpp_compile && $(MAKE) ts_compile

run:
	$(MAKE) cpp_run && $(MAKE) ts_run && $(MAKE) py_run