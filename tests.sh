declare -a sentences=("vas a comprar un libre"
		      "Mira a la tema de hoy"
		      "voy al hospital"
		      "va con El a ver una casa"
		      "Hay unos hospitales")


for sent in "${sentences[@]}"
do
	echo -e ${sent}$"\t\t"$(echo ${sent} | lt-proc spa-eng.automorf.bin |   gawk 'BEGIN{RS="$"; FS="/";}{nf=split($1,COMPONENTS,"^"); for(i = 1; i<nf; i++) printf COMPONENTS[i]; if($2 != "") printf("^%s$",$2);}' |   apertium-transfer apertium-spa-eng.spa-eng.t1x spa-eng.t1x.bin spa-eng.autobil.bin  |   lt-proc -g spa-eng.autogen.bin)
done
