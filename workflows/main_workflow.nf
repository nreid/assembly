include { assembly; } from '../subworkflows/assembly_multi.nf'

workflow main_workflow {

    // concatenate assembler list
    assemblers = params.ont_assemblers + "," + params.hyb_assemblers

    // create map of assembler options
    assemble_opts = [
                    shasta:  params.shasta_opts,
                    flye:    params.flye_opts,
                    canu:    params.canu_opts,
                    masurca: params.masurca_opts,
                    wengan:  params.wengan_opts
                    ]

    assemble(assemblers, ONT, ILL, assemble_opts)

}
