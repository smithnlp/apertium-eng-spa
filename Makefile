all : spa-eng.automorf.bin \
      spa-eng.autogen.bin \
      spa-eng.autobil.bin \
      spa-eng.t1x.bin \
      eng-spa.automorf.bin \
      eng-spa.autogen.bin \
      eng-spa.autobil.bin

spa-eng.automorf.bin : apertium-spa.spa.dix
	lt-comp lr apertium-spa.spa.dix spa-eng.automorf.bin

spa-eng.autogen.bin : apertium-eng.eng.dix
	lt-comp rl apertium-eng.eng.dix spa-eng.autogen.bin

eng-spa.automorf.bin : apertium-eng.eng.dix
	lt-comp lr apertium-eng.eng.dix eng-spa.automorf.bin

eng-spa.autogen.bin : apertium-spa.spa.dix
	lt-comp rl apertium-spa.spa.dix eng-spa.autogen.bin

spa-eng.autobil.bin : apertium-spa-eng.spa-eng.dix
	lt-comp lr apertium-spa-eng.spa-eng.dix spa-eng.autobil.bin

eng-spa.autobil.bin : apertium-spa-eng.spa-eng.dix
	lt-comp rl apertium-spa-eng.spa-eng.dix eng-spa.autobil.bin

spa-eng.t1x.bin : apertium-spa-eng.spa-eng.t1x
	apertium-preprocess-transfer apertium-spa-eng.spa-eng.t1x spa-eng.t1x.bin

.PHONY : clean
clean :
	-rm *.bin

.PHONY : check
check :
	bash tests.sh
