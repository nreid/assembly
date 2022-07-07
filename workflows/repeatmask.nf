include { repeatmodeler_db;         } from '../modules/tasks_repeats.nf'
include { repeatmodeler_model       } from '../modules/tasks_repeats.nf'
include { repeatmasker_mask_denovo; } from '../modules/tasks_repeats.nf'

workflow repeatmask {
    take:
        assembly
    main:
        repeatmodeler_db         (  assembly )
        repeatmodeler_model      (  repeatmodeler_db.out )
        repeatmasker_mask_denovo (  assembly, repeatmodeler_model.out[1] )

}

// reorganize repeat-masking. denovo model on genome hard-masked with known repeats?