{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    rustup
    zola
    git
  ];

  shellHook = ''
    echo "Rust is now available!"
    echo "Version: $(rustc --version)"
    echo "Zola is now available!"
    echo "Version: $(zola --version)"
  '';
}
