process depth_cutoffs {

    cache 'lenient'
    label 'purge'

    input:
    path paf

    output:
    path "*cov"
    path "*stat"
    path "*log"
    path "cutoffs"

    script:
    """
    pbcstat ${paf}
    calcuts PB.stat > cutoffs 2>calcuts.log
    """
}
