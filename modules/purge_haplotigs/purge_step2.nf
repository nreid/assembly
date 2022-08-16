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
