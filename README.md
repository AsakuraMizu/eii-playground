# eii-playground

Minimal reproduction for a rustc bug where EII (Externally Implementable Items) shim symbols are eliminated by thin-local LTO, causing linker errors.

Upstream issue: <!-- TODO: link after filing -->

## Reproduction

```
./test.sh
```
