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
alias mkdir+=take
alias    md+=take

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
jd_catch() {
	ps ax | grep "[J]Downloader.jar"
}

# Exit JD sending SIGTERM
jd_kill() {
	kill "$(</opt/jdownloader/JDownloader.pid)"
}

# Add links from file or stdin
jd_add() {
	if [[ -f "${1:?Missing operand}" ]]
	then jdownloader -add-links "$(<"$1")"
	else jdownloader -add-links "$@"
	fi
}