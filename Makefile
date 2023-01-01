.PHONY: links nvim kitty


links: | nvim kitty

nvim:
	ln -s -F -h -v ~/dotfiles/nvim/ ~/.config/nvim

kitty:
	ln -s -F -h -v ~/dotfiles/kitty/ ~/.config/kitty
