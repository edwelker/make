#makefile for nothing

#macros, which can be referred to by $(var)
COMPRESS=zip
FILES=target sample

#macro modifier, change macro value to something else
#will change names to have a suffix of .txt
SOURCEFILES=$(FILES:%=%.txt)

#by identifying which rules are phony, performance improves
#also, it won't try to make a file named "clean"
.PHONY: clean all sources

#make zips and tars of each files
all: $(FILES:%=%.zip) $(FILES:%=%.tar)
sources: $(SOURCEFILES)

#default target, first one in the file
# $@ means "target name"
# @+ means "all prerequisites, space-separated."
%.zip: %.txt 
	$(COMPRESS) $@ $+ 

#$< means "the first prerequisite"
%.tar: %.txt
	tar cvf $@ $+

#should later look at how to combine the previous two into one

target.txt: 
	echo "this is the target" > target.txt

sample.txt:
	echo "this is a sample text" > sample.txt

#this is a contrived example to express dependencies across files
#or the macro in this case. There's a dependency, but no action
$(SOURCEFILES): $(shell which echo)

#Phony target, clean
# \before rm tells it not to complain about removing files
clean:
	\rm $(FILES:%=%.*)
