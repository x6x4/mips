#  big-endian
#
#  copy $9 to mem
#
#  regs:
#  $9 - 4-byte int
#  $8 - first byte of tape buf

		.text
		.globl main

main:
		#  put data in $9
		lui $9, 0x1234
		ori $9, 0x5678

		#  set base reg
		lui $8, 0x1000

		#  store $9 piecemeal
		sb  $9, 3($8)
		srl $9, $9, 8

		sb  $9, 2($8)
        srl $9, $9, 8

		sb  $9, 1($8)
        srl $9, $9, 8

        sb  $9, 0($8)

		.data
tape:
		.space	1024    #  buf size

#  thy end

