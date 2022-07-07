process repeatmodeler_db {

    cache 'lenient'

    input:
    path assembly_polished
    
    output:
    path "rep_db*"

    script:
    """
    BuildDatabase -name "rep_db" -engine ncbi consensus.fasta
    """

}

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

process repeatmasker_process_repeats {

    publishDir "${params.outdir}/RepeatMasker", mode:'copy'
    cache 'lenient'

    input:
    path denovoreps
    path taxonreps
    
    // output:
    // path "dunno_yet.txt"

    script:
    """
    cat ${denovoreps}/*cat* ${taxonreps}/*cat* >all.cat
    ProcessRepeats -nolow -gff all.cat
    """

}
