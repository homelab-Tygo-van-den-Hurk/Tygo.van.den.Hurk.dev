{ inputs, ... }: rec {
  # When applied, adds the packages of this flake to the package set.
  flake.overlays.default = flake.overlays.packages;
  flake.overlays.packages =
    _: previous:
    let
      inherit (previous.stdenv) system;
    in
    inputs.self.packages.${system};
}
