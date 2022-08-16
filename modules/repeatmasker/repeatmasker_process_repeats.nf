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
