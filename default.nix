{ pkgs ? (import <nixpkgs> {}).pkgs }:
{
  acpilight = pkgs.callPackage ./acpilight {};
  screenshot = pkgs.callPackage ./screenshot {};
  xrectsel = pkgs.callPackage ./xrectsel {};
}
