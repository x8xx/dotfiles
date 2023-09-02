~/.zshrc: files/zsh/zshrc_*
	./scripts/build_zshrc.sh
	ln -sf ~/dotfiles/files/.zshrc  ~/

~/.tmux.conf: files/.tmux.conf
	ln -sf ~/dotfiles/files/.tmux.conf ~/

~/.gitconfig: files/.gitconfig
	ln -sf ~/dotfiles/files/.gitconfig ~/

clean:
	rm -f files/.zshrc

.PHONY: clean
