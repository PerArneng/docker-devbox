#!/usr/bin/env bash

function log {
	echo "devbox: $1"
}

function print_help {
	log "build & push the Devobox"
	log "usage: devbox [-b|-p] [-t tag] [-h]"
	log "OPTIONS:"
	log "   -b  				build the image"
	log "   -p  				push the image"
  log "   -t <tag>		the tag for the image"
	log "   -help				this help"
}
while getopts "bpt:h" opt; do
  	case $opt in
	  	h)
				print_help
				exit
			;;

			b) build="true";;
			p) push="true";;
			t) tagname=$OPTARG;;

			\?)
				log "invalid option: -$OPTARG" >&2
	 			print_help
				exit 1
			;;

			:)
				log "option -$OPTARG requires an argument." >&2
				print_help
				exit 1
			;;
	esac
done


if [[ -z $tagname ]]
then
	tagname="latest"
fi

image="perarneng/devbox:"$tagname

if [[ -n $build ]]
then
	log "building "$image
	docker build -t $image .
fi

if [[ -n $push ]]
then
	log "pushing "$image
	docker push $image
fi
