# homebrew-prism

Homebrew tap for [Prism](https://github.com/sdiehl/prism) compiler.

```sh
brew install sdiehl/prism/prism
# or
brew tap sdiehl/prism
brew install prism
```

Apple Silicon only. The formula installs the prebuilt binary and pulls in
`llvm@22` (which the binary links against and uses for native codegen). Build
from source on other platforms; see the main repo's README.

The `Formula/prism.rb` `url`/`sha256`/`version` are kept current automatically by
the release workflow in `sdiehl/prism`.
