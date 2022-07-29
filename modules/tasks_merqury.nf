process merqury {

    cache 'lenient'

    input:
    path kmerdb
    path assembly

    output:
    path "merqury_output.completeness.stats"
    path "merqury_output.qv"

    script:
    """
    merqury.sh ${kmerdb} ${assembly} meryl_output
    """

}
