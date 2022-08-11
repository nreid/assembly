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
	-i ${assembly_initial} \
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
