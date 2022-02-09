for f in raw/*; do
	name=/${f##*/}
	docker run --rm -it -v $(pwd)/raw/:/raw -v $(pwd)/StarWarsSounds/:/StarWarsSounds linuxserver/ffmpeg -i /"$f" -map_metadata -1 -c:a libopus -b:a 64k -vbr on -compression_level 10 /StarWarsSounds/${name/%mp3/ogg}
done
