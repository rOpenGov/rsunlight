all: move pandoc rmd2md cleanup

vignettes: 
		cd inst/vign;\
		Rscript -e 'library(knitr); knit("rsunlight_vignette.Rmd")'

move:
		cp inst/vign/rsunlight_vignette.md vignettes
		cp -r inst/vign/figure vignettes

pandoc:
		cd vignettes;\
		pandoc -H margins.sty rsunlight_vignette.md -o rsunlight_vignette.pdf;\
		pandoc -H margins.sty rsunlight_vignette.md -o rsunlight_vignette.html

rmd2md:
		cd vignettes;\
		cp rsunlight_vignette.md rsunlight_vignette.Rmd

cleanup:
		cd vignettes;\
		rm -rf figure