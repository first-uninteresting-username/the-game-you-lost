{ pkgs, ... }:

let
  godot = pkgs.godot;
  templates = pkgs.godot-export-templates-bin;
  # e.g. "4.7.2.stable" — the directory name Godot looks for
  templatesVersion = builtins.replaceStrings [ "-" ] [ "." ] godot.version;
in
{
  packages = [
    godot
    pkgs.gdtoolkit_4 # gdformat, gdlint
    pkgs.python3 # local web server
  ];

  # Godot only looks for export templates under $XDG_DATA_HOME, so link the
  # nix-provided ones there (skipped if that version is already installed).
  enterShell = ''
    tpl_dir="''${XDG_DATA_HOME:-$HOME/.local/share}/godot/export_templates"
    if [ ! -e "$tpl_dir/${templatesVersion}" ]; then
      mkdir -p "$tpl_dir"
      ln -s "${templates}/share/godot/export_templates/${templatesVersion}" "$tpl_dir/${templatesVersion}"
    fi
    echo "godot $(godot --version)"
  '';

  scripts = {
    editor.exec = "godot --editor --path \"$DEVENV_ROOT\" \"$@\"";
    export-web.exec = ''
      mkdir -p "$DEVENV_ROOT/build/web"
      godot --headless --path "$DEVENV_ROOT" --export-release Web "$DEVENV_ROOT/build/web/index.html"
    '';
    serve-web.exec = "python3 -m http.server --directory \"$DEVENV_ROOT/build/web\" \"\${1:-8060}\"";
    lint.exec = "gdlint \"$DEVENV_ROOT\" && gdformat --check \"$DEVENV_ROOT\"";
    fmt.exec = "gdformat \"$DEVENV_ROOT\"";
  };
}
