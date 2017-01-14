install:
	sudo cp emacs-daemon /usr/local/bin/emacs-daemon
	mkdir -p ~/.config/systemd/user/
	cp emacs.service ~/.config/systemd/user/
	sudo pacman aspell-en
	systemctl --user enable emacs

clean:
	rm -f *.elc core/*.el core/*.elc modules/*.el modules/*.elc *~
