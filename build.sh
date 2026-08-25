set -euo pipefail

QT_DIR_WIN="C:/Qt/6.11.1/mingw_64"
MINGW_WIN="C:/Qt/Tools/mingw1310_64"
QT_DIR="/c/Qt/6.11.1/mingw_64"
MINGW="/c/Qt/Tools/mingw1310_64"
CMAKE="/c/Qt/Tools/CMake_64/bin/cmake.exe"

export PATH="$(dirname "$CMAKE"):/c/Qt/Tools/Ninja:$QT_DIR/bin:$MINGW/bin:$PATH"

configure() {
    "$CMAKE" -S . -B build/debug -G Ninja \
        -DCMAKE_BUILD_TYPE=Debug \
        -DCMAKE_PREFIX_PATH="$QT_DIR_WIN" \
        -DCMAKE_C_COMPILER="$MINGW_WIN/bin/gcc.exe" \
        -DCMAKE_EXPORT_COMPILE_COMMANDS=ON
}

build() {
    [[ -f build/debug/build.ninja ]] || configure
    "$CMAKE" --build build/debug --parallel
}

case "${1:-build}" in
    configure) configure ;;
    build) build ;;
    run) build && ./build/debug/DTRSystem.exe ;;
    clean) rm -rf build/debug ;;
    *) echo "usage: $0 (configure|build|run|clean)"; exit 1 ;;
esac