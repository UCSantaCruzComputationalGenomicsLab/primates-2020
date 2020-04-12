# primates-2020
work on primate genome analysis


## hubs
Hubs are:
- /public/groups/cgl/cat/primates_evan/out/assemblyHub/hub.txt
- /public/groups/cgl/cat/primates_evan/out/trackHub//hub.txt

Source for text files is in:
  - `hub` has the source for assembly hub for all genomes
  - `trackHub` is the trackHub to use against native UCSC assemblies (rheMac10)

The hubs metadata files are copied to the live `hub/Makefile`.  Data files
must be manually linked:

    cd ..../assemblyHub/Rhesus/
    find . -type f -not -name '*.txt' | cpio -pduml ../../trackHub/rheMac10
