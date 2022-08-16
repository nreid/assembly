process repeatmasker_mask_taxon {

    publishDir "${params.outdir}/RepeatMasker", mode:'copy'
    cache 'lenient'

    input:
    path assembly
    val taxon
    
    output:
    path "taxon"
    path "taxon/*masked"

    script:
    """
    RepeatMasker -pa ${task.cpus} -e ncbi -dir taxon -gff -u -species ${taxon} ${assembly}
    """

}