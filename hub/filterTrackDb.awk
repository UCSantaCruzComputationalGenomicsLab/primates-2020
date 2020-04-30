##
# Edit trackDb files to make track hub from assembly hub.
# varibles to pass:
#   srcAsm - assembly name in source
##
BEGIN {
    discard = 0
}

# skipping cactus
discard && /"^track "/ {
    # in new section
    discard = 0
}
/^track hubCentral/ || /^track cactus/ {
    discard = 1
}
discard {
    next
}

$1 == "bigDataUrl" {
    $2 = "../../assemblyHub/" srcAsm "/" $2
}

{
    print
}
