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