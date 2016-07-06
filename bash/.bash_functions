#
# ~/.bash_functions
#


# Create directory and cd into
# function md() {
#	mkdir -p "$@" && cd "$_"
# }

# Copy w/ progress
# function cpp() {
#	rsync -Wav --human-readable --progress "$@"
# }

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
#   usage: mismatched [EXT1 [EXT2]]
function mismatched() {
	#for file in *."${1:-avi}"; do
	find . -name "*.${1:-avi}" | while read file; do
		[[ -f "${file%.*}.${2:-jpg}" ]] || echo "${file}"
	done
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
