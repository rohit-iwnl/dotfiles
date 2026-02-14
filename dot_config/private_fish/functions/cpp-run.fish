function cpp-run
    if test (count $argv) -eq 0
        echo "Usage: cpp-run <cpp_file> [args...]"
        return 1
    end

    set cpp_file $argv[1]
    set -e argv[1]

    if not test -f "$cpp_file"
        echo "File not found: $cpp_file"
        return 1
    end

    set tmp_output (mktemp /tmp/cpp-run-XXXXXX)

    /opt/homebrew/bin/g++-15 -std=c++17 -O2 -Wall -Wextra -Wshadow -Wconversion \
        -o "$tmp_output" "$cpp_file"

    if test $status -ne 0
        echo "❌ Compilation failed."
        rm -f "$tmp_output"
        return 1
    end

    echo "✅ Compiled successfully (temp binary)"
    echo ----------------------------------------

    "$tmp_output" $argv

    rm -f "$tmp_output"
    rm -rf "$tmp_output.dSYM"
end
