process centrifuge_filter {

    cache 'lenient'

    input:
    path fastq
    path sequencenames

    output:
    path "filtered.fastq", emit: fastq

    script:
    """
    seqtk subseq ${fastq} ${sequencenames} >filtered.fastq
    """

}

