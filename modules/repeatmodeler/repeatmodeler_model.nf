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