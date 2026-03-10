set -x

export CARGO_TERM_QUIET=true

# Bug: dev profile with opt-level=1
# Expected: linker error "undefined symbol: decl1::decl1"
cargo clean
CARGO_PROFILE_DEV_OPT_LEVEL=1 cargo run

# Bug: release profile (opt-level=3)
# Expected: same linker error
cargo clean
cargo run --release

# Workaround: dev profile (opt-level=0)
cargo clean
cargo run

# Workaround: dev profile with opt-level=1 and codegen-units=1
cargo clean
CARGO_PROFILE_DEV_OPT_LEVEL=1 CARGO_PROFILE_DEV_CODEGEN_UNITS=1 cargo run

# Workaround: dev profile with opt-level=1 and lto=off
cargo clean
CARGO_PROFILE_DEV_OPT_LEVEL=1 CARGO_PROFILE_DEV_LTO=off cargo run

# Workaround: release profile with opt-level=0
cargo clean
CARGO_PROFILE_RELEASE_OPT_LEVEL=0 cargo run --release

# Workaround: release profile (opt-level=3) and codegen-units=1
cargo clean
CARGO_PROFILE_RELEASE_CODEGEN_UNITS=1 cargo run --release

# Workaround: release profile (opt-level=3) and lto=off
cargo clean
CARGO_PROFILE_RELEASE_LTO=off cargo run --release
