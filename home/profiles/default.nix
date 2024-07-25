{
  self,
  inputs,
  ...
}: let
  # get these into the module system
  extraSpecialArgs = {inherit inputs self;};

  homeImports = {
    "kry@aesthetic" = [
      ../.
      ./aesthetic
    ];
  };

  inherit (inputs.hm.lib) homeManagerConfiguration;

  pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
in {
  _module.args = {inherit homeImports;};

  flake = {
    homeConfiguration = {
      "kry_aesthetic" = homeManagerConfiguration {
        modules = homeImports."kry@aesthetic";
        inherit pkgs extraSpecialArgs;
      };
    };
  };
}
