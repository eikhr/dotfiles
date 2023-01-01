.PHONY: links nvim kitty


links: | nvim kitty

nvim:
	ln -v -F -s ~/dotfiles/nvim/ ~/.config/nvim

kitty:
	ln -v -F -s ~/dotfiles/kitty/ ~/.config/kitty
