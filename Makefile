all: ~/.zshrc ~/.tmux.conf ~/.gitconfig ~/.config/nvim/ ~/sashimi.json

~/.zshrc: files/zsh/*zshrc_*
	./scripts/build_zshrc.sh
	ln -sf ~/dotfiles/files/.zshrc  ~/

~/.tmux.conf:
	ln -sf ~/dotfiles/files/.tmux.conf ~/

~/.gitconfig:
	ln -sf ~/dotfiles/files/.gitconfig ~/

~/.config/nvim/:
	ln -sf ~/dotfiles/files/nvim/ ~/.config/nvim

~/sashimi.json:
	ln -sf ~/dotfiles/files/sashimi/sashimi.json ~/

clean:
	rm -f files/.zshrc

.PHONY: clean ~/.tmux.conf ~/.gitconfig ~/.config/nvim/ ~/sashimi.json
