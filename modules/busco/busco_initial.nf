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
