{ ... }:
{
  imports = [
    ./site.nix
  ];

  perSystem =
    { 
      config, 
      pkgs,
      ... 
    }:
    {
      packages = {
        default = config.packages.site;
        inherit (pkgs) nodejs;
        inherit (pkgs) git;
        inherit (pkgs) act;
      };
    };
}
