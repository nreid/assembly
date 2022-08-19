process fastq2fasta {

    cache 'lenient'

    input:
    path fastq

    output:
    path "sequences.fasta"

    script:
    """
    bioawk -c fastx '{print ">"\$name"\\n"\$seq}' ${fastq} >sequences.fasta
    """
}

