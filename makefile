# Makefile for managing projects

# Importing enviorment variables
include .env
export $(shell sed 's/=.*//' .env)

# CPP Commands

CPP_BUILD_DIR := $(CPP_PROJECT_DIR)/build
CPP_CONAN_DIR := $(CPP_PROJECT_DIR)/${CONAN_BUILD_DIR}

cpp_clean:
	@echo "Cleaning build directory..."
	@if [ -d "$(CPP_BUILD_DIR)" ]; then \
		echo "Removing $(CPP_BUILD_DIR)..."; \
		rm -rf $(CPP_BUILD_DIR); \
		rm -rf $(CPP_CONAN_DIR); \
	else \
		echo "No build directory to remove."; \
	fi

cpp_compile:
	@echo "Compiling the code..."
	./${CPP_PROJECT_DIR}/conan_compile.sh
# 	mkdir -p $(CPP_BUILD_DIR)
# 	cd $(CPP_BUILD_DIR) && cmake .. && cmake --build .
	@echo "Code compiled successfully."


cpp_run:
	@echo "Running the program..."
	@if [ ! -d "$(CPP_BUILD_DIR)" ]; then \
		echo "Build directory doesn't exist. Compiling first..."; \
		$(MAKE) cpp_compile; \
	fi
	@if [ ! -f "$(CPP_BUILD_DIR)/$(CPP_BIN_NAME)" ]; then \
		echo "Binary not found. Make sure your target is named '$(CPP_BIN_NAME)'."; \
		exit 1; \
	fi
	@echo "Executing binary with args: ${A} ${B}"
	@$(CPP_BUILD_DIR)/$(CPP_BIN_NAME) ${A} ${B}


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
	@if [ -d "$(TS_ROOT_DIR)/" ]; then \
		echo "Removing $(TS_ROOT_DIR)/node_modules..."; \
		rm -rf $(TS_ROOT_DIR)/node_modules; \
	else \
		echo "No build directory to remove."; \
	fi

ts_install:
	@echo "Installing Packages ..."
	cd $(TS_ROOT_DIR) && npm install && cd ..

ts_compile:
	@if [ ! -d "${TS_ROOT_DIR}/node_modules" ]; then \
		echo "❌ Node Modules not Installing on folder '${TS_ROOT_DIR}'"; \
		$(MAKE) ts_install; \
	fi
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
	@echo "Executing binary with args: ${A} ${B}"
	node ${TS_ENTRY_FILE_PATH} ${A} ${B}


# PY Commands

PY_ENTRY_FILE_PATH := $(PY_ROOT_DIR)/${PY_MAIN_FILE}.py

py_clean:
	@echo "Cleaning __pycache__ folders under $(PY_ROOT_DIR)"
	@echo "Cleaning python venv with name $(PY_VENV_NAME)"
	@find $(PY_ROOT_DIR) -type d -name "__pycache__" -exec rm -rf {} +
	@find . -type d -name "${PY_VENV_NAME}" -exec rm -rf {} +
	@echo "Done cleaning."

py_create_venv:
	@echo "Creating venv with name:${PY_VENV_NAME}..."
	python3 -m venv ${PY_VENV_NAME}; \
	$(MAKE) py_pip_install;


# Install packages from requirements.txt
py_pip_install:
	@if [ ! -d "${PY_VENV_NAME}" ]; then \
		echo "❌ Virtual environment '${PY_VENV_NAME}' does not exist."; \
		exit 1; \
	fi
	@if [ ! -f "requirements.txt" ]; then \
		echo "❌ requirements.txt file not found."; \
		exit 1; \
	fi
	@echo "✅ Installing packages from requirements.txt into venv '${PY_VENV_NAME}'..."
	@. ${PY_VENV_NAME}/bin/activate && pip install -r requirements.txt; \
	deactivate


# Generate requirements.txt from venv
py_gen_pip_list:
	@if [ ! -d "${PY_VENV_NAME}" ]; then \
		echo "❌ Virtual environment '${PY_VENV_NAME}' does not exist."; \
		exit 1; \
	fi
	@echo "✅ Generating requirements.txt from venv '${PY_VENV_NAME}'..."
	@. ${PY_VENV_NAME}/bin/activate && pip freeze > requirements.txt
	deactivate

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
	@if [ ! -d "$(PY_VENV_NAME)" ]; then \
		echo "No Python venv found with name '$(PY_VENV_NAME)'. Please Launch command first: make py_create_venv"; \
		exit 1; \
	fi

	@echo "Running script via venv python..."
	@${PY_VENV_NAME}/bin/python3 ${PY_ENTRY_FILE_PATH} ${A} ${B}


all_clean:
	@echo "All Cleaning..."
	$(MAKE) py_clean && $(MAKE) ts_clean && $(MAKE) cpp_clean;