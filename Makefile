install:
	sudo cp emacs-daemon /usr/local/bin/emacs-daemon
	mkdir -p ~/.config/systemd/user/
	cp emacs.service ~/.config/systemd/user/
	systemctl --user enable emacs
	systemctl --user start emacs

clean:
	rm -f *.elc core/*.el core/*.elc modules/*.el modules/*.elc *~
