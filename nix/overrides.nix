{ pkgs }:

self: super:

with { inherit (pkgs.stdenv) lib; };

with pkgs.haskell.lib;

{
  log-float = (
    with rec {
      log-floatSource = pkgs.lib.cleanSource ../.;
      log-floatBasic  = self.callCabal2nix "log-float" log-floatSource { };
    };
    overrideCabal log-floatBasic (old: {
    })
  );
}
