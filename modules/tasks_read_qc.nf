process centrifuge {

    publishDir "${params.outdir}/centrifuge", mode:'copy'
    cache 'lenient'

    input:
    path fasta
    val centrifugedb

    output:
    path "*.tsv"

    script:
    """
    centrifuge \
        -q \
        -x ${centrifugedb} \
        --report-file centrifuge_report.tsv \
        --quiet \
        --threads ${task.cpus} \
        --min-hitlen 1000 \
        -U $fasta \
    >centrifuge_classifications.tsv
    """

}


process nanoplot {

    publishDir "${params.outdir}/nanoplot", mode:'copy'
    cache 'lenient'

    input:
    path fastq

    output:
    path "nanoplot_out"

    script:
    """
    NanoPlot --fastq ${fastq} \
        --loglength \
        -o nanoplot_out \
        -t ${task.cpus}
    """

}
