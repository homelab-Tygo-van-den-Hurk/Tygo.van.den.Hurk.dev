{ inputs, ... }:
let
  inherit (inputs) self;
  inherit (inputs) nixpkgs;

  package = nixpkgs.lib.importJSON "${self}/package.json";
  lock = nixpkgs.lib.importJSON "${self}/package-lock.json";
in
{
  perSystem =
    { pkgs, ... }:
    {
      packages.site =
        with pkgs;
        buildNpmPackage rec {
          pname = "tygo.van.den.hurk.dev";
          inherit (package) version;
          src = self;

          # NPM dependencies

          inherit (importNpmLock) npmConfigHook;
          npmPruneFlags = [ ];
          makeCacheWritable = true;
          npmDeps = importNpmLock {
            packageLock = lock;
            npmRoot = self;
          };

          # NPM settings

          dontNpmBuild = false;
          passthru.updateScript = nix-update-script { };
          npmPackFlags = [ "--ignore-scripts" ];
          NODE_OPTIONS = "--openssl-legacy-provider";

          # Install

          installPhase = ''
            runHook preInstall
            mkdir --parents "$out/share/site"
            cp dist/* --recursive "$out/share/site"
            runHook postInstall
          '';

          # Checks

          doInstallCheck = true;
          doCheck = true;
          checkPhase = ''
            runHook preCheck
            CI="1" npm run --if-present test
            runHook postCheck
          '';

          # Meta

          meta = with lib; {
            inherit (package) description;
            inherit (package) homepage;
            inherit (package) keywords;
            licenses = with licenses; [ mit ];
            maintainers = with maintainers; [
              Tygo-van-den-Hurk
            ];
          };
        };
    };
}
