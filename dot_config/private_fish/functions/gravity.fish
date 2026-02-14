function gravity
    if test -z "$argv[1]"
        echo "Usage: gravity <directory>"
        return 1
    end

    open -a Antigravity "$argv[1]" --args \
        --disable-gpu-driver-bug-workarounds \
        --ignore-gpu-blacklist \
        --enable-gpu-rasterization
end
