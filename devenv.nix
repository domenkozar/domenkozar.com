{ pkgs, ... }:

{
  languages.python = {
    enable = true;
    version = "2.7";
    venv.enable = true;
    venv.requirements = ./requirements.txt;
  };

  packages = [ ];

  scripts.build.exec = "blogofile build -s domenkozar.com";
  scripts.serve.exec = "blogofile serve -s domenkozar.com";

  enterShell = ''
    echo "domenkozar.com development environment"
    echo "Run 'build' to build the site"
    echo "Run 'serve' to serve the site locally"
  '';
}
