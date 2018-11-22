CXX := clang++
CXX_FLAGS := -Og -g -stdlib=libc++ -std=c++17 -I/usr/local/include
LD_FLAGS := -Wl,-rpath=/usr/local/lib -L/usr/local/lib
RESULTS_DIR := results
BIN_DIR := bin
EXE := bench
SRCS := $(wildcard *.cpp)


all: $(BIN_DIR) $(BIN_DIR)/bench

$(BIN_DIR):
	@mkdir -p $(BIN_DIR)

$(BIN_DIR)/bench: bench.cpp
	$(CXX) $(SRCS) $(CXX_FLAGS) $(LD_FLAGS) -o $(BIN_DIR)/$(EXE)

.PHONY: clean-all
clean-all: clean clean-results clean-logs
.PHONY: clean
clean:
	@rm -rf $(BIN_DIR)

.PHONY: clean-results
clean-results:
	@rm -rf $(RESULTS_DIR)
	@mkdir -p $(RESULTS_DIR)

.PHONY: clean-logs
clean-logs:
	@rm *log

.PHONY: results
results:
	./run-benchmarks
