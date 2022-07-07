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



