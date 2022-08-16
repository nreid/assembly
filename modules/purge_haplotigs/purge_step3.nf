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
