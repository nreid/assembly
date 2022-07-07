include { depth_cutoffs; self_align; purge_haplotigs; get_haplotigs } from '../modules/tasks_purge_dups.nf'


workflow purge_dups {

    take:
        paf
        assembly

    main:
        depth_cutoffs   ( paf )
        self_align      ( assembly )
        purge_haplotigs ( depth_cutoffs.out[0], depth_cutoffs.out[3], self_align.out )
        get_haplotigs   ( assembly, purge_haplotigs.out[0] )


}