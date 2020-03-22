
hubDir = /public/groups/cgl/cat/primates_evan/out/assemblyHub
txtFiles = $(wildcard *.txt) $(wildcard */*.txt) 

all: ${txtFiles:%=${hubDir}/%}

${hubDir}/%: %
	cp -f $< $@
