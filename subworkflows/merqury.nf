include { merqury } from '../modules/tasks_merqury.nf'

workflow winnowmap {
    take:
        kmerdb
        assembly  
    main:
	merqury(kmerdb, assembly)
    emit:
        merqury.out
}

