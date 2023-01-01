.PHONY: links nvim kitty


links: | nvim

nvim:
	ln -v -F -s ~/dotfiles/nvim/ ~/.config/nvim
