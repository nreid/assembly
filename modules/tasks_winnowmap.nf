process meryl_count {

    cache 'lenient'

    input:
    path assembly

    output:
    path "merylDB"

    script:
    """
    meryl count threads=${task.cpus} k=${kmer} ${assembly} output merylDB
    """

}

process meryl_print {

    cache 'lenient'

    input:
    path merylDB

    output:
    path "repetitive_k${kmer}.txt"

    script:
    """
    meryl print greater-than distinct=0.9998 ${merylDB} > repetitive_k${kmer}.txt
    """

}

process winnowmap {

    cache 'lenient'

    input:
    path assembly
    path fastq
    path "repetitive_k${kmer}.txt"

    output:
    path "mapped_reads.sam"


    \\ obviously needs to be changed once we have the module

    script:
    """
    /home/FCAM/mneitzey/Winnowmap/bin/winnowmap -W repetitive_k${kmer}.txt -ax map-ont $assembly $fastq > mapped_reads.sam
    """

}

process sortbam {

    cache 'lenient'

    input:
    path sam

    output:
    path "mapped_reads.sorted.bam"

    script:
    """
    samtools sort -@ ${task.cpus} -T minimap -O BAM ${sam} > mapped_reads.sorted.bam
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
