addi	$s0,$0,104
sw		$s0,4($0)
addi	$s0,$0,12
sw		$s0,8($0)
addi	$s0,$0,92
sw		$s0,12($0)
addi	$s0,$0,80
sw		$s0,16($0)
addi	$s0,$0,76
sw		$s0,20($0)
addi	$s0,$0,68
sw		$s0,24($0)
addi	$s0,$0,56
sw		$s0,28($0)
addi	$s0,$0,108
sw		$s0,32($0)
addi	$s0,$0,64
sw		$s0,36($0)
addi	$s0,$0,4
sw		$s0,40($0)
addi	$s0,$0,16
sw		$s0,44($0)
addi	$s0,$0,116
sw		$s0,48($0)
addi	$s0,$0,28
sw		$s0,52($0)
addi	$s0,$0,96
sw		$s0,56($0)
addi	$s0,$0,44
sw		$s0,60($0)
addi	$s0,$0,8
sw		$s0,64($0)
addi	$s0,$0,20
sw		$s0,68($0)
addi	$s0,$0,40
sw		$s0,72($0)
addi	$s0,$0,88
sw		$s0,76($0)
addi	$s0,$0,72
sw		$s0,80($0)
addi	$s0,$0,32
sw		$s0,84($0)
addi	$s0,$0,100
sw		$s0,88($0)
addi	$s0,$0,52
sw		$s0,92($0)
addi	$s0,$0,120
sw		$s0,96($0)
addi	$s0,$0,24
sw		$s0,100($0)
addi	$s0,$0,60
sw		$s0,104($0)
addi	$s0,$0,84
sw		$s0,108($0)
addi	$s0,$0,112
sw		$s0,112($0)
addi	$s0,$0,48
sw		$s0,116($0)
addi	$s0,$0,36
sw		$s0,120($0)

#--------------

addi	$1,$0,23333
addi	$2,$0,23333
addi	$3,$0,23333
addi	$4,$0,23333
addi	$5,$0,23333
addi	$6,$0,23333
addi	$7,$0,23333
addi	$8,$0,23333
addi	$9,$0,23333
addi	$10,$0,23333
addi	$11,$0,23333
addi	$12,$0,23333
addi	$13,$0,23333
addi	$14,$0,23333
addi	$15,$0,23333
addi	$16,$0,23333
addi	$17,$0,23333
addi	$18,$0,23333
addi	$19,$0,23333
addi	$20,$0,23333
addi	$21,$0,23333
addi	$22,$0,23333
addi	$23,$0,23333
addi	$24,$0,23333
addi	$25,$0,23333
addi	$26,$0,23333
addi	$27,$0,23333
addi	$28,$0,23333
addi	$29,$0,23333
addi	$30,$0,23333
addi	$31,$0,23333

addi	$t0,$0,8
addi	$t2,$0,-12288

#--------------

la		$t3,TAG_1
addi	$31,$0,28
jal		TAG_0
lw		$31,-12288($31)
addu	$31,$t0,$31
TAG_0:
jalr	$31,$t3
addi	$31,$31,4
addi	$31,$31,4
TAG_1:
lw		$31,-12288($31)
addu	$31,$t0,$31
la		$31,TAG_2
jalr	$t3,$31
lw		$31,-12288($31)
sw		$31,4096($31)
TAG_2:

la		$t3,TAG_4
addi	$31,$0,12
jal		TAG_3
addi	$31,$31,4
addi	$31,$31,4
TAG_3:
jalr	$31,$t3
lw		$31,-12288($31)
lw		$31,0($31)
TAG_4:
lw		$31,0($31)
addu	$31,$31,$t0
lw		$31,0($31)

la		$t3,TAG_6
addi	$31,$0,4
jal		TAG_5
addi	$31,$31,4
lw		$31,-12288($31)
TAG_5:
jalr	$31,$t3
sw		$31,-8192($31)
addu	$31,$t0,$31
TAG_6:
lw		$31,-12288($31)
addu	$31,$31,$t0
lw		$31,0($31)

la		$t3,TAG_8
addi	$31,$0,12
jal		TAG_7
addi	$31,$31,4
addi	$31,$31,4
TAG_7:
jalr	$31,$t3
addu	$31,$31,$t0
lw		$31,-12288($31)
TAG_8:
lw		$31,-12288($31)
addu	$31,$31,$t0
sw		$31,4096($31)

la		$t3,TAG_10
addi	$31,$0,4
jal		TAG_9
addi	$31,$31,4
addi	$31,$31,4
TAG_9:
jalr	$31,$t3
sw		$31,-8192($31)
addu	$31,$t0,$31
TAG_10:
lw		$31,-12288($31)
addu	$31,$31,$t0
sw		$31,4096($31)

la		$t3,TAG_12
addi	$31,$0,8
jal		TAG_11
lw		$31,-12288($31)
lw		$31,0($31)
TAG_11:
jalr	$31,$t3
addu	$31,$t0,$31
sw		$31,-8192($31)
TAG_12:
lw		$31,-12288($31)
addu	$31,$31,$t0
addu	$31,$t0,$31

la		$t3,TAG_14
addi	$31,$0,28
jal		TAG_13
sw		$31,-8192($31)
addi	$31,$31,4
TAG_13:
jalr	$31,$t3
addu	$31,$t0,$31
addu	$31,$t0,$31
TAG_14:
lw		$31,-12288($31)
addu	$31,$31,$t0
addu	$31,$t0,$31

la		$t3,TAG_16
addi	$31,$0,24
jal		TAG_15
lw		$31,-12288($31)
addi	$31,$31,4
TAG_15:
jalr	$31,$t3
addi	$31,$31,4
lw		$31,-12288($31)
TAG_16:
lw		$31,-12288($31)
addu	$31,$31,$t0
addu	$31,$31,$t0

la		$t3,TAG_18
addi	$31,$0,16
jal		TAG_17
lw		$31,-12288($31)
addi	$31,$31,4
TAG_17:
jalr	$31,$t3
addu	$31,$t0,$31
sw		$31,-8192($31)
TAG_18:
lw		$31,-12288($31)
addu	$31,$31,$t0
addu	$31,$31,$t0

la		$t3,TAG_20
addi	$31,$0,16
jal		TAG_19
sw		$31,-8192($31)
lw		$31,-12288($31)
TAG_19:
jalr	$31,$t3
addu	$31,$t0,$31
addu	$31,$t0,$31
TAG_20:
lw		$31,-12288($31)
addu	$31,$31,$t0
beq		$31,$31,TAG_21
addu	$31,$31,$t0
addu	$31,$31,$t0
TAG_21:

la		$t3,TAG_23
addi	$31,$0,20
jal		TAG_22
lw		$31,-12288($31)
addu	$31,$31,$t0
TAG_22:
jalr	$31,$t3
addi	$31,$31,4
lw		$31,-12288($31)
TAG_23:
lw		$31,-12288($31)
addu	$31,$31,$t0
beq		$31,$31,TAG_24
addi	$31,$31,4
lw		$31,0($31)
TAG_24:

la		$t3,TAG_26
addi	$31,$0,4
jal		TAG_25
addu	$31,$t0,$31
addi	$31,$31,4
TAG_25:
jalr	$31,$t3
sw		$31,-8192($31)
addi	$31,$31,4
TAG_26:
lw		$31,-12288($31)
addu	$31,$31,$t0
beq		$31,$0,TAG_27
sw		$31,4096($31)
lw		$31,0($31)
TAG_27:

la		$t3,TAG_29
addi	$31,$0,28
jal		TAG_28
addu	$31,$31,$t0
addu	$31,$31,$t0
TAG_28:
jalr	$31,$t3
lw		$31,-12288($31)
sw		$31,4096($31)
TAG_29:
lw		$31,0($31)
addu	$31,$31,$t0
beq		$31,$0,TAG_30
addu	$31,$t0,$31
lw		$31,0($31)
TAG_30:

la		$t3,TAG_32
addi	$31,$0,4
jal		TAG_31
sw		$31,-8192($31)
addi	$31,$31,4
TAG_31:
jalr	$31,$t3
addu	$31,$31,$t0
addi	$31,$31,4
TAG_32:
lw		$31,-12288($31)
addu	$31,$31,$t0
addi	$t1,$31,0
beq		$t1,$31,TAG_33
addi	$31,$31,4
addu	$31,$t0,$31
TAG_33:

la		$t3,TAG_35
addi	$31,$0,8
jal		TAG_34
addu	$31,$31,$t0
addi	$31,$31,4
TAG_34:
jalr	$31,$t3
addu	$31,$t0,$31
addu	$31,$31,$t0
TAG_35:
lw		$31,-12288($31)
addu	$31,$31,$t0
addi	$t1,$31,0
beq		$t1,$31,TAG_36
sw		$31,4096($31)
sw		$31,4096($31)
TAG_36:

la		$t3,TAG_38
addi	$31,$0,12
jal		TAG_37
addi	$31,$31,4
addu	$31,$t0,$31
TAG_37:
jalr	$31,$t3
addu	$31,$31,$t0
sw		$31,-8192($31)
TAG_38:
lw		$31,-12288($31)
addu	$31,$31,$t0
addi	$t1,$31,1
beq		$31,$t1,TAG_39
lw		$31,0($31)
addu	$31,$31,$t0
TAG_39:

la		$t3,TAG_41
addi	$31,$0,8
jal		TAG_40
addu	$31,$31,$t0
addi	$31,$31,4
TAG_40:
jalr	$31,$t3
addi	$31,$31,4
lw		$31,-12288($31)
TAG_41:
lw		$31,-12288($31)
addu	$31,$31,$t0
addi	$t1,$31,1
beq		$31,$t1,TAG_42
sw		$31,4096($31)
addu	$31,$31,$t0
TAG_42:

la		$t3,TAG_44
addi	$31,$0,28
jal		TAG_43
addu	$31,$31,$t0
sw		$31,-8192($31)
TAG_43:
jalr	$31,$t3
addu	$31,$31,$t0
lw		$31,-12288($31)
TAG_44:
lw		$31,-12288($31)
addu	$31,$31,$t0
addi	$31,$31,4

la		$t3,TAG_46
addi	$31,$0,0
jal		TAG_45
lw		$31,-12288($31)
addi	$31,$31,4
TAG_45:
jalr	$31,$t3
addi	$31,$31,4
addi	$31,$31,4
TAG_46:
lw		$31,-12288($31)
addu	$31,$31,$t0
addi	$31,$31,4

la		$t3,TAG_48
addi	$31,$0,8
jal		TAG_47
lw		$31,-12288($31)
addi	$31,$31,4
TAG_47:
jalr	$31,$t3
addi	$31,$31,4
addu	$31,$31,$t0
TAG_48:
lw		$31,-12288($31)
addu	$31,$31,$t0
la		$31,TAG_49
jr		$31
sw		$31,-8192($31)
lw		$31,-12288($31)
TAG_49:

la		$t3,TAG_51
addi	$31,$0,20
jal		TAG_50
lw		$31,-12288($31)
addu	$31,$31,$t0
TAG_50:
jalr	$31,$t3
addu	$31,$t0,$31
addi	$31,$31,4
TAG_51:
lw		$31,-12288($31)
addu	$31,$31,$t0
la		$31,TAG_52
jr		$31
addu	$31,$t0,$31
lw		$31,-12288($31)
TAG_52:

la		$t3,TAG_54
addi	$31,$0,4
jal		TAG_53
lw		$31,-12288($31)
sw		$31,4096($31)
TAG_53:
jalr	$31,$t3
lw		$31,-12288($31)
lw		$31,0($31)
TAG_54:
lw		$31,0($31)
addu	$31,$31,$t0
la		$31,TAG_55
jalr	$t3,$31
lw		$31,-12288($31)
addu	$31,$t0,$31
TAG_55:

la		$t3,TAG_57
addi	$31,$0,4
jal		TAG_56
addu	$31,$31,$t0
addu	$31,$31,$t0
TAG_56:
jalr	$31,$t3
addi	$31,$31,4
sw		$31,-8192($31)
TAG_57:
lw		$31,-12288($31)
addu	$31,$31,$t0
la		$31,TAG_58
jalr	$t3,$31
addi	$31,$31,4
addu	$31,$t0,$31
TAG_58:

la		$t3,TAG_60
addi	$31,$0,0
jal		TAG_59
addu	$31,$31,$t0
lw		$31,-12288($31)
TAG_59:
jalr	$31,$t3
addi	$31,$31,4
lw		$31,-12288($31)
TAG_60:
lw		$31,-12288($31)
addi	$31,$31,4
lw		$31,0($31)

la		$t3,TAG_62
addi	$31,$0,12
jal		TAG_61
lw		$31,-12288($31)
sw		$31,4096($31)
TAG_61:
jalr	$31,$t3
sw		$31,-8192($31)
lw		$31,-12288($31)
TAG_62:
lw		$31,-12288($31)
addi	$31,$31,4
lw		$31,0($31)

la		$t3,TAG_64
addi	$31,$0,28
jal		TAG_63
addi	$31,$31,4
addi	$31,$31,4
TAG_63:
jalr	$31,$t3
addi	$31,$31,4
addi	$31,$31,4
TAG_64:
lw		$31,-12288($31)
addi	$31,$31,4
sw		$31,4096($31)

la		$t3,TAG_66
addi	$31,$0,12
jal		TAG_65
addi	$31,$31,4
addu	$31,$31,$t0
TAG_65:
jalr	$31,$t3
addu	$31,$31,$t0
addu	$31,$t0,$31
TAG_66:
lw		$31,-12288($31)
addi	$31,$31,4
sw		$31,4096($31)

la		$t3,TAG_68
addi	$31,$0,0
jal		TAG_67
lw		$31,-12288($31)
sw		$31,4096($31)
TAG_67:
jalr	$31,$t3
addu	$31,$t0,$31
addu	$31,$t0,$31
TAG_68:
lw		$31,-12288($31)
addi	$31,$31,4
addu	$31,$t0,$31

la		$t3,TAG_70
addi	$31,$0,28
jal		TAG_69
addu	$31,$t0,$31
sw		$31,-8192($31)
TAG_69:
jalr	$31,$t3
lw		$31,-12288($31)
addi	$31,$31,4
TAG_70:
lw		$31,0($31)
addi	$31,$31,4
addu	$31,$t0,$31

la		$t3,TAG_72
addi	$31,$0,8
jal		TAG_71
sw		$31,-8192($31)
addu	$31,$t0,$31
TAG_71:
jalr	$31,$t3
addu	$31,$31,$t0
lw		$31,-12288($31)
TAG_72:
lw		$31,-12288($31)
addi	$31,$31,4
addu	$31,$31,$t0

la		$t3,TAG_74
addi	$31,$0,12
jal		TAG_73
addu	$31,$t0,$31
addi	$31,$31,4
TAG_73:
jalr	$31,$t3
sw		$31,-8192($31)
sw		$31,-8192($31)
TAG_74:
lw		$31,-12288($31)
addi	$31,$31,4
addu	$31,$31,$t0

la		$t3,TAG_76
addi	$31,$0,20
jal		TAG_75
addu	$31,$t0,$31
addi	$31,$31,4
TAG_75:
jalr	$31,$t3
lw		$31,-12288($31)
lw		$31,0($31)
TAG_76:
lw		$31,0($31)
addi	$31,$31,4
beq		$31,$31,TAG_77
lw		$31,0($31)
lw		$31,0($31)
TAG_77:

la		$t3,TAG_79
addi	$31,$0,8
jal		TAG_78
addu	$31,$31,$t0
addu	$31,$t0,$31
TAG_78:
jalr	$31,$t3
addu	$31,$t0,$31
lw		$31,-12288($31)
TAG_79:
lw		$31,-12288($31)
addi	$31,$31,4
beq		$31,$31,TAG_80
addu	$31,$t0,$31
addu	$31,$31,$t0
TAG_80:

la		$t3,TAG_82
addi	$31,$0,12
jal		TAG_81
addu	$31,$31,$t0
lw		$31,-12288($31)
TAG_81:
jalr	$31,$t3
sw		$31,-8192($31)
sw		$31,-8192($31)
TAG_82:
lw		$31,-12288($31)
addi	$31,$31,4
beq		$31,$0,TAG_83
addi	$31,$31,4
addu	$31,$t0,$31
TAG_83:

la		$t3,TAG_85
addi	$31,$0,16
jal		TAG_84
addi	$31,$31,4
addi	$31,$31,4
TAG_84:
jalr	$31,$t3
lw		$31,-12288($31)
addu	$31,$t0,$31
TAG_85:
lw		$31,0($31)
addi	$31,$31,4
beq		$31,$0,TAG_86
sw		$31,4096($31)
addu	$31,$31,$t0
TAG_86:

la		$t3,TAG_88
addi	$31,$0,16
jal		TAG_87
lw		$31,-12288($31)
sw		$31,4096($31)
TAG_87:
jalr	$31,$t3
lw		$31,-12288($31)
sw		$31,4096($31)
TAG_88:
lw		$31,0($31)
addi	$31,$31,4
addi	$t1,$31,0
beq		$t1,$31,TAG_89
addu	$31,$t0,$31
addu	$31,$31,$t0
TAG_89:

la		$t3,TAG_91
addi	$31,$0,28
jal		TAG_90
addu	$31,$t0,$31
addu	$31,$31,$t0
TAG_90:
jalr	$31,$t3
addi	$31,$31,4
lw		$31,-12288($31)
TAG_91:
lw		$31,-12288($31)
addi	$31,$31,4
addi	$t1,$31,0
beq		$t1,$31,TAG_92
addi	$31,$31,4
addi	$31,$31,4
TAG_92:

la		$t3,TAG_94
addi	$31,$0,0
jal		TAG_93
sw		$31,-8192($31)
lw		$31,-12288($31)
TAG_93:
jalr	$31,$t3
lw		$31,-12288($31)
sw		$31,4096($31)
TAG_94:
lw		$31,0($31)
addi	$31,$31,4
addi	$t1,$31,1
beq		$31,$t1,TAG_95
addu	$31,$t0,$31
lw		$31,0($31)
TAG_95:

la		$t3,TAG_97
addi	$31,$0,16
jal		TAG_96
lw		$31,-12288($31)
addu	$31,$t0,$31
TAG_96:
jalr	$31,$t3
lw		$31,-12288($31)
sw		$31,4096($31)
TAG_97:
lw		$31,0($31)
addi	$31,$31,4
addi	$t1,$31,1
beq		$31,$t1,TAG_98
addi	$31,$31,4
addu	$31,$t0,$31
TAG_98:

la		$t3,TAG_100
addi	$31,$0,4
jal		TAG_99
sw		$31,-8192($31)
lw		$31,-12288($31)
TAG_99:
jalr	$31,$t3
addu	$31,$t0,$31
addu	$31,$t0,$31
TAG_100:
lw		$31,-12288($31)
addi	$31,$31,4
addi	$31,$31,4

la		$t3,TAG_102
addi	$31,$0,28
jal		TAG_101
sw		$31,-8192($31)
lw		$31,-12288($31)
TAG_101:
jalr	$31,$t3
addi	$31,$31,4
addu	$31,$t0,$31
TAG_102:
lw		$31,-12288($31)
addi	$31,$31,4
addi	$31,$31,4

la		$t3,TAG_104
addi	$31,$0,12
jal		TAG_103
addu	$31,$t0,$31
addu	$31,$31,$t0
TAG_103:
jalr	$31,$t3
addu	$31,$t0,$31
sw		$31,-8192($31)
TAG_104:
lw		$31,-12288($31)
addi	$31,$31,4
la		$31,TAG_105
jr		$31
addu	$31,$31,$t0
addi	$31,$31,4
TAG_105:

la		$t3,TAG_107
addi	$31,$0,16
jal		TAG_106
lw		$31,-12288($31)
sw		$31,4096($31)
TAG_106:
jalr	$31,$t3
addi	$31,$31,4
sw		$31,-8192($31)
TAG_107:
lw		$31,-12288($31)
addi	$31,$31,4
la		$31,TAG_108
jr		$31
addu	$31,$t0,$31
addu	$31,$t0,$31
TAG_108:

la		$t3,TAG_110
addi	$31,$0,4
jal		TAG_109
sw		$31,-8192($31)
addu	$31,$t0,$31
TAG_109:
jalr	$31,$t3
sw		$31,-8192($31)
lw		$31,-12288($31)
TAG_110:
lw		$31,-12288($31)
addi	$31,$31,4
la		$31,TAG_111
jalr	$t3,$31
lw		$31,-12288($31)
sw		$31,4096($31)
TAG_111:

la		$t3,TAG_113
addi	$31,$0,0
jal		TAG_112
addi	$31,$31,4
addu	$31,$t0,$31
TAG_112:
jalr	$31,$t3
lw		$31,-12288($31)
sw		$31,4096($31)
TAG_113:
lw		$31,0($31)
addi	$31,$31,4
la		$31,TAG_114
jalr	$t3,$31
addu	$31,$t0,$31
addu	$31,$t0,$31
TAG_114:

la		$t3,TAG_116
addi	$31,$0,28
jal		TAG_115
addu	$31,$t0,$31
addu	$31,$t0,$31
TAG_115:
jalr	$31,$t3
addu	$31,$t0,$31
sw		$31,-8192($31)
TAG_116:
lw		$31,-12288($31)
jal		TAG_117
sw		$31,-8192($31)
lw		$31,-12288($31)
TAG_117:
lw		$31,-12288($31)

la		$t3,TAG_119
addi	$31,$0,0
jal		TAG_118
addi	$31,$31,4
addu	$31,$t0,$31
TAG_118:
jalr	$31,$t3
addu	$31,$31,$t0
addu	$31,$31,$t0
TAG_119:
lw		$31,-12288($31)
jal		TAG_120
addu	$31,$31,$t0
lw		$31,-12288($31)
TAG_120:
lw		$31,-12288($31)

la		$t3,TAG_122
addi	$31,$0,4
jal		TAG_121
lw		$31,-12288($31)
addu	$31,$31,$t0
TAG_121:
jalr	$31,$t3
addu	$31,$31,$t0
addu	$31,$31,$t0
TAG_122:
lw		$31,-12288($31)
jal		TAG_123
sw		$31,-8192($31)
sw		$31,-8192($31)
TAG_123:
sw		$31,-8192($31)

la		$t3,TAG_125
addi	$31,$0,8
jal		TAG_124
addi	$31,$31,4
addu	$31,$t0,$31
TAG_124:
jalr	$31,$t3
sw		$31,-8192($31)
lw		$31,-12288($31)
TAG_125:
lw		$31,-12288($31)
jal		TAG_126
addi	$31,$31,4
addi	$31,$31,4
TAG_126:
sw		$31,-8192($31)

la		$t3,TAG_128
addi	$31,$0,24
jal		TAG_127
addu	$31,$t0,$31
addu	$31,$t0,$31
TAG_127:
jalr	$31,$t3
lw		$31,-12288($31)
addu	$31,$t0,$31
TAG_128:
lw		$31,0($31)
jal		TAG_129
addi	$31,$31,4
addu	$31,$t0,$31
TAG_129:
addu	$31,$t0,$31

la		$t3,TAG_131
addi	$31,$0,12
jal		TAG_130
addi	$31,$31,4
sw		$31,-8192($31)
TAG_130:
jalr	$31,$t3
sw		$31,-8192($31)
addu	$31,$t0,$31
TAG_131:
lw		$31,-12288($31)
jal		TAG_132
lw		$31,-12288($31)
sw		$31,4096($31)
TAG_132:
addu	$31,$t0,$31

la		$t3,TAG_134
addi	$31,$0,20
jal		TAG_133
addi	$31,$31,4
addu	$31,$t0,$31
TAG_133:
jalr	$31,$t3
lw		$31,-12288($31)
addu	$31,$31,$t0
TAG_134:
lw		$31,0($31)
jal		TAG_135
sw		$31,-8192($31)
addu	$31,$31,$t0
TAG_135:
addu	$31,$31,$t0

la		$t3,TAG_137
addi	$31,$0,16
jal		TAG_136
lw		$31,-12288($31)
addu	$31,$t0,$31
TAG_136:
jalr	$31,$t3
addu	$31,$31,$t0
addu	$31,$31,$t0
TAG_137:
lw		$31,-12288($31)
jal		TAG_138
addu	$31,$31,$t0
addu	$31,$31,$t0
TAG_138:
addu	$31,$31,$t0

la		$t3,TAG_140
addi	$31,$0,12
jal		TAG_139
lw		$31,-12288($31)
addu	$31,$t0,$31
TAG_139:
jalr	$31,$t3
addu	$31,$31,$t0
sw		$31,-8192($31)
TAG_140:
lw		$31,-12288($31)
jal		TAG_141
lw		$31,-12288($31)
addi	$31,$31,4
TAG_141:
beq		$31,$31,TAG_142
addi	$31,$31,4
addu	$31,$t0,$31
TAG_142:

la		$t3,TAG_144
addi	$31,$0,12
jal		TAG_143
lw		$31,-12288($31)
addu	$31,$31,$t0
TAG_143:
jalr	$31,$t3
addu	$31,$31,$t0
lw		$31,-12288($31)
TAG_144:
lw		$31,-12288($31)
jal		TAG_145
addi	$31,$31,4
addi	$31,$31,4
TAG_145:
beq		$31,$31,TAG_146
sw		$31,-8192($31)
sw		$31,-8192($31)
TAG_146:

la		$t3,TAG_148
addi	$31,$0,20
jal		TAG_147
lw		$31,-12288($31)
lw		$31,0($31)
TAG_147:
jalr	$31,$t3
lw		$31,-12288($31)
lw		$31,0($31)
TAG_148:
lw		$31,0($31)
jal		TAG_149
addu	$31,$t0,$31
addu	$31,$31,$t0
TAG_149:
beq		$31,$0,TAG_150
addu	$31,$31,$t0
sw		$31,-8192($31)
TAG_150:

la		$t3,TAG_152
addi	$31,$0,8
jal		TAG_151
lw		$31,-12288($31)
sw		$31,4096($31)
TAG_151:
jalr	$31,$t3
addu	$31,$31,$t0
addu	$31,$31,$t0
TAG_152:
lw		$31,-12288($31)
jal		TAG_153
addu	$31,$31,$t0
sw		$31,-8192($31)
TAG_153:
beq		$31,$0,TAG_154
sw		$31,-8192($31)
lw		$31,-12288($31)
TAG_154:

la		$t3,TAG_156
addi	$31,$0,0
jal		TAG_155
addi	$31,$31,4
lw		$31,-12288($31)
TAG_155:
jalr	$31,$t3
sw		$31,-8192($31)
addi	$31,$31,4
TAG_156:
lw		$31,-12288($31)
jal		TAG_157
sw		$31,-8192($31)
lw		$31,-12288($31)
TAG_157:
addi	$t1,$31,0
beq		$t1,$31,TAG_158
lw		$31,-12288($31)
lw		$31,0($31)
TAG_158:

la		$t3,TAG_160
addi	$31,$0,28
jal		TAG_159
addu	$31,$t0,$31
lw		$31,-12288($31)
TAG_159:
jalr	$31,$t3
lw		$31,-12288($31)
addu	$31,$31,$t0
TAG_160:
lw		$31,0($31)
jal		TAG_161
addu	$31,$31,$t0
addu	$31,$t0,$31
TAG_161:
addi	$t1,$31,0
beq		$t1,$31,TAG_162
lw		$31,-12288($31)
addi	$31,$31,4
TAG_162:

#--------------

addi	$t0,$0,2222
sw		$t0,2048($0)
addi	$t0,$0,3333
sw		$t0,2052($0)
addi	$t0,$0,4444
sw		$t0,2056($0)