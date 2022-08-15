process nanoplot {

    publishDir "${params.outdir}/nanoplot", mode:'copy'
    cache 'lenient'

    input:
    path fastq

    output:
    path "nanoplot_out", emit: results

    script:
    """
    NanoPlot --fastq ${fastq} \
        --loglength \
        -o nanoplot_out \
        -t ${task.cpus}
    """

}
