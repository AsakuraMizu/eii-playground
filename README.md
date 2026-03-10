# eii-playground

Minimal reproduction for a rustc bug where EII (Externally Implementable Items) shim symbols are eliminated by thin-local LTO, causing linker errors.

Upstream issue: https://github.com/rust-lang/rust/issues/153645

## Reproduction

```
./test.sh
```
