 /* 
 * pipeline processes
 */
 

process shasta {

    publishDir "${params.outdir}/assembly_initial", mode:'copy'
    cache 'lenient'

    input:
    path fasta

    output:
    path "assembly/Assembly.fasta"

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



