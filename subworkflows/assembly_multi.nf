include { shasta;  } from '../modules/tasks_assembly.nf'
include { flye;    } from '../modules/tasks_assembly.nf'
include { canu;    } from '../modules/tasks_assembly.nf'
include { masurca; } from '../modules/tasks_assembly.nf'
include { wengan;  } from '../modules/tasks_assembly.nf'

workflow assemble {

    take:
        assemblers
        ontfastq
        illfastq
        opts

    main:

        if ( assemblers.contains('shasta') ){
        
            println "assembling with shasta!"
            // this will ultimately look like this:
                // shasta( fasta, params.shasta_opts )
                // shasta_ch = shasta.out
            shasta_ch = Channel.of("shasta.fasta")

        } else { shasta_ch = Channel.empty() }

        if ( assemblers.contains('flye') ){
        
            println "assembling with flye!"
            flye_ch = Channel.of("flye.fasta")

        } else { flye_ch = Channel.empty() }

        if ( assemblers.contains('canu') ){
        
            println "assembling with canu!"
            canu_ch = Channel.of("canu.fasta")

        } else { canu_ch = Channel.empty() }

        if ( assemblers.contains('masurca') ){
        
            println "assembling with masurca!"
            masurca_ch = Channel.of("masurca.fasta")

        } else { masurca_ch = Channel.empty() }

        if ( assemblers.contains('wengan') ){
        
            println "assembling with wengan!"
            wengan_ch = Channel.of("wengan.fasta")

        } else { wengan_ch = Channel.empty() }

        // concatenate assembler channels for downstream analysis steps
        assembly_ch = shasta_ch.concat( flye_ch, canu_ch, masurca_ch, wengan_ch )


    emit:
        assembly_ch

}