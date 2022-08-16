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
