process sortbam {

    cache 'lenient'

    input:
    path sam

    output:
    path "minimap.bam"

    script:
    """
    samtools sort -@ ${task.cpus} -T minimap -O BAM ${sam} >minimap.bam
    """

}
