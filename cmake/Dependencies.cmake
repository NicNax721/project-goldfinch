

if(NOT EXISTS "${CMAKE_CURRENT_SOURCE_DIR}/sqlite/sqlite3.c")
    message(FATAL_ERROR
        "\n"
        "sqlite3.c was not found in:\n"
        "    ${CMAKE_CURRENT_SOURCE_DIR}\n"
        "\n"
        "Download the SQLite AMALGAMATION from https://www.sqlite.org/download.html\n"
        "(the file called sqlite-amalgamation-XXXXXXX.zip), unzip it, and copy\n"
        "BOTH sqlite3.c and sqlite3.h into the folder above.\n"
        "Then run: Build > Run CMake, followed by Build > Rebuild All.\n")
endif()