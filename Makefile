all: move rmd2md

move:
		cp inst/vign/rsunlight_vignette.md vignettes
		cp -r inst/vign/figure vignettes

rmd2md:
		cd vignettes;\
		mv rsunlight_vignette.md rsunlight_vignette.Rmd
