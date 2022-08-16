process align_minimap {

    cache 'lenient'

    input:
    path fastq
    path assembly

    output:
    path "minimap.sam"

    script:
    """
    minimap2 -ax map-ont --MD -t ${task.cpus} ${assembly} ${fastq} >minimap.sam
    """

}