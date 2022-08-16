process get_haplotigs {

    publishDir "${params.outdir}/purge_dups", mode:'copy'
    cache 'lenient'
    label 'purge'

    input:
    path assembly
    path dups

    output:
    path "purged.fa"
    path "hap.fa"

    script:
    """
    get_seqs -e ${dups} ${assembly}
    """

}

