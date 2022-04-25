{ pkgs, ... }:
{
    environment.variables = { EDITOR = "vim"; };

    environment.systemPackages = with pkgs; [
        (neovim.override {
            vimAlias = true;
            configure = {
                customRC = builtins.readFile ./init.vim;
            };
        })
    ];
}

