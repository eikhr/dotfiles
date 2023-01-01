.PHONY: links link_nvim link_kitty link_zsh


links: | link_nvim link_kitty link_zsh

link_nvim:
	ln -s -F -h -v ~/dotfiles/nvim/ ~/.config/nvim

link_kitty:
	ln -s -F -h -v ~/dotfiles/kitty/ ~/.config/kitty

link_zsh:
	ln -s -F -h -v ~/dotfiles/zsh/.zshrc ~/.zshrc

zsh_plugins:
	curl -sSL https://github.com/zthxxx/jovial/raw/master/installer.sh | sudo -E bash -s ${USER}
