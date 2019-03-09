function scan () {
	mkdir .scantmp
	scanimage -d fujitsu:fi-5120Cdj:144220 --page-width 210 --page-height 297 --format tiff --batch=./.scantmp/%d.tiff --resolution 300 --mode=color
	cd .scantmp
	for f in *.tiff; do
		tiff2pdf -j $f -o ${f:r}.pdf;
	done
	cd ..
	pdfunite ./.scantmp/*.pdf $1
	rm -rf .scantmp
}
