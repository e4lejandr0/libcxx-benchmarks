#include <iostream>
#include <fstream>
#include <regex>
#include <array>

int main(int argc, char** argv) {

	if(argc != 3) {
		std::cerr << "Usage: " << argv[0] << " <regex> <file>\n";
		return 1;
	}
		
	std::ifstream input(argv[2]);
	std::smatch submatches;
	std::regex test_expr(argv[1]);
	size_t total_matches = 0;

	for(std::string line; std::getline(input, line);) {
		std::regex_match(line, submatches, test_expr);
		total_matches += submatches.size();
	}
	std::cout << "Lines matched: " << total_matches << "\n";

	return 0;
}
