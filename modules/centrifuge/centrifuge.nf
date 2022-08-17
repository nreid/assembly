process centrifuge {

    publishDir "${params.outdir}/centrifuge", mode:'copy', pattern: '*.tsv'
    cache 'lenient'

    input:
    path fastq
    val centrifugedb

    output:
    path "centrifuge_classifications.tsv" , emit: classifications
    path "centrifuge_report.tsv"          , emit: report
    path "keep.txt"                       , emit: sequencelist
    env  PERCENT                          , emit: percentretained

    script:
    """
    centrifuge \
        -q \
        -x ${centrifugedb} \
        --report-file centrifuge_report.tsv \
        --quiet \
        --threads ${task.cpus} \
        --min-hitlen 1000 \
        -U ${fastq} \
    >centrifuge_classifications.tsv

    grep "unclassified" centrifuge_classifications.tsv | cut -f 1 >keep.txt 

    TOTAL=\$(expr \$(wc -l centrifuge_classifications.tsv | cut -f 1 -d ' ') - 1)
    KEPT=\$(wc -l keep.txt | cut -f 1 -d ' ')
    PERCENT=\$(awk -v "t=\$TOTAL" -v "k=\$KEPT" '{print (t/k) * 100 }' <(echo "  "))
    """

}
