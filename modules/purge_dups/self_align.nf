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