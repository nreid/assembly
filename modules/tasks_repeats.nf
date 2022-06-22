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

process repeatmodeler_model {

    publishDir "${params.outdir}/RepeatModeler", mode:'copy'
    cache 'lenient'

    input:
    path rep_db
    
    output:
    path "RM*"
    path "rep_db-families.fa"
    path "rep_db-families.stk"
    
    script:
    """
    RepeatModeler -engine ncbi -pa ${task.cpus} -database rep_db
    """

}

process repeatmasker_mask {

    publishDir "${params.outdir}/RepeatMasker", mode:'copy'
    cache 'lenient'

    input:
    path assembly
    path replib
    
    output:
    path "*.tbl"
    path "*.cat.gz"
    path "*.masked"
    path "*.fna.out"
    path "*.gff"

    script:
    """
    RepeatMasker -pa 8 -e ncbi -dir . -gff -xsmall -nolow -u -lib ${replib} ${assembly}
    """

}


