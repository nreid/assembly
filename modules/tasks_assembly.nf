 /* 
 * pipeline processes
 */
 

process shasta {

    publishDir "${params.outdir}/assembly_initial", mode:'copy'
    cache 'lenient'

    input:
    path fasta

    output:
    path "assembly"

    script:
    """
    shasta \
    --input ${fasta}  \
    --assemblyDirectory assembly \
    --Reads.minReadLength 500 \
    --memoryMode anonymous \
    --memoryBacking 4K \
    --threads 36 \
    --Assembly.detangleMethod 1
    """
}

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
    -d ${assembly_initial}/Assembly.fasta \
    -o assembly_polished \
    -t ${task.cpus} \
    -m ${medaka_model}
    """

}

process busco_initial {

    publishDir "${params.outdir}", mode:'copy'
    label 'busco'
    cache 'lenient'

    input:
    path assembly_initial
    val augustus_config
    val busco_db
    
    output:
    path "busco_initial/*txt"

    script:
    """
    export AUGUSTUS_CONFIG_PATH=config
    cp -r ${augustus_config} config
    echo \$AUGUSTUS_CONFIG_PATH

    busco \
	-i ${assembly_initial}/Assembly.fasta \
	-o busco_initial \
	-l ${busco_db} \
	-c ${task.cpus} \
    -m genome
    """

}

process busco_polished {

    publishDir "${params.outdir}", mode:'copy'
    label 'busco'
    cache 'lenient'

    input:
    path assembly_polished
    val augustus_config
    val busco_db
    
    output:
    path "busco_polished/*txt"

    script:
    """
    export AUGUSTUS_CONFIG_PATH=config
    cp -r ${augustus_config} config
    echo \$AUGUSTUS_CONFIG_PATH

    busco \
	-i consensus.fasta \
	-o busco_polished \
	-l ${busco_db} \
    -c ${task.cpus} \
	-m genome
    """

}

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

