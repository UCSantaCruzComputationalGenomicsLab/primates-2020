
ifeq ($(shell hostname -f), courtyard.gi.ucsc.edu)
   hubRootDir = /public/groups/cgl/cat/primates_evan/out
   contact = markd@ucsc.edu
else
   hubRootDir = $(error Shwetha set this)
   contact = smurali@uw.edu
endif
asmHubDir = ${hubRootDir}/assemblyHub
trackHubDir = ${hubRootDir}/trackHub
txtFiles = $(wildcard *.txt) $(wildcard */*.txt) 

all: buildAssemblyHub buildTrackHub

##
# assembly hub
##
buildAssemblyHub: ${txtFiles:%=${asmHubDir}/%} ${asmHubDir}/hub.txt

${asmHubDir}/%: %
	cp -f $< $@

${asmHubDir}/hub.txt: hub-assembly.txt.in
	@mkdir -p $(dir $@)
	sed -e 's/@contact@/${contact}/' $< >$@


##
# track hub, edit files to reference data in assembly hub
##
buildTrackHub: trackHubRoot rheMac10.buildTrackHub

trackHubRootTxt = $(notdir $(wildcard ../trackHub/*.txt))
trackHubRoot: ${trackHubRootTxt:%=${trackHubDir}/%} ${trackHubDir}/hub.txt
${trackHubDir}/%: ../trackHub/%
	@mkdir -p $(dir $@)
	cp -f $< $@

${trackHubDir}/hub.txt: hub-tracks.txt.in
	@mkdir -p $(dir $@)
	sed -e 's/@contact@/${contact}/' $< >$@

rheMac10.buildTrackHub:
	${MAKE} buildTrackHubAsm srcAsm=Rhesus destAsm=rheMac10

##
# recursive target to copy files for one assembly
##
asmTxt = $(notdir $(wildcard ${srcAsm}/*.txt))
buildTrackHubAsm: ${asmTxt:%=${trackHubDir}/${destAsm}/%}

${trackHubDir}/${destAsm}/%: ${srcAsm}/%
	@mkdir -p $(dir $@)
	awk -v srcAsm=${srcAsm} -f filterTrackDb.awk $< > $@.tmp
	mv $@.tmp $@

${trackHubDir}/${destAsm}/%.html: ${srcAsm}/%.html
	@mkdir -p $(dir $@)
	cp -f $< $@
