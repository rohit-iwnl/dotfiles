function cfs
    if test (count $argv) -lt 2
        echo "Usage: cfs <codeforces-url> <folder name with spaces>"
        return 1
    end

    set url $argv[1]
    set raw_folder $argv[2..-1]

    # Parse contest + problem
    set match (string match -r '.*/(contest|problemset/problem)/([0-9]+)/([A-Z0-9]+).*' $url)
    if test (count $match) -lt 4
        echo "❌ Could not parse contest/problem from URL"
        return 1
    end

    set contest $match[3]
    set problem $match[4]

    # Folder name
    set folder_name (string replace -a ' ' '_' "$raw_folder")
    set folder "$contest$problem"_"$folder_name"

    mkdir -p "$folder"

    # Create main.cpp (NO heredocs, fish-safe)
    printf "%s\n" \
        "#include <bits/stdc++.h>" \
        "using namespace std;" \
        "" \
        "using ll = long long;" \
        "" \
        "int main() {" \
        "    ios::sync_with_stdio(false);" \
        "    cin.tie(nullptr);" \
        "" \
        "#ifndef ONLINE_JUDGE" \
        "    freopen(\"input.txt\", \"r\", stdin);" \
        "    freopen(\"output.txt\", \"w\", stdout);" \
        "#endif" \
        "" \
        "    // Problem: $contest$problem" \
        "    // Link: $url" \
        "" \
        "    int t;" \
        "    cin >> t;" \
        "    while (t--) {" \
        "        // TODO: solve" \
        "    }" \
        "" \
        "    return 0;" \
        "}" >"$folder/main.cpp"

    # IO files
    touch "$folder/input.txt" "$folder/output.txt"

    echo "✅ Setup complete: $folder/"

    # Open folder + problem
    subl "$folder"
    open "$url"
end
