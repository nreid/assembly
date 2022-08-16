process sam2paf {

    publishDir "${params.outdir}/mapping", mode:'copy'
    cache 'lenient'

    input:
    path sam

    output:
    path "minimap.paf"

    script:
    """
    paftools.js sam2paf ${sam} >minimap.paf
    """

}