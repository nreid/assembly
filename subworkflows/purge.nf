include { align           } from '../subworkflows/align.nf'
include { purge_dups      } from '../subworkflows/purge_dups.nf'
include { purge_haplotigs } from '../subworkflows/purge_haplotigs.nf'


workflow purge {
    take:
        fastq
        assembly
        purgeTF
        lowerbound
        cutoff
        upperbound
    
    main:
        align           ( fastq, assembly )
        purge_dups      ( align.out[0], assembly )
        purge_haplotigs ( assembly, align.out[1], purgeTF, lowerbound, cutoff, upperbound ) 
    
}