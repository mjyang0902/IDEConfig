#!/bin/bash
TARGET_DIR="nvim-downloads/v0.11.5/bin"

mkdir -p "$TARGET_DIR"

cat <<EOF > "$TARGET_DIR/nvim"
#!/bin/bash

export PATH=\$HOME/.cargo/bin:\$HOME/.local/bin:\$HOME/bin:\$PATH
exec /usr/bin/nvim "\$@"
EOF

chmod +x "$TARGET_DIR/nvim"

echo "Remote Neovim hijacked successfully at $TARGET_DIR/nvim"
