#
# ~/.bash_functions
#


## Utils

# Create directory and navigate into it
#	usage: mkdir+ /path/to/dir
function _mkdir() {
	mkdir -p "$@" && cd "$_"
}
alias mkdir+=_mkdir
alias    md+=_mkdir

# Extract anything
#   usage: extract FILE
function extract() {
	if [[ -f $1 ]]; then
		case $1 in
			*.tar.bz2|*.tbz2) tar xjf "$1" ;;
			*.tar.gz|*.tgz)   tar xzf "$1" ;;
			*.tar) tar xf "$1"     ;;
			*.bz2) bunzip2 "$1"    ;;
			*.gz)  gunzip "$1"     ;;
			*.rar) unrar e "$1"    ;;
			*.zip) unzip "$1"      ;;
			*.Z)   uncompress "$1" ;;
			*.7z)  7z x "$1"       ;;
			*) echo "extract: '$1' cannot be extracted via extract()" ;;
		esac
	else
		echo "extract: '$1' is not a valid file"
	fi
}

# List mismatched files
#   usage: unpaired [EXT1 [EXT2]]
function unpaired() {
	find . -iname "*.${1:-avi}" | while read file; do
		[[ -f "${file%.*}.${2:-jpg}" ]] || echo "${file}"
	done
}

# Search for paragraph
#	usage: skim FILE [MATCH]
function skim() {
	sed -n "/${2}/I,/^$/p" "$1"
}


## Devel

# Init Arch Linux package devel
function pkgbuild() {
	cp -i /usr/share/pacman/PKGBUILD.proto "${1:-.}/PKGBUILD"
}


## JDownloader

# Display current JD process
function jd_catch() {
	ps ax | grep "[J]Downloader.jar"
}

# Exit JD sending SIGTERM
function jd_kill() {
	kill $(awk '{print $1}' "/opt/JDownloader/JDownloader.pid")
}

# Add links from stdin or from file
function jd_add() {
	if [[ -f $1 ]]; then
		xargs -a "$1" jdownloader -add-links
	else
		jdownloader -add-links $@
	fi
}