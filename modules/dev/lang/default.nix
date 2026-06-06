{ den, ... }:
{
  den.aspects.lang = {
    includes = with den.aspects; [
      haskell
      nim
      rust
      cpp
      javascript
      go
      dart
      zig
      lean
    ];

  };
}
