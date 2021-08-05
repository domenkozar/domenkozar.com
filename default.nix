let
  mach-nix = import (builtins.fetchGit {
    url = "https://github.com/DavHau/mach-nix/";
    ref = "refs/tags/3.3.0";
  }) { python = "python27"; };
  pyenv = mach-nix.mkPython {
    requirements = builtins.readFile ./requirements.txt;
  };
in mach-nix.nixpkgs.stdenv.mkDerivation {
   name = "domenkozar.com";

   src = ./.;

   buildInputs = [ pyenv ];

   buildPhase = "blogofile build -s domenkozar.com";

   installPhase = "mkdir $out && cp -R domenkozar.com/_site/* $out";
}
