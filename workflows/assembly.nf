include { centrifuge;       } from '../modules/tasks_read_qc.nf'
include { nanoplot;         } from '../modules/tasks_read_qc.nf'
include { shasta;           } from '../modules/tasks_assembly.nf'
include { medaka_polish;    } from '../modules/tasks_assembly.nf'
include { busco_initial;    } from '../modules/tasks_assembly.nf'
include { busco_polished;   } from '../modules/tasks_assembly.nf'
include { quast_polished;   } from '../modules/tasks_assembly.nf'


workflow assembly {
    take:
        fasta
        medaka_model
        augustus_config
        busco_db

    main:
        shasta         ( fasta )
        medaka_polish  ( shasta.out, fasta, medaka_model )
        busco_initial  ( shasta.out, augustus_config, busco_db )
        busco_polished ( medaka_polish.out, augustus_config, busco_db )
        quast_polished ( medaka_polish.out )

    emit:
        assembly = medaka_polish.out
}
