n=0; \
ioreg -lw0 | grep "IODisplayEDID" \
    | while read line; do \
        ((n++)); \
        name=display-${n}.edid; \
        sed "/[^<]*</s///" <<<"$line" | xxd -p -r >$name; \
        echo "Created $name"; \
    done