.PHONY: links link_nvim link_kitty link_zsh link_ssh link_git


links: | link_nvim link_kitty link_zsh link_ssh link_git link_brewfile

link_nvim:
	ln -s -F -h -v ~/dotfiles/nvim ~/.config/nvim

link_kitty:
	ln -s -F -h -v ~/dotfiles/kitty ~/.config/kitty

link_ssh:
	ln -s -F -h -v ~/dotfiles/.ssh/config ~/.ssh/config

link_zsh:
	ln -s -F -h -v ~/dotfiles/zsh/.zshrc ~/.zshrc

link_git:
	ln -s -F -h -v ~/dotfiles/.gitconfig ~/.gitconfig

link_brewfile:
	ln -s -F -h -v ~/dotfiles/Brewfile ~/.Brewfile

zsh_plugins:
	curl -sSL https://github.com/zthxxx/jovial/raw/master/installer.sh | sudo -E bash -s ${USER}
