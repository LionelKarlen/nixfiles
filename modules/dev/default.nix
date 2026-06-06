{ den, ... }:
{
  den.aspects.dev = {
    includes = with den.aspects; [
      helix
      lang
    ];
  };
}
