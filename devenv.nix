{ pkgs, ... }:

{
  packages = [
    pkgs.hugo
    (pkgs.python3.withPackages (pythonPackages: [
      pythonPackages.docutils
      pythonPackages.pygments
    ]))
  ];

  scripts.build.exec = "hugo --cleanDestinationDir";
  scripts.serve.exec = "hugo server";

  enterShell = ''
    echo "domenkozar.com development environment"
    echo "Run 'build' to build the site"
    echo "Run 'serve' to serve the site locally"
  '';
}
