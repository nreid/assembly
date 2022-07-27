include { meryl_count; meryl_print; winnowmap; sortbam; indexbam } from '../modules/tasks_winnowmap.nf'

workflow winnowmap {
    take:
        fastq
        assembly  
    main:
	meryl_count(assembly)
	meryl_print
	winnowmap(assembly, fastq)
        sortbam(align_minimap.out)
        indexbam(sortbam.out)
    emit:
        sortbam.out
        indexbam.out
}

