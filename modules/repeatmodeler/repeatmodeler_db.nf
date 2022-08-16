process repeatmodeler_db {

    cache 'lenient'

    input:
    path assembly_polished
    
    output:
    path "rep_db*"

    script:
    """
    BuildDatabase -name "rep_db" -engine ncbi consensus.fasta
    """

}
