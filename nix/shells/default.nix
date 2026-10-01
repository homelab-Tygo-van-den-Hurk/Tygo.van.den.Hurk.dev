{ ... }:
{
  imports = [ ./develop.nix ];
  perSystem =
    { config, ... }:
    {
      devShells.default = config.devShells.develop;
    };
}
