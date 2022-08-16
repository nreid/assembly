process purge_haplotigs {

    cache 'lenient'
    label 'purge'

    input:
    path basecov // PB.base.cov
    path cutoffs // cutoffs
    path selfmap

    output:
    path "dups.bed"
    path "purge_dups.log"

    script:
    """
    purge_dups -2 -T ${cutoffs} -c ${basecov} ${selfmap} > dups.bed 2> purge_dups.log
    """

}

