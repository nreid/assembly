include { purge_haplotigs_step1; purge_haplotigs_step2; purge_haplotigs_step3 } from '../modules/tasks_purge_haplotigs.nf'

workflow purge_haplotigs {

    take:
        assembly
        bam // bam and bai tuple
        purge
        lowerbound
        cutoff
        upperbound

    main:
        purge_haplotigs_step1( assembly, bam )

        if(purge){
            purge_haplotigs_step2 ( purge_haplotigs_step1.out[0], lowerbound, cutoff, upperbound )
            purge_haplotigs_step3 ( assembly, purge_haplotigs_step2.out )
        }


}