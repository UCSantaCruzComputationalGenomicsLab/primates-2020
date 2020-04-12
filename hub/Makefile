
hubDir = /public/groups/cgl/cat/primates_evan/out/assemblyHub
trackHubDir = /public/groups/cgl/cat/primates_evan/out/trackHub
txtFiles = $(wildcard *.txt) $(wildcard */*.txt) 

all: buildAssemblyHub buildTrackHub

buildAssemblyHub: ${txtFiles:%=${hubDir}/%}

${hubDir}/%: %
	cp -f $< $@


buildTrackHub: trackHubRoot rheMac10.buildTrackHub

trackHubRootTxt = $(notdir $(wildcard ../trackHub/*.txt))
trackHubRoot: ${trackHubRootTxt:%=${trackHubDir}/%}
${trackHubDir}/%: ../trackHub/%
	cp -f $< $@

rheMac10.buildTrackHub:
	${MAKE} buildTrackHubAsm srcAsm=Rhesus destAsm=rheMac10

# recursive
asmTxt = $(notdir $(wildcard ${srcAsm}/*.txt))
buildTrackHubAsm: ${asmTxt:%=${trackHubDir}/${destAsm}/%}

${trackHubDir}/${destAsm}/%: ${srcAsm}/%
	cp -f $< $@
