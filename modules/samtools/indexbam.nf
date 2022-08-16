process indexbam {

    publishDir "${params.outdir}/mapping", mode:'copy'
    cache 'lenient'

    input:
    path bam

    output:
    tuple path("${bam}"), path("${bam}.bai")
    
    script:
    """
    samtools index ${bam}
    """

}
