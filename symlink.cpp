#include <iostream>
#include <sstream>
#include <string>
#include <fstream>

/* --- SCRIPT PURPOSE ---

   Read whatever file name which is passed to the script
   and look for the following:
    1. "DOTFILES SYMLINK" which tells that the file in question should
       create a symbolic link to the computers home directory

    2. Additional params which can be stated inside a " [ <params> ] "
      2.1 <path> which is where it should be symlinked to
      2.2 "HIDE" if file should be prefixed with a dot to hide it

    example: "# DOTFILES SYMLINK [ path/to/file/ HIDE ]" */

const int MAX_ARGS = 2;

using namespace std;

int main(int argc, char *argv[]) {

    string filename = argv[1];
    ifstream file(filename);

    while (file && !file.eof()) {

        string identifier = "DOTFILES SYMLINK", line;
        getline(file, line);

        int match = line.find(identifier);

        if (match < 0) continue;

        cout << "true" << endl;

        int argCount = 0,
            argBegin = line.find(identifier.append(" [ ")),
            argEnd   = line.find(" ]") - identifier.length() -2;

        if (argBegin > 0 && argEnd > 0) argBegin += identifier.length();
        else break;

        string argStr = line.substr(argBegin, argEnd),
               args[MAX_ARGS];

        stringstream ssin(argStr);

        while (ssin.good() && argCount < MAX_ARGS) ssin >> args[argCount++];
        for (int i = 0; i < argCount; i++) cout << args[i] << endl;

        break;

    }

    return 0;

}