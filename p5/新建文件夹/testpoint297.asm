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

addi	$31,$0,28
jal		TAG_0
sw		$31,-8192($31)
lw		$31,-12288($31)
TAG_0:
jal		TAG_1
addu	$31,$31,$t0
lw		$31,-12288($31)
TAG_1:
jal		TAG_2
lw		$31,-12288($31)
addi	$31,$31,4
TAG_2:
addu	$31,$31,$t0
addu	$31,$t0,$31

addi	$31,$0,0
jal		TAG_3
addu	$31,$t0,$31
lw		$31,-12288($31)
TAG_3:
jal		TAG_4
addu	$31,$31,$t0
addu	$31,$31,$t0
TAG_4:
jal		TAG_5
addi	$31,$31,4
addi	$31,$31,4
TAG_5:
addu	$31,$31,$t2
addu	$31,$t0,$31

addi	$31,$0,16
jal		TAG_6
addu	$31,$31,$t0
addi	$31,$31,4
TAG_6:
jal		TAG_7
addu	$31,$31,$t0
sw		$31,-8192($31)
TAG_7:
jal		TAG_8
sw		$31,-8192($31)
sw		$31,-8192($31)
TAG_8:
addu	$31,$31,$t2
addu	$31,$31,$t0

addi	$31,$0,12
jal		TAG_9
addu	$31,$t0,$31
addi	$31,$31,4
TAG_9:
jal		TAG_10
addu	$31,$t0,$31
sw		$31,-8192($31)
TAG_10:
jal		TAG_11
addu	$31,$31,$t0
sw		$31,-8192($31)
TAG_11:
addu	$31,$31,$t2
addu	$31,$31,$t0

addi	$31,$0,24
jal		TAG_12
sw		$31,-8192($31)
addu	$31,$t0,$31
TAG_12:
jal		TAG_13
addu	$31,$t0,$31
addu	$31,$t0,$31
TAG_13:
jal		TAG_14
addi	$31,$31,4
addi	$31,$31,4
TAG_14:
addu	$31,$31,$t2
beq		$31,$31,TAG_15
addu	$31,$31,$t0
lw		$31,0($31)
TAG_15:

addi	$31,$0,12
jal		TAG_16
addu	$31,$31,$t0
lw		$31,-12288($31)
TAG_16:
jal		TAG_17
addu	$31,$t0,$31
sw		$31,-8192($31)
TAG_17:
jal		TAG_18
sw		$31,-8192($31)
addu	$31,$31,$t0
TAG_18:
addu	$31,$31,$t2
beq		$31,$31,TAG_19
sw		$31,4096($31)
lw		$31,0($31)
TAG_19:

addi	$31,$0,0
jal		TAG_20
addi	$31,$31,4
sw		$31,-8192($31)
TAG_20:
jal		TAG_21
addi	$31,$31,4
addu	$31,$t0,$31
TAG_21:
jal		TAG_22
addu	$31,$31,$t0
addu	$31,$31,$t0
TAG_22:
addu	$31,$31,$t2
beq		$31,$0,TAG_23
addu	$31,$t0,$31
addu	$31,$31,$t0
TAG_23:

addi	$31,$0,20
jal		TAG_24
addu	$31,$t0,$31
addi	$31,$31,4
TAG_24:
jal		TAG_25
addi	$31,$31,4
addu	$31,$31,$t0
TAG_25:
jal		TAG_26
addi	$31,$31,4
addu	$31,$t0,$31
TAG_26:
addu	$31,$31,$t2
beq		$31,$0,TAG_27
addu	$31,$31,$t0
addi	$31,$31,4
TAG_27:

addi	$31,$0,20
jal		TAG_28
addu	$31,$t0,$31
addu	$31,$31,$t0
TAG_28:
jal		TAG_29
addu	$31,$31,$t0
addu	$31,$t0,$31
TAG_29:
jal		TAG_30
addu	$31,$t0,$31
sw		$31,-8192($31)
TAG_30:
addu	$31,$31,$t2
addi	$t1,$31,0
beq		$t1,$31,TAG_31
sw		$31,4096($31)
addu	$31,$t0,$31
TAG_31:

addi	$31,$0,4
jal		TAG_32
addu	$31,$t0,$31
sw		$31,-8192($31)
TAG_32:
jal		TAG_33
addi	$31,$31,4
addu	$31,$t0,$31
TAG_33:
jal		TAG_34
addu	$31,$31,$t0
lw		$31,-12288($31)
TAG_34:
addu	$31,$31,$t2
addi	$t1,$31,0
beq		$t1,$31,TAG_35
addi	$31,$31,4
lw		$31,0($31)
TAG_35:

addi	$31,$0,4
jal		TAG_36
addu	$31,$31,$t0
sw		$31,-8192($31)
TAG_36:
jal		TAG_37
lw		$31,-12288($31)
lw		$31,0($31)
TAG_37:
jal		TAG_38
addu	$31,$t0,$31
addu	$31,$t0,$31
TAG_38:
addu	$31,$31,$t2
addi	$t1,$31,1
beq		$31,$t1,TAG_39
lw		$31,0($31)
addi	$31,$31,4
TAG_39:

addi	$31,$0,24
jal		TAG_40
addu	$31,$t0,$31
addu	$31,$t0,$31
TAG_40:
jal		TAG_41
addu	$31,$t0,$31
addi	$31,$31,4
TAG_41:
jal		TAG_42
addi	$31,$31,4
addi	$31,$31,4
TAG_42:
addu	$31,$31,$t2
addi	$t1,$31,1
beq		$31,$t1,TAG_43
addu	$31,$31,$t0
lw		$31,0($31)
TAG_43:

addi	$31,$0,28
jal		TAG_44
addu	$31,$31,$t0
addu	$31,$t0,$31
TAG_44:
jal		TAG_45
sw		$31,-8192($31)
addu	$31,$31,$t0
TAG_45:
jal		TAG_46
addu	$31,$31,$t0
addu	$31,$31,$t0
TAG_46:
addu	$31,$31,$t2
addi	$31,$31,4

addi	$31,$0,8
jal		TAG_47
addi	$31,$31,4
addi	$31,$31,4
TAG_47:
jal		TAG_48
lw		$31,-12288($31)
addi	$31,$31,4
TAG_48:
jal		TAG_49
addu	$31,$31,$t0
addu	$31,$31,$t0
TAG_49:
addu	$31,$31,$t2
addi	$31,$31,4

addi	$31,$0,24
jal		TAG_50
addu	$31,$t0,$31
addu	$31,$t0,$31
TAG_50:
jal		TAG_51
addi	$31,$31,4
lw		$31,-12288($31)
TAG_51:
jal		TAG_52
sw		$31,-8192($31)
addu	$31,$31,$t0
TAG_52:
addu	$31,$31,$t2
la		$31,TAG_53
jr		$31
addu	$31,$31,$t0
sw		$31,-8192($31)
TAG_53:

addi	$31,$0,12
jal		TAG_54
addu	$31,$t0,$31
addu	$31,$31,$t0
TAG_54:
jal		TAG_55
addu	$31,$t0,$31
sw		$31,-8192($31)
TAG_55:
jal		TAG_56
addu	$31,$t0,$31
lw		$31,-12288($31)
TAG_56:
addu	$31,$31,$t2
la		$31,TAG_57
jr		$31
addu	$31,$t0,$31
addu	$31,$t0,$31
TAG_57:

addi	$31,$0,0
jal		TAG_58
addi	$31,$31,4
addi	$31,$31,4
TAG_58:
jal		TAG_59
addu	$31,$t0,$31
lw		$31,-12288($31)
TAG_59:
jal		TAG_60
addi	$31,$31,4
lw		$31,-12288($31)
TAG_60:
addu	$31,$31,$t2
la		$31,TAG_61
jalr	$t3,$31
addi	$31,$31,4
addu	$31,$t0,$31
TAG_61:

addi	$31,$0,4
jal		TAG_62
addu	$31,$t0,$31
addu	$31,$31,$t0
TAG_62:
jal		TAG_63
addu	$31,$31,$t0
sw		$31,-8192($31)
TAG_63:
jal		TAG_64
addu	$31,$31,$t0
addu	$31,$t0,$31
TAG_64:
addu	$31,$31,$t2
la		$31,TAG_65
jalr	$t3,$31
sw		$31,-8192($31)
lw		$31,-12288($31)
TAG_65:

addi	$31,$0,8
jal		TAG_66
addu	$31,$31,$t0
sw		$31,-8192($31)
TAG_66:
jal		TAG_67
addu	$31,$t0,$31
lw		$31,-12288($31)
TAG_67:
jal		TAG_68
sw		$31,-8192($31)
lw		$31,-12288($31)
TAG_68:
addi	$31,$31,-12288
lw		$31,0($31)

addi	$31,$0,8
jal		TAG_69
addu	$31,$t0,$31
addi	$31,$31,4
TAG_69:
jal		TAG_70
addu	$31,$t0,$31
lw		$31,-12288($31)
TAG_70:
jal		TAG_71
sw		$31,-8192($31)
lw		$31,-12288($31)
TAG_71:
addi	$31,$31,-12288
lw		$31,0($31)

addi	$31,$0,24
jal		TAG_72
lw		$31,-12288($31)
lw		$31,0($31)
TAG_72:
jal		TAG_73
sw		$31,-8192($31)
addi	$31,$31,4
TAG_73:
jal		TAG_74
addu	$31,$31,$t0
addi	$31,$31,4
TAG_74:
addi	$31,$31,-12288
sw		$31,4096($31)

addi	$31,$0,24
jal		TAG_75
sw		$31,-8192($31)
sw		$31,-8192($31)
TAG_75:
jal		TAG_76
lw		$31,-12288($31)
addi	$31,$31,4
TAG_76:
jal		TAG_77
addu	$31,$31,$t0
addu	$31,$31,$t0
TAG_77:
addi	$31,$31,-12288
sw		$31,4096($31)

addi	$31,$0,16
jal		TAG_78
addu	$31,$t0,$31
addi	$31,$31,4
TAG_78:
jal		TAG_79
addu	$31,$t0,$31
sw		$31,-8192($31)
TAG_79:
jal		TAG_80
sw		$31,-8192($31)
lw		$31,-12288($31)
TAG_80:
addi	$31,$31,-12288
addu	$31,$t0,$31

addi	$31,$0,24
jal		TAG_81
addi	$31,$31,4
lw		$31,-12288($31)
TAG_81:
jal		TAG_82
addu	$31,$31,$t0
sw		$31,-8192($31)
TAG_82:
jal		TAG_83
sw		$31,-8192($31)
addu	$31,$t0,$31
TAG_83:
addi	$31,$31,-12288
addu	$31,$t0,$31

addi	$31,$0,20
jal		TAG_84
addu	$31,$t0,$31
addi	$31,$31,4
TAG_84:
jal		TAG_85
lw		$31,-12288($31)
addu	$31,$31,$t0
TAG_85:
jal		TAG_86
sw		$31,-8192($31)
sw		$31,-8192($31)
TAG_86:
addi	$31,$31,-12288
addu	$31,$31,$t0

addi	$31,$0,8
jal		TAG_87
addu	$31,$t0,$31
lw		$31,-12288($31)
TAG_87:
jal		TAG_88
lw		$31,-12288($31)
sw		$31,4096($31)
TAG_88:
jal		TAG_89
addu	$31,$t0,$31
lw		$31,-12288($31)
TAG_89:
addi	$31,$31,-12288
addu	$31,$31,$t0

addi	$31,$0,28
jal		TAG_90
addu	$31,$t0,$31
addu	$31,$t0,$31
TAG_90:
jal		TAG_91
sw		$31,-8192($31)
addu	$31,$t0,$31
TAG_91:
jal		TAG_92
addu	$31,$t0,$31
sw		$31,-8192($31)
TAG_92:
addi	$31,$31,-12288
beq		$31,$31,TAG_93
lw		$31,0($31)
lw		$31,0($31)
TAG_93:

addi	$31,$0,0
jal		TAG_94
addi	$31,$31,4
addi	$31,$31,4
TAG_94:
jal		TAG_95
addu	$31,$31,$t0
addu	$31,$31,$t0
TAG_95:
jal		TAG_96
addu	$31,$31,$t0
sw		$31,-8192($31)
TAG_96:
addi	$31,$31,-12288
beq		$31,$31,TAG_97
sw		$31,4096($31)
addi	$31,$31,4
TAG_97:

addi	$31,$0,4
jal		TAG_98
addi	$31,$31,4
addu	$31,$31,$t0
TAG_98:
jal		TAG_99
addu	$31,$t0,$31
addi	$31,$31,4
TAG_99:
jal		TAG_100
addu	$31,$t0,$31
lw		$31,-12288($31)
TAG_100:
addi	$31,$31,-12288
beq		$31,$0,TAG_101
addi	$31,$31,4
addu	$31,$t0,$31
TAG_101:

addi	$31,$0,4
jal		TAG_102
addu	$31,$t0,$31
lw		$31,-12288($31)
TAG_102:
jal		TAG_103
addu	$31,$t0,$31
addi	$31,$31,4
TAG_103:
jal		TAG_104
addu	$31,$31,$t0
sw		$31,-8192($31)
TAG_104:
addi	$31,$31,-12288
beq		$31,$0,TAG_105
lw		$31,0($31)
addu	$31,$t0,$31
TAG_105:

addi	$31,$0,12
jal		TAG_106
sw		$31,-8192($31)
addu	$31,$t0,$31
TAG_106:
jal		TAG_107
addi	$31,$31,4
lw		$31,-12288($31)
TAG_107:
jal		TAG_108
lw		$31,-12288($31)
lw		$31,0($31)
TAG_108:
addi	$31,$31,4
addi	$t1,$31,0
beq		$t1,$31,TAG_109
sw		$31,4096($31)
sw		$31,4096($31)
TAG_109:

addi	$31,$0,8
jal		TAG_110
addi	$31,$31,4
addu	$31,$31,$t0
TAG_110:
jal		TAG_111
addu	$31,$31,$t0
addi	$31,$31,4
TAG_111:
jal		TAG_112
sw		$31,-8192($31)
addi	$31,$31,4
TAG_112:
addi	$31,$31,-12288
addi	$t1,$31,0
beq		$t1,$31,TAG_113
addu	$31,$t0,$31
lw		$31,0($31)
TAG_113:

addi	$31,$0,16
jal		TAG_114
addi	$31,$31,4
sw		$31,-8192($31)
TAG_114:
jal		TAG_115
sw		$31,-8192($31)
addu	$31,$t0,$31
TAG_115:
jal		TAG_116
addi	$31,$31,4
addi	$31,$31,4
TAG_116:
addi	$31,$31,-12288
addi	$t1,$31,1
beq		$31,$t1,TAG_117
lw		$31,0($31)
addu	$31,$31,$t0
TAG_117:

addi	$31,$0,0
jal		TAG_118
lw		$31,-12288($31)
addu	$31,$31,$t0
TAG_118:
jal		TAG_119
addi	$31,$31,4
sw		$31,-8192($31)
TAG_119:
jal		TAG_120
sw		$31,-8192($31)
addu	$31,$t0,$31
TAG_120:
addi	$31,$31,-12288
addi	$t1,$31,1
beq		$31,$t1,TAG_121
addi	$31,$31,4
addu	$31,$31,$t0
TAG_121:

addi	$31,$0,28
jal		TAG_122
lw		$31,-12288($31)
addu	$31,$31,$t0
TAG_122:
jal		TAG_123
addu	$31,$t0,$31
addu	$31,$t0,$31
TAG_123:
jal		TAG_124
addu	$31,$31,$t0
addu	$31,$t0,$31
TAG_124:
addi	$31,$31,-12288
addi	$31,$31,4

addi	$31,$0,16
jal		TAG_125
addi	$31,$31,4
addi	$31,$31,4
TAG_125:
jal		TAG_126
addi	$31,$31,4
addu	$31,$t0,$31
TAG_126:
jal		TAG_127
sw		$31,-8192($31)
addu	$31,$t0,$31
TAG_127:
addi	$31,$31,-12288
addi	$31,$31,4

addi	$31,$0,20
jal		TAG_128
addu	$31,$31,$t0
addi	$31,$31,4
TAG_128:
jal		TAG_129
addu	$31,$31,$t0
lw		$31,-12288($31)
TAG_129:
jal		TAG_130
lw		$31,-12288($31)
sw		$31,4096($31)
TAG_130:
addi	$31,$31,4
la		$31,TAG_131
jr		$31
lw		$31,-12288($31)
addu	$31,$31,$t0
TAG_131:

addi	$31,$0,8
jal		TAG_132
addi	$31,$31,4
addu	$31,$t0,$31
TAG_132:
jal		TAG_133
lw		$31,-12288($31)
addi	$31,$31,4
TAG_133:
jal		TAG_134
addu	$31,$31,$t0
lw		$31,-12288($31)
TAG_134:
addi	$31,$31,-12288
la		$31,TAG_135
jr		$31
lw		$31,-12288($31)
sw		$31,4096($31)
TAG_135:

addi	$31,$0,4
jal		TAG_136
addu	$31,$31,$t0
addu	$31,$31,$t0
TAG_136:
jal		TAG_137
lw		$31,-12288($31)
addi	$31,$31,4
TAG_137:
jal		TAG_138
addu	$31,$31,$t0
addu	$31,$t0,$31
TAG_138:
addi	$31,$31,-12288
la		$31,TAG_139
jalr	$t3,$31
addu	$31,$t0,$31
addu	$31,$31,$t0
TAG_139:

addi	$31,$0,28
jal		TAG_140
addu	$31,$t0,$31
addu	$31,$t0,$31
TAG_140:
jal		TAG_141
addi	$31,$31,4
sw		$31,-8192($31)
TAG_141:
jal		TAG_142
addu	$31,$31,$t0
addi	$31,$31,4
TAG_142:
addi	$31,$31,-12288
la		$31,TAG_143
jalr	$t3,$31
sw		$31,-8192($31)
sw		$31,-8192($31)
TAG_143:

addi	$31,$0,0
jal		TAG_144
addu	$31,$t0,$31
addu	$31,$t0,$31
TAG_144:
jal		TAG_145
sw		$31,-8192($31)
sw		$31,-8192($31)
TAG_145:
jal		TAG_146
addu	$31,$t0,$31
addi	$31,$31,4
TAG_146:
jal		TAG_147
addu	$31,$31,$t0
lw		$31,-12288($31)
TAG_147:
lw		$31,-12288($31)

addi	$31,$0,28
jal		TAG_148
addu	$31,$t0,$31
lw		$31,-12288($31)
TAG_148:
jal		TAG_149
addu	$31,$t0,$31
addi	$31,$31,4
TAG_149:
jal		TAG_150
addu	$31,$t0,$31
addu	$31,$31,$t0
TAG_150:
jal		TAG_151
addu	$31,$31,$t0
lw		$31,-12288($31)
TAG_151:
lw		$31,-12288($31)

addi	$31,$0,20
jal		TAG_152
lw		$31,-12288($31)
addu	$31,$t0,$31
TAG_152:
jal		TAG_153
addu	$31,$t0,$31
addi	$31,$31,4
TAG_153:
jal		TAG_154
sw		$31,-8192($31)
sw		$31,-8192($31)
TAG_154:
jal		TAG_155
addu	$31,$t0,$31
lw		$31,-12288($31)
TAG_155:
sw		$31,-8192($31)

addi	$31,$0,4
jal		TAG_156
lw		$31,-12288($31)
addi	$31,$31,4
TAG_156:
jal		TAG_157
sw		$31,-8192($31)
addi	$31,$31,4
TAG_157:
jal		TAG_158
lw		$31,-12288($31)
addi	$31,$31,4
TAG_158:
jal		TAG_159
lw		$31,-12288($31)
addi	$31,$31,4
TAG_159:
sw		$31,4096($31)

addi	$31,$0,0
jal		TAG_160
sw		$31,-8192($31)
sw		$31,-8192($31)
TAG_160:
jal		TAG_161
addu	$31,$31,$t0
lw		$31,-12288($31)
TAG_161:
jal		TAG_162
sw		$31,-8192($31)
lw		$31,-12288($31)
TAG_162:
jal		TAG_163
addu	$31,$t0,$31
lw		$31,-12288($31)
TAG_163:
addu	$31,$t0,$31

addi	$31,$0,20
jal		TAG_164
sw		$31,-8192($31)
addi	$31,$31,4
TAG_164:
jal		TAG_165
addi	$31,$31,4
lw		$31,-12288($31)
TAG_165:
jal		TAG_166
addu	$31,$31,$t0
addu	$31,$t0,$31
TAG_166:
jal		TAG_167
sw		$31,-8192($31)
sw		$31,-8192($31)
TAG_167:
addu	$31,$t0,$31

addi	$31,$0,4
jal		TAG_168
addu	$31,$31,$t0
addu	$31,$t0,$31
TAG_168:
jal		TAG_169
addu	$31,$t0,$31
addu	$31,$t0,$31
TAG_169:
jal		TAG_170
addu	$31,$31,$t0
lw		$31,-12288($31)
TAG_170:
jal		TAG_171
addi	$31,$31,4
addi	$31,$31,4
TAG_171:
addu	$31,$31,$t0

addi	$31,$0,24
jal		TAG_172
addu	$31,$31,$t0
addi	$31,$31,4
TAG_172:
jal		TAG_173
lw		$31,-12288($31)
addi	$31,$31,4
TAG_173:
jal		TAG_174
sw		$31,-8192($31)
sw		$31,-8192($31)
TAG_174:
jal		TAG_175
sw		$31,-8192($31)
addi	$31,$31,4
TAG_175:
addu	$31,$31,$t0

addi	$31,$0,16
jal		TAG_176
lw		$31,-12288($31)
addu	$31,$t0,$31
TAG_176:
jal		TAG_177
addu	$31,$t0,$31
lw		$31,-12288($31)
TAG_177:
jal		TAG_178
addi	$31,$31,4
addi	$31,$31,4
TAG_178:
jal		TAG_179
sw		$31,-8192($31)
addu	$31,$31,$t0
TAG_179:
beq		$31,$31,TAG_180
sw		$31,-8192($31)
addu	$31,$31,$t0
TAG_180:

addi	$31,$0,24
jal		TAG_181
sw		$31,-8192($31)
addu	$31,$31,$t0
TAG_181:
jal		TAG_182
addu	$31,$t0,$31
addu	$31,$t0,$31
TAG_182:
jal		TAG_183
lw		$31,-12288($31)
sw		$31,4096($31)
TAG_183:
jal		TAG_184
sw		$31,-8192($31)
addu	$31,$t0,$31
TAG_184:
beq		$31,$31,TAG_185
addu	$31,$31,$t0
addi	$31,$31,4
TAG_185:

addi	$31,$0,0
jal		TAG_186
sw		$31,-8192($31)
lw		$31,-12288($31)
TAG_186:
jal		TAG_187
addu	$31,$31,$t0
sw		$31,-8192($31)
TAG_187:
jal		TAG_188
addu	$31,$t0,$31
addu	$31,$31,$t0
TAG_188:
jal		TAG_189
addu	$31,$31,$t0
sw		$31,-8192($31)
TAG_189:
beq		$31,$0,TAG_190
lw		$31,-12288($31)
addu	$31,$31,$t0
TAG_190:

addi	$31,$0,28
jal		TAG_191
addu	$31,$31,$t0
addu	$31,$31,$t0
TAG_191:
jal		TAG_192
sw		$31,-8192($31)
addu	$31,$t0,$31
TAG_192:
jal		TAG_193
addi	$31,$31,4
sw		$31,-8192($31)
TAG_193:
jal		TAG_194
sw		$31,-8192($31)
sw		$31,-8192($31)
TAG_194:
beq		$31,$0,TAG_195
addu	$31,$t0,$31
addu	$31,$31,$t0
TAG_195:

addi	$31,$0,16
jal		TAG_196
addi	$31,$31,4
addi	$31,$31,4
TAG_196:
jal		TAG_197
addu	$31,$t0,$31
sw		$31,-8192($31)
TAG_197:
jal		TAG_198
lw		$31,-12288($31)
addi	$31,$31,4
TAG_198:
jal		TAG_199
addi	$31,$31,4
addi	$31,$31,4
TAG_199:
addi	$t1,$31,0
beq		$t1,$31,TAG_200
addu	$31,$t0,$31
addi	$31,$31,4
TAG_200:

addi	$31,$0,0
jal		TAG_201
addi	$31,$31,4
addu	$31,$t0,$31
TAG_201:
jal		TAG_202
addu	$31,$31,$t0
lw		$31,-12288($31)
TAG_202:
jal		TAG_203
addu	$31,$31,$t0
addu	$31,$t0,$31
TAG_203:
jal		TAG_204
addu	$31,$t0,$31
addu	$31,$t0,$31
TAG_204:
addi	$t1,$31,0
beq		$t1,$31,TAG_205
sw		$31,-8192($31)
sw		$31,-8192($31)
TAG_205:

#--------------

addi	$t0,$0,2222
sw		$t0,2048($0)
addi	$t0,$0,3333
sw		$t0,2052($0)
addi	$t0,$0,4444
sw		$t0,2056($0)