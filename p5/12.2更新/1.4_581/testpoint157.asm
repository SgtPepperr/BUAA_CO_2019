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
addi	$31,$0,8
jal		TAG_0
addu	$0,$31,$t0
lw		$31,-12288($31)
TAG_0:
jalr	$0,$t3
lw		$31,-12288($31)
addu	$0,$31,$t0
TAG_1:
addi	$0,$31,4
addi	$t1,$31,1
beq		$31,$t1,TAG_2
addu	$0,$31,$t0
lw		$31,0($31)
TAG_2:

la		$t3,TAG_4
addi	$31,$0,4
jal		TAG_3
sw		$31,-8192($31)
addu	$31,$t0,$31
TAG_3:
jalr	$0,$t3
lw		$0,-12288($31)
sw		$31,-8192($31)
TAG_4:
addi	$0,$31,-12288
addi	$31,$31,4

la		$t3,TAG_6
addi	$31,$0,16
jal		TAG_5
lw		$31,-12288($31)
lw		$0,0($31)
TAG_5:
jalr	$0,$t3
addu	$31,$t0,$31
sw		$31,4096($31)
TAG_6:
addi	$0,$31,4
addi	$31,$31,4

la		$t3,TAG_8
addi	$31,$0,12
jal		TAG_7
lw		$0,-12288($31)
lw		$31,-12288($31)
TAG_7:
jalr	$0,$t3
lw		$0,-12288($31)
sw		$31,-8192($31)
TAG_8:
addi	$0,$31,-12288
la		$31,TAG_9
jr		$31
addu	$31,$t0,$31
addu	$31,$t0,$31
TAG_9:

la		$t3,TAG_11
addi	$31,$0,20
jal		TAG_10
sw		$31,-8192($31)
addu	$0,$31,$t0
TAG_10:
jalr	$0,$t3
addu	$31,$t0,$31
lw		$0,-12288($31)
TAG_11:
addi	$0,$31,-12288
la		$31,TAG_12
jr		$31
lw		$31,-12288($31)
addu	$31,$t0,$31
TAG_12:

la		$t3,TAG_14
addi	$31,$0,16
jal		TAG_13
addu	$0,$31,$t0
sw		$31,-8192($31)
TAG_13:
jalr	$0,$t3
addu	$0,$31,$t0
addu	$0,$31,$t0
TAG_14:
addi	$0,$31,-12288
la		$31,TAG_15
jalr	$t3,$31
addu	$0,$31,$t0
addu	$0,$31,$t0
TAG_15:

la		$t3,TAG_17
addi	$31,$0,12
jal		TAG_16
addu	$31,$t0,$31
addu	$0,$31,$t0
TAG_16:
jalr	$0,$t3
lw		$31,-12288($31)
sw		$31,4096($31)
TAG_17:
addi	$0,$31,4
la		$31,TAG_18
jalr	$t3,$31
lw		$31,-12288($31)
sw		$31,4096($31)
TAG_18:

la		$t3,TAG_20
addi	$31,$0,16
jal		TAG_19
lw		$31,-12288($31)
addu	$0,$31,$t0
TAG_19:
jalr	$0,$t3
lw		$31,0($31)
addu	$31,$t0,$31
TAG_20:
jal		TAG_21
addu	$31,$t0,$31
sw		$31,-8192($31)
TAG_21:
lw		$31,-12288($31)

la		$t3,TAG_23
addi	$31,$0,16
jal		TAG_22
addu	$31,$t0,$31
addu	$31,$t0,$31
TAG_22:
jalr	$0,$t3
sw		$31,-8192($31)
lw		$0,-12288($31)
TAG_23:
jal		TAG_24
sw		$31,-8192($31)
lw		$31,-12288($31)
TAG_24:
lw		$31,-12288($31)

la		$t3,TAG_26
addi	$31,$0,20
jal		TAG_25
lw		$31,-12288($31)
sw		$31,4096($31)
TAG_25:
jalr	$0,$t3
addu	$0,$31,$t0
sw		$31,4096($31)
TAG_26:
jal		TAG_27
addu	$31,$t0,$31
lw		$0,-12288($31)
TAG_27:
sw		$31,-8192($31)

la		$t3,TAG_29
addi	$31,$0,24
jal		TAG_28
addu	$0,$31,$t0
addu	$31,$t0,$31
TAG_28:
jalr	$0,$t3
addu	$0,$31,$t0
addu	$0,$31,$t0
TAG_29:
jal		TAG_30
lw		$31,-12288($31)
sw		$31,4096($31)
TAG_30:
sw		$31,4096($31)

la		$t3,TAG_32
addi	$31,$0,20
jal		TAG_31
addu	$31,$t0,$31
lw		$31,-12288($31)
TAG_31:
jalr	$0,$t3
addu	$0,$31,$t0
lw		$31,-12288($31)
TAG_32:
jal		TAG_33
addu	$0,$31,$t0
addu	$0,$31,$t0
TAG_33:
addu	$31,$t0,$31

la		$t3,TAG_35
addi	$31,$0,24
jal		TAG_34
sw		$31,-8192($31)
addu	$0,$31,$t0
TAG_34:
jalr	$0,$t3
addu	$0,$31,$t0
addu	$31,$t0,$31
TAG_35:
jal		TAG_36
lw		$31,-12288($31)
sw		$31,4096($31)
TAG_36:
addu	$31,$t0,$31

la		$t3,TAG_38
addi	$31,$0,28
jal		TAG_37
addu	$31,$t0,$31
addu	$31,$t0,$31
TAG_37:
jalr	$0,$t3
addu	$0,$31,$t0
lw		$0,-12288($31)
TAG_38:
jal		TAG_39
lw		$31,-12288($31)
lw		$31,0($31)
TAG_39:
addu	$31,$31,$t0

la		$t3,TAG_41
addi	$31,$0,24
jal		TAG_40
addu	$0,$31,$t0
addu	$31,$t0,$31
TAG_40:
jalr	$0,$t3
addu	$0,$31,$t0
lw		$0,-12288($31)
TAG_41:
jal		TAG_42
lw		$0,-12288($31)
sw		$31,-8192($31)
TAG_42:
addu	$31,$31,$t0

la		$t3,TAG_44
addi	$31,$0,16
jal		TAG_43
addu	$0,$31,$t0
sw		$31,-8192($31)
TAG_43:
jalr	$0,$t3
sw		$31,-8192($31)
addu	$0,$31,$t0
TAG_44:
jal		TAG_45
addu	$31,$t0,$31
lw		$31,-12288($31)
TAG_45:
beq		$31,$31,TAG_46
addu	$31,$t0,$31
addu	$31,$t0,$31
TAG_46:

la		$t3,TAG_48
addi	$31,$0,4
jal		TAG_47
addu	$0,$31,$t0
addu	$0,$31,$t0
TAG_47:
jalr	$0,$t3
lw		$0,-12288($31)
addu	$31,$t0,$31
TAG_48:
jal		TAG_49
sw		$31,-8192($31)
sw		$31,-8192($31)
TAG_49:
beq		$31,$31,TAG_50
addu	$31,$t0,$31
lw		$31,-12288($31)
TAG_50:

la		$t3,TAG_52
addi	$31,$0,12
jal		TAG_51
sw		$31,-8192($31)
lw		$0,-12288($31)
TAG_51:
jalr	$0,$t3
lw		$31,-12288($31)
addu	$31,$t0,$31
TAG_52:
jal		TAG_53
addu	$31,$t0,$31
addu	$0,$31,$t0
TAG_53:
beq		$31,$0,TAG_54
lw		$0,-12288($31)
addu	$0,$31,$t0
TAG_54:

la		$t3,TAG_56
addi	$31,$0,24
jal		TAG_55
lw		$31,-12288($31)
addu	$0,$31,$t0
TAG_55:
jalr	$0,$t3
lw		$31,0($31)
sw		$31,4096($31)
TAG_56:
jal		TAG_57
addu	$31,$t0,$31
addu	$31,$t0,$31
TAG_57:
beq		$31,$0,TAG_58
lw		$31,-12288($31)
addu	$0,$31,$t0
TAG_58:

la		$t3,TAG_60
addi	$31,$0,4
jal		TAG_59
addu	$0,$31,$t0
sw		$31,-8192($31)
TAG_59:
jalr	$0,$t3
sw		$31,-8192($31)
sw		$31,-8192($31)
TAG_60:
jal		TAG_61
lw		$31,-12288($31)
addu	$0,$31,$t0
TAG_61:
addi	$t1,$31,0
beq		$t1,$31,TAG_62
lw		$0,0($31)
lw		$0,0($31)
TAG_62:

la		$t3,TAG_64
addi	$31,$0,16
jal		TAG_63
lw		$0,-12288($31)
lw		$0,-12288($31)
TAG_63:
jalr	$0,$t3
addu	$0,$31,$t0
addu	$31,$t0,$31
TAG_64:
jal		TAG_65
lw		$0,-12288($31)
addu	$0,$31,$t0
TAG_65:
addi	$t1,$31,0
beq		$t1,$31,TAG_66
lw		$31,-12288($31)
lw		$0,0($31)
TAG_66:

la		$t3,TAG_68
addi	$31,$0,8
jal		TAG_67
lw		$0,-12288($31)
sw		$31,-8192($31)
TAG_67:
jalr	$0,$t3
sw		$31,-8192($31)
lw		$0,-12288($31)
TAG_68:
jal		TAG_69
sw		$31,-8192($31)
sw		$31,-8192($31)
TAG_69:
addi	$t1,$31,1
beq		$31,$t1,TAG_70
lw		$0,-12288($31)
lw		$31,-12288($31)
TAG_70:

la		$t3,TAG_72
addi	$31,$0,0
jal		TAG_71
lw		$0,-12288($31)
lw		$0,-12288($31)
TAG_71:
jalr	$0,$t3
lw		$0,-12288($31)
lw		$31,-12288($31)
TAG_72:
jal		TAG_73
lw		$0,-12288($31)
sw		$31,-8192($31)
TAG_73:
addi	$t1,$31,1
beq		$31,$t1,TAG_74
lw		$31,-12288($31)
addu	$31,$t0,$31
TAG_74:

la		$t3,TAG_76
addi	$31,$0,28
jal		TAG_75
lw		$0,-12288($31)
addu	$31,$t0,$31
TAG_75:
jalr	$0,$t3
addu	$31,$t0,$31
lw		$0,-12288($31)
TAG_76:
jal		TAG_77
addu	$0,$31,$t0
addu	$31,$t0,$31
TAG_77:
addi	$31,$31,4

la		$t3,TAG_79
addi	$31,$0,4
jal		TAG_78
sw		$31,-8192($31)
lw		$31,-12288($31)
TAG_78:
jalr	$0,$t3
addu	$0,$31,$t0
addu	$0,$31,$t0
TAG_79:
jal		TAG_80
addu	$0,$31,$t0
lw		$31,-12288($31)
TAG_80:
addi	$31,$31,4

la		$t3,TAG_82
addi	$31,$0,8
jal		TAG_81
addu	$31,$t0,$31
lw		$31,-12288($31)
TAG_81:
jalr	$0,$t3
lw		$31,-12288($31)
lw		$0,0($31)
TAG_82:
jal		TAG_83
lw		$31,-12288($31)
lw		$0,0($31)
TAG_83:
la		$31,TAG_84
jr		$31
sw		$31,-8192($31)
lw		$31,-12288($31)
TAG_84:

la		$t3,TAG_86
addi	$31,$0,8
jal		TAG_85
lw		$31,-12288($31)
addu	$31,$t0,$31
TAG_85:
jalr	$0,$t3
lw		$0,0($31)
sw		$31,4096($31)
TAG_86:
jal		TAG_87
sw		$31,-8192($31)
addu	$31,$t0,$31
TAG_87:
la		$31,TAG_88
jr		$31
lw		$0,-12288($31)
lw		$31,-12288($31)
TAG_88:

la		$t3,TAG_90
addi	$31,$0,4
jal		TAG_89
sw		$31,-8192($31)
addu	$0,$31,$t0
TAG_89:
jalr	$0,$t3
lw		$31,-12288($31)
sw		$31,4096($31)
TAG_90:
jal		TAG_91
sw		$31,-8192($31)
addu	$0,$31,$t0
TAG_91:
la		$31,TAG_92
jalr	$t3,$31
sw		$31,-8192($31)
addu	$0,$31,$t0
TAG_92:

la		$t3,TAG_94
addi	$31,$0,24
jal		TAG_93
sw		$31,-8192($31)
addu	$31,$t0,$31
TAG_93:
jalr	$0,$t3
sw		$31,-8192($31)
addu	$0,$31,$t0
TAG_94:
jal		TAG_95
lw		$31,-12288($31)
sw		$31,4096($31)
TAG_95:
la		$31,TAG_96
jalr	$t3,$31
sw		$31,-8192($31)
addu	$0,$31,$t0
TAG_96:

la		$t3,TAG_98
la		$t4,TAG_99
addi	$31,$0,4
jal		TAG_97
sw		$31,-8192($31)
lw		$0,-12288($31)
TAG_97:
jalr	$0,$t3
sw		$31,-8192($31)
lw		$0,-12288($31)
TAG_98:
jalr	$31,$t4
addu	$31,$t0,$31
addu	$0,$31,$t0
TAG_99:
lw		$31,-12288($31)

la		$t3,TAG_101
la		$t4,TAG_102
addi	$31,$0,20
jal		TAG_100
addu	$31,$t0,$31
lw		$0,-12288($31)
TAG_100:
jalr	$0,$t3
addu	$0,$31,$t0
sw		$31,-8192($31)
TAG_101:
jalr	$31,$t4
lw		$31,-12288($31)
addu	$0,$31,$t0
TAG_102:
lw		$31,0($31)

la		$t3,TAG_104
la		$t4,TAG_105
addi	$31,$0,12
jal		TAG_103
lw		$0,-12288($31)
addu	$31,$t0,$31
TAG_103:
jalr	$0,$t3
addu	$0,$31,$t0
addu	$31,$t0,$31
TAG_104:
jalr	$31,$t4
sw		$31,-8192($31)
addu	$31,$t0,$31
TAG_105:
sw		$31,-8192($31)

la		$t3,TAG_107
la		$t4,TAG_108
addi	$31,$0,20
jal		TAG_106
lw		$31,-12288($31)
lw		$31,0($31)
TAG_106:
jalr	$0,$t3
sw		$31,4096($31)
addu	$31,$t0,$31
TAG_107:
jalr	$31,$t4
lw		$0,-12288($31)
sw		$31,-8192($31)
TAG_108:
sw		$31,-8192($31)

la		$t3,TAG_110
la		$t4,TAG_111
addi	$31,$0,8
jal		TAG_109
sw		$31,-8192($31)
lw		$31,-12288($31)
TAG_109:
jalr	$0,$t3
lw		$0,-12288($31)
lw		$0,-12288($31)
TAG_110:
jalr	$31,$t4
addu	$0,$31,$t0
addu	$0,$31,$t0
TAG_111:
addu	$31,$t0,$31

la		$t3,TAG_113
la		$t4,TAG_114
addi	$31,$0,0
jal		TAG_112
lw		$31,-12288($31)
sw		$31,4096($31)
TAG_112:
jalr	$0,$t3
addu	$0,$31,$t0
addu	$31,$t0,$31
TAG_113:
jalr	$31,$t4
addu	$31,$t0,$31
lw		$0,-12288($31)
TAG_114:
addu	$31,$t0,$31

la		$t3,TAG_116
la		$t4,TAG_117
addi	$31,$0,12
jal		TAG_115
lw		$31,-12288($31)
addu	$0,$31,$t0
TAG_115:
jalr	$0,$t3
sw		$31,4096($31)
addu	$31,$t0,$31
TAG_116:
jalr	$31,$t4
lw		$0,-12288($31)
lw		$0,-12288($31)
TAG_117:
addu	$31,$31,$t0

la		$t3,TAG_119
la		$t4,TAG_120
addi	$31,$0,8
jal		TAG_118
lw		$31,-12288($31)
lw		$0,0($31)
TAG_118:
jalr	$0,$t3
lw		$0,0($31)
addu	$0,$31,$t0
TAG_119:
jalr	$31,$t4
sw		$31,-8192($31)
addu	$31,$t0,$31
TAG_120:
addu	$31,$31,$t0

la		$t3,TAG_122
la		$t4,TAG_123
addi	$31,$0,8
jal		TAG_121
addu	$31,$t0,$31
lw		$31,-12288($31)
TAG_121:
jalr	$0,$t3
lw		$0,-12288($31)
sw		$31,-8192($31)
TAG_122:
jalr	$31,$t4
addu	$0,$31,$t0
addu	$0,$31,$t0
TAG_123:
beq		$31,$31,TAG_124
lw		$31,-12288($31)
addu	$31,$t0,$31
TAG_124:

la		$t3,TAG_126
la		$t4,TAG_127
addi	$31,$0,20
jal		TAG_125
sw		$31,-8192($31)
addu	$31,$t0,$31
TAG_125:
jalr	$0,$t3
sw		$31,-8192($31)
lw		$31,-12288($31)
TAG_126:
jalr	$31,$t4
lw		$0,-12288($31)
addu	$31,$t0,$31
TAG_127:
beq		$31,$31,TAG_128
addu	$31,$t0,$31
lw		$0,-12288($31)
TAG_128:

la		$t3,TAG_130
la		$t4,TAG_131
addi	$31,$0,12
jal		TAG_129
addu	$31,$t0,$31
sw		$31,-8192($31)
TAG_129:
jalr	$0,$t3
sw		$31,-8192($31)
sw		$31,-8192($31)
TAG_130:
jalr	$31,$t4
lw		$0,-12288($31)
sw		$31,-8192($31)
TAG_131:
beq		$31,$0,TAG_132
addu	$31,$t0,$31
sw		$31,-8192($31)
TAG_132:

la		$t3,TAG_134
la		$t4,TAG_135
addi	$31,$0,20
jal		TAG_133
lw		$0,-12288($31)
sw		$31,-8192($31)
TAG_133:
jalr	$0,$t3
sw		$31,-8192($31)
addu	$31,$t0,$31
TAG_134:
jalr	$31,$t4
lw		$0,-12288($31)
lw		$0,-12288($31)
TAG_135:
beq		$31,$0,TAG_136
lw		$0,-12288($31)
sw		$31,-8192($31)
TAG_136:

la		$t3,TAG_138
la		$t4,TAG_139
addi	$31,$0,20
jal		TAG_137
lw		$0,-12288($31)
addu	$0,$31,$t0
TAG_137:
jalr	$0,$t3
sw		$31,-8192($31)
sw		$31,-8192($31)
TAG_138:
jalr	$31,$t4
sw		$31,-8192($31)
sw		$31,-8192($31)
TAG_139:
addi	$t1,$31,0
beq		$t1,$31,TAG_140
lw		$0,-12288($31)
addu	$31,$t0,$31
TAG_140:

la		$t3,TAG_142
la		$t4,TAG_143
addi	$31,$0,12
jal		TAG_141
lw		$0,-12288($31)
lw		$0,-12288($31)
TAG_141:
jalr	$0,$t3
sw		$31,-8192($31)
sw		$31,-8192($31)
TAG_142:
jalr	$31,$t4
lw		$31,-12288($31)
lw		$0,0($31)
TAG_143:
addi	$t1,$31,0
beq		$t1,$31,TAG_144
sw		$31,4096($31)
lw		$0,0($31)
TAG_144:

la		$t3,TAG_146
la		$t4,TAG_147
addi	$31,$0,24
jal		TAG_145
lw		$0,-12288($31)
addu	$0,$31,$t0
TAG_145:
jalr	$0,$t3
addu	$0,$31,$t0
lw		$31,-12288($31)
TAG_146:
jalr	$31,$t4
sw		$31,-8192($31)
sw		$31,-8192($31)
TAG_147:
addi	$t1,$31,1
beq		$31,$t1,TAG_148
sw		$31,-8192($31)
addu	$31,$t0,$31
TAG_148:

la		$t3,TAG_150
la		$t4,TAG_151
addi	$31,$0,8
jal		TAG_149
addu	$31,$t0,$31
addu	$0,$31,$t0
TAG_149:
jalr	$0,$t3
lw		$31,-12288($31)
addu	$0,$31,$t0
TAG_150:
jalr	$31,$t4
addu	$0,$31,$t0
sw		$31,-8192($31)
TAG_151:
addi	$t1,$31,1
beq		$31,$t1,TAG_152
lw		$0,-12288($31)
addu	$0,$31,$t0
TAG_152:

la		$t3,TAG_154
la		$t4,TAG_155
addi	$31,$0,12
jal		TAG_153
lw		$31,-12288($31)
addu	$0,$31,$t0
TAG_153:
jalr	$0,$t3
addu	$31,$t0,$31
sw		$31,4096($31)
TAG_154:
jalr	$31,$t4
lw		$0,-12288($31)
addu	$31,$t0,$31
TAG_155:
addi	$31,$31,4

la		$t3,TAG_157
la		$t4,TAG_158
addi	$31,$0,24
jal		TAG_156
lw		$31,-12288($31)
sw		$31,4096($31)
TAG_156:
jalr	$0,$t3
lw		$0,0($31)
addu	$0,$31,$t0
TAG_157:
jalr	$31,$t4
sw		$31,-8192($31)
addu	$0,$31,$t0
TAG_158:
addi	$31,$31,4

la		$t3,TAG_160
la		$t4,TAG_161
addi	$31,$0,20
jal		TAG_159
lw		$0,-12288($31)
addu	$31,$t0,$31
TAG_159:
jalr	$0,$t3
addu	$31,$t0,$31
addu	$0,$31,$t0
TAG_160:
jalr	$31,$t4
addu	$31,$t0,$31
lw		$31,-12288($31)
TAG_161:
la		$31,TAG_162
jr		$31
addu	$31,$t0,$31
addu	$0,$31,$t0
TAG_162:

la		$t3,TAG_164
la		$t4,TAG_165
addi	$31,$0,28
jal		TAG_163
addu	$0,$31,$t0
lw		$31,-12288($31)
TAG_163:
jalr	$0,$t3
addu	$31,$t0,$31
lw		$31,-12288($31)
TAG_164:
jalr	$31,$t4
sw		$31,-8192($31)
lw		$0,-12288($31)
TAG_165:
la		$31,TAG_166
jr		$31
addu	$31,$t0,$31
lw		$31,-12288($31)
TAG_166:

la		$t3,TAG_168
la		$t4,TAG_169
addi	$31,$0,24
jal		TAG_167
addu	$0,$31,$t0
sw		$31,-8192($31)
TAG_167:
jalr	$0,$t3
lw		$0,-12288($31)
lw		$0,-12288($31)
TAG_168:
jalr	$31,$t4
lw		$31,-12288($31)
lw		$31,0($31)
TAG_169:
la		$31,TAG_170
jalr	$t3,$31
lw		$31,-12288($31)
addu	$31,$t0,$31
TAG_170:

la		$t3,TAG_172
la		$t4,TAG_173
addi	$31,$0,8
jal		TAG_171
addu	$31,$t0,$31
lw		$31,-12288($31)
TAG_171:
jalr	$0,$t3
sw		$31,-8192($31)
sw		$31,-8192($31)
TAG_172:
jalr	$31,$t4
lw		$0,-12288($31)
addu	$0,$31,$t0
TAG_173:
la		$31,TAG_174
jalr	$t3,$31
sw		$31,-8192($31)
addu	$31,$t0,$31
TAG_174:

la		$t3,TAG_176
la		$t4,TAG_177
addi	$31,$0,0
jal		TAG_175
lw		$31,-12288($31)
addu	$0,$31,$t0
TAG_175:
jalr	$0,$t3
lw		$0,0($31)
lw		$0,0($31)
TAG_176:
jalr	$0,$t4
sw		$31,4096($31)
addu	$31,$t0,$31
TAG_177:
lw		$31,0($31)

la		$t3,TAG_179
la		$t4,TAG_180
addi	$31,$0,16
jal		TAG_178
lw		$0,-12288($31)
sw		$31,-8192($31)
TAG_178:
jalr	$0,$t3
sw		$31,-8192($31)
addu	$31,$t0,$31
TAG_179:
jalr	$0,$t4
addu	$0,$31,$t0
sw		$31,-8192($31)
TAG_180:
lw		$31,-12288($31)

la		$t3,TAG_182
la		$t4,TAG_183
addi	$31,$0,28
jal		TAG_181
sw		$31,-8192($31)
lw		$31,-12288($31)
TAG_181:
jalr	$0,$t3
lw		$0,-12288($31)
addu	$0,$31,$t0
TAG_182:
jalr	$0,$t4
lw		$0,-12288($31)
lw		$0,-12288($31)
TAG_183:
sw		$31,-8192($31)

la		$t3,TAG_185
la		$t4,TAG_186
addi	$31,$0,8
jal		TAG_184
addu	$0,$31,$t0
addu	$31,$t0,$31
TAG_184:
jalr	$0,$t3
lw		$0,-12288($31)
lw		$31,-12288($31)
TAG_185:
jalr	$0,$t4
lw		$0,-12288($31)
lw		$0,-12288($31)
TAG_186:
sw		$31,-8192($31)

#--------------

addi	$t0,$0,2222
sw		$t0,2048($0)
addi	$t0,$0,3333
sw		$t0,2052($0)
addi	$t0,$0,4444
sw		$t0,2056($0)