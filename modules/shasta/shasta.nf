process shasta {

    publishDir "${params.outdir}/assembly_initial", mode:'copy', saveAs: {filename -> "Assembly.fasta"}
    cache 'lenient'

    input:
    path fasta
    val shasta_config_preset
    path shasta_config_file
    val shasta_opts

    output:
    path "assembly/Assembly.fasta"

    script:
    if(shasta_config_preset){
        """
        shasta \
        --input ${fasta}  \
        --threads ${task.cpus} \
        --assemblyDirectory assembly \
        --config ${shasta_config_preset} \
        ${shasta_opts}
        """
    } else {
        """
        shasta \
        --input ${fasta}  \
        --threads ${task.cpus} \
        --assemblyDirectory assembly \
        --config ${shasta_config_file} \
        ${shasta_opts}
        """
    }
}

