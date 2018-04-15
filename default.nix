{ pkgs ? (import <nixpkgs> {}).pkgs }:
{
  screenshot = pkgs.callPackage ./screenshot {};
  xrectsel = pkgs.callPackage ./xrectsel {};
}
