process quast_polished {

    publishDir "${params.outdir}", mode:'copy'
    label 'quast'
    cache 'lenient'

    input:
    path assembly_polished
    
    output:
    path "quast_polished"

    script:
    """
    quast.py consensus.fasta \
    --threads ${task.cpus} \
    -o quast_polished
    """

}
