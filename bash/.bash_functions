#
# ~/.bash_functions
#

## Utils

# Create directory and navigate into it
#	usage: take DIR [DIR...]
take() {
	: "${1:?Missing operand}"
	mkdir -p "$@" && cd "$_"
}

# Extract anything
#   usage: extract FILE [FILE...]
extract() {
	: "${1:?Missing operand}"
	for f; do if [[ -f "$f" ]]
	then case "$f" in
		*.tar.bz2|*.tbz2) tar xjf "$f" ;;
		*.tar.gz|*.tgz)   tar xzf "$f" ;;
		*.tar) tar xf "$f"     ;;
		*.bz2) bunzip2 "$f"    ;;
		*.gz)  gunzip "$f"     ;;
		*.rar) unrar e "$f"    ;;
		*.zip) unzip "$f"      ;;
		*.Z)   uncompress "$f" ;;
		*.7z)  7z x "$f"       ;;
		*) echo "extract: '$f' cannot be extracted via extract()" >&2 ;;
		esac
	else
		echo "extract: '$f' is not a valid file" >&2
		continue # exit 1
	fi done
}

# Cleanup all empty sub-directories
#   usage cleanup [DIR]
cleanup() {
	find "${1:-.}" -mindepth 1 -type d -empty -delete
}

# Flatten
# Move files to CWD, remove empty directories.
#   usage: flatten [DIR]
flatten() {
	find "${1:-.}" -mindepth 1 -type f -exec mv {} "${1:-.}/" \; && \
	find "${1:-.}" -mindepth 1 -type d -empty -delete
}

# (Re)Set permissions on sub-directories (at any depth)
#   usage: chmod-dirs [MODO] [DIR]
chmod-dirs() {
	find "${2:-.}" -mindepth 1 -type d -exec chmod "${1:-775}" {} \;
}

# (Re)Set permissions on files (at any depth)
#   usage: chmod-files [MODO] [DIR]
chmod-files() {
	find "${2:-.}" -type f -exec chmod "${1:-664}" {} \;
}

# List unpaired files
# Match 'foo.a' if there's no 'foo.b' in the same folder.
#   usage: unpaired [EXT1 [EXT2]]
unpaired() {
	while read file; do
		[[ -f "${file%.*}.${2:-jpg}" ]] || echo "$file"
	done < <(find . -iname "*.${1:-avi}")
}

# Search for paragraph
# Print lines from match to the end of paragraph (an empty line).
#	usage: skim FILE [MATCH]
skim() {
	sed -n "/${2}/I,/^$/p" "${1:?Missing operand}"
}


## Devel

# Init Arch Linux package devel
pkgbuild() {
	cp -i /usr/share/pacman/PKGBUILD.proto "${1:-.}/PKGBUILD"
}


## JDownloader

# Display current JD process
jd-catch() {
	ps ax | grep "[J]Downloader.jar"
}

# Exit JD sending SIGTERM
# Not working since JD has run as Systemd Service on my system
# https://gist.github.com/sevenissimo/0dc97bae29a5db89a7041303733d4948
#jd-kill() {
#	kill "$(</opt/jdownloader/JDownloader.pid)"
#}

# Add links from file or stdin
# Not working since JD has run as Systemd Service with PrivateUser=on
# https://gist.github.com/sevenissimo/0dc97bae29a5db89a7041303733d4948
#jd-add() {
#	if [[ -f "${1:?Missing operand}" ]]
#	then jdownloader -add-links "$(<"$1")"
#	else jdownloader -add-links "$@"
#	fi
#}

## Other

# Repeat last command (over and over) until succeeded
#   usage: rebang
rebang() {
	cmd="$(fc -ln -1)";
	while [ $? -ne 0 ]
	do
		eval "${cmd}"
		sleep ${RANDOM:0:2}
	done
	unset cmd
}
