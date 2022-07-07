process purge_haplotigs_step1 {

    cache 'lenient'
    label 'purge'

    input:
    path assembly
    tuple path(bam), path(bai)

    output:
    path "*.gencov"
    path "*png"

    script:
    """
    purge_haplotigs readhist -b ${bam} -g ${assembly} -t 4
    """
}

process purge_haplotigs_step2 {

    cache 'lenient'
    label 'purge'

    input:
    path gencov
    val lowerbound
    val cutoff
    val upperbound

    output:
    path "coverage_stats.csv"

    script:
    """
    purge_haplotigs  contigcov  -i ${gencov}  -l ${lowerbound}  -m ${cutoff}  -h ${upperbound}
    """
}

process purge_haplotigs_step3 {

    publishDir "${params.outdir}/purge_haplotigs", mode:'copy'
    cache 'lenient'
    label 'purge'

    input:
    path assembly
    path coverage_stats

    output:
    path 'curated.fasta'
    path 'curated.haplotigs.fasta'
    path 'curated.artefacts.fasta'
    path 'curated.reassignments.tsv'
    path 'curated.contig_associations.log'

    script:
    """
    purge_haplotigs  purge  -g ${assembly}  -c ${coverage_stats}
    """
}
