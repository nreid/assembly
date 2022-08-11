process medaka_polish {

    publishDir "${params.outdir}", mode:'copy'
    cache 'lenient'

    input:
    path assembly_initial
    path fasta
    val medaka_model

    output:
    path "assembly_polished/consensus.fasta"

    script:
    """
    medaka_consensus \
    -i ${fasta} \
    -d ${assembly_initial} \
    -o assembly_polished \
    -t ${task.cpus} \
    -m ${medaka_model}
    """

}
