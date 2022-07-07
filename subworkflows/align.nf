include { align_minimap; sortbam; indexbam; sam2paf } from '../modules/tasks_align.nf'

workflow align {
    take:
        fastq
        assembly  
    main:
        align_minimap(fastq, assembly)
        sam2paf(align_minimap.out)
        sortbam(align_minimap.out)
        indexbam(sortbam.out)
    emit:
        sam2paf.out
        indexbam.out
}

