process repeatmasker_mask_denovo {

    publishDir "${params.outdir}/RepeatMasker", mode:'copy'
    cache 'lenient'

    input:
    path assembly
    path replib
    
    output:
    path "denovo"

    script:
    """
    RepeatMasker -pa ${task.cpus} -e ncbi -dir denovo -gff -xsmall -nolow -u -lib ${replib} ${assembly}
    """

}
