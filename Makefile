~/.zshrc: files/zsh/zshrc_*
	./scripts/build_zshrc.sh
	ln -sf ~/dotfiles/files/.zshrc  ~/

~/.tmux.conf:
	ln -sf ~/dotfiles/files/.tmux.conf ~/

~/.gitconfig:
	ln -sf ~/dotfiles/files/.gitconfig ~/

~/.config/nvim/:
	ln -sf ~/dotfiles/files/nvim/ ~/.config/nvim

clean:
	rm -f files/.zshrc

.PHONY: clean ~/.tmux.conf ~/.gitconfig ~/.config/nvim
