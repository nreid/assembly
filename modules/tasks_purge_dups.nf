process depth_cutoffs {

    cache 'lenient'
    label 'purge'

    input:
    path paf

    output:
    path "*cov"
    path "*stat"
    path "*log"
    path "cutoffs"

    script:
    """
    pbcstat ${paf}
    calcuts PB.stat > cutoffs 2>calcuts.log
    """
}

process self_align {

    cache 'lenient'
    label 'purge'

    input:
    path assembly

    output:
    path "${assembly}.split.self.paf.gz"

    script:
    """
    split_fa ${assembly} >${assembly}.split
    minimap2 -x asm5 -DP ${assembly}.split ${assembly}.split | gzip > ${assembly}.split.self.paf.gz
    """

}


process purge_haplotigs {

    cache 'lenient'
    label 'purge'

    input:
    path basecov // PB.base.cov
    path cutoffs // cutoffs
    path selfmap

    output:
    path "dups.bed"
    path "purge_dups.log"

    script:
    """
    purge_dups -2 -T ${cutoffs} -c ${basecov} ${selfmap} > dups.bed 2> purge_dups.log
    """

}


process get_haplotigs {

    publishDir "${params.outdir}/purge_dups", mode:'copy'
    cache 'lenient'
    label 'purge'

    input:
    path assembly
    path dups

    output:
    path "purged.fa"
    path "hap.fa"

    script:
    """
    get_seqs -e ${dups} ${assembly}
    """

}

