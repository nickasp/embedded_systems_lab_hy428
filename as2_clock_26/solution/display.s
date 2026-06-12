	.cpu cortex-m3
	.arch armv7-m
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 6
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"display.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.global	font
	.data
	.align	2
	.type	font, %object
	.size	font, 582
font:
	.ascii	"\000\000\000\000\000\000\000\006_\006\000\000\007\003"
	.ascii	"\000\007\003\000$~$~$\000$+j\022\000\000c\023\010dc"
	.ascii	"\0000LR\"P\000\000\007\003\000\000\000\000>A\000\000"
	.ascii	"\000\000A>\000\000\000\010>\034>\010\000\010\010>\010"
	.ascii	"\010\000\200``\000\000\000\010\010\010\010\010\000\000"
	.ascii	"``\000\000\000 \020\010\004\002\000>QIE>\000\000B\177"
	.ascii	"@\000\000bQIIF\000\"III6\000\030\024\022\177\020\000"
	.ascii	"/III1\000<JII0\000\001q\011\005\003\0006III6\000\006"
	.ascii	"II)\036\000\000ll\000\000\000\000\354l\000\000\000\010"
	.ascii	"\024\"A\000\000$$$$$\000\000A\"\024\010\000\002\001"
	.ascii	"Y\011\006\000>A]U\036\000~\021\021\021~\000\177III6"
	.ascii	"\000>AAA\"\000\177AAA>\000\177IIIA\000\177\011\011\011"
	.ascii	"\001\000>AIIz\000\177\010\010\010\177\000\000A\177A"
	.ascii	"\000\0000@@@?\000\177\010\024\"A\000\177@@@@\000\177"
	.ascii	"\002\004\002\177\000\177\002\004\010\177\000>AAA>\000"
	.ascii	"\177\011\011\011\006\000>AQ!^\000\177\011\011\031f\000"
	.ascii	"&III2\000\001\001\177\001\001\000?@@@?\000\037 @ \037"
	.ascii	"\000?@<@?\000c\024\010\024c\000\007\010p\010\007\000"
	.ascii	"qIEC\000\000\000\177AA\000\000\002\004\010\020 \000"
	.ascii	"\000AA\177\000\000\004\002\001\002\004\000\200\200\200"
	.ascii	"\200\200\000\000\002\005\002\000\000 TTTx\000\177DD"
	.ascii	"D8\0008DDD(\0008DDD\177\0008TTT\010\000\010~\011\011"
	.ascii	"\000\000\030$\244\244\374\000\177\004\004x\000\000\000"
	.ascii	"\000}@\000\000@\200\204}\000\000\177\020(D\000\000\000"
	.ascii	"\000\177@\000\000|\004\030\004x\000|\004\004x\000\000"
	.ascii	"8DDD8\000\374DDD8\0008DDD\374\000DxD\004\010\000\010"
	.ascii	"TTT \000\004>D$\000\000<@ |\000\000\034 @ \034\000<"
	.ascii	"`0`<\000l\020\020l\000\000\234\240`<\000\000dTTL\000"
	.ascii	"\000\010>AA\000\000\000\000w\000\000\000\000AA>\010"
	.ascii	"\000\002\001\002\001\000\000\020 @8\007\000\000\177"
	.ascii	">\034\010\000"
	.bss
	.align	2
TickCount:
	.space	4
	.size	TickCount, 4
	.text
	.align	1
	.global	SysTick_Handler
	.syntax unified
	.thumb
	.thumb_func
	.type	SysTick_Handler, %function
SysTick_Handler:
.LFB3:
	.file 1 "display.c"
	.loc 1 105 23
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	.cfi_def_cfa_offset 4
	.cfi_offset 7, -4
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 106 14
	ldr	r3, .L2
	ldr	r3, [r3]
	adds	r3, r3, #1
	ldr	r2, .L2
	str	r3, [r2]
	.loc 1 107 1
	nop
	mov	sp, r7
	.cfi_def_cfa_register 13
	@ sp needed
	pop	{r7}
	.cfi_restore 7
	.cfi_def_cfa_offset 0
	bx	lr
.L3:
	.align	2
.L2:
	.word	TickCount
	.cfi_endproc
.LFE3:
	.size	SysTick_Handler, .-SysTick_Handler
	.align	1
	.global	delay_init
	.syntax unified
	.thumb
	.thumb_func
	.type	delay_init, %function
delay_init:
.LFB4:
	.loc 1 109 18
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	.cfi_def_cfa_offset 4
	.cfi_offset 7, -4
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 110 8
	ldr	r3, .L5
	.loc 1 110 54
	movs	r2, #0
	strb	r2, [r3, #35]
	.loc 1 111 12
	ldr	r3, .L5+4
	.loc 1 111 19
	movs	r2, #6
	str	r2, [r3]
	.loc 1 112 1
	nop
	mov	sp, r7
	.cfi_def_cfa_register 13
	@ sp needed
	pop	{r7}
	.cfi_restore 7
	.cfi_def_cfa_offset 0
	bx	lr
.L6:
	.align	2
.L5:
	.word	-536810240
	.word	-536813552
	.cfi_endproc
.LFE4:
	.size	delay_init, .-delay_init
	.align	1
	.global	delay_us
	.syntax unified
	.thumb
	.thumb_func
	.type	delay_us, %function
delay_us:
.LFB5:
	.loc 1 115 27
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	.cfi_def_cfa_offset 4
	.cfi_offset 7, -4
	sub	sp, sp, #20
	.cfi_def_cfa_offset 24
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	strd	r0, [r7]
	.loc 1 116 15
	ldr	r1, .L12
	movs	r0, #0
	str	r0, [r1]
	.loc 1 117 12
	ldr	r1, .L12+4
	.loc 1 117 20
	movs	r0, #83
	str	r0, [r1, #4]
	.loc 1 118 12
	ldr	r1, .L12+4
	.loc 1 118 20
	movs	r0, #0
	str	r0, [r1, #8]
	.loc 1 119 19
	ldr	r1, .L12+4
	ldr	r1, [r1]
	ldr	r0, .L12+4
	orr	r1, r1, #1
	str	r1, [r0]
	.loc 1 120 7
	ldrd	r0, [r7]
	orrs	r1, r1, r0
	beq	.L11
	.loc 1 123 14
	ldr	r1, .L12
	ldr	r1, [r1]
	str	r1, [r7, #12]
.L10:
	.loc 1 125 9 discriminator 1
	.syntax unified
@ 125 "display.c" 1
	nop
@ 0 "" 2
	.loc 1 126 24 discriminator 1
	.thumb
	.syntax unified
	ldr	r1, .L12
	ldr	r0, [r1]
	ldr	r1, [r7, #12]
	subs	r1, r0, r1
	movs	r0, #0
	mov	r2, r1
	mov	r3, r0
	.loc 1 126 32 discriminator 1
	ldrd	r0, [r7]
	cmp	r2, r0
	sbcs	r1, r3, r1
	bcc	.L10
	.loc 1 127 19
	ldr	r3, .L12+4
	ldr	r3, [r3]
	ldr	r2, .L12+4
	bic	r3, r3, #1
	str	r3, [r2]
	b	.L7
.L11:
	.loc 1 121 9
	nop
.L7:
	.loc 1 128 1
	adds	r7, r7, #20
	.cfi_def_cfa_offset 4
	mov	sp, r7
	.cfi_def_cfa_register 13
	@ sp needed
	pop	{r7}
	.cfi_restore 7
	.cfi_def_cfa_offset 0
	bx	lr
.L13:
	.align	2
.L12:
	.word	TickCount
	.word	-536813552
	.cfi_endproc
.LFE5:
	.size	delay_us, .-delay_us
	.align	1
	.global	delay_ms
	.syntax unified
	.thumb
	.thumb_func
	.type	delay_ms, %function
delay_ms:
.LFB6:
	.loc 1 130 27
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	.cfi_def_cfa_offset 4
	.cfi_offset 7, -4
	sub	sp, sp, #20
	.cfi_def_cfa_offset 24
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	strd	r0, [r7]
	.loc 1 131 15
	ldr	r1, .L19
	movs	r0, #0
	str	r0, [r1]
	.loc 1 132 12
	ldr	r1, .L19+4
	.loc 1 132 20
	ldr	r0, .L19+8
	str	r0, [r1, #4]
	.loc 1 133 12
	ldr	r1, .L19+4
	.loc 1 133 20
	movs	r0, #0
	str	r0, [r1, #8]
	.loc 1 134 19
	ldr	r1, .L19+4
	ldr	r1, [r1]
	ldr	r0, .L19+4
	orr	r1, r1, #1
	str	r1, [r0]
	.loc 1 135 7
	ldrd	r0, [r7]
	orrs	r1, r1, r0
	beq	.L18
	.loc 1 138 14
	ldr	r1, .L19
	ldr	r1, [r1]
	str	r1, [r7, #12]
.L17:
	.loc 1 140 9 discriminator 1
	.syntax unified
@ 140 "display.c" 1
	nop
@ 0 "" 2
	.loc 1 141 24 discriminator 1
	.thumb
	.syntax unified
	ldr	r1, .L19
	ldr	r0, [r1]
	ldr	r1, [r7, #12]
	subs	r1, r0, r1
	movs	r0, #0
	mov	r2, r1
	mov	r3, r0
	.loc 1 141 32 discriminator 1
	ldrd	r0, [r7]
	cmp	r2, r0
	sbcs	r1, r3, r1
	bcc	.L17
	.loc 1 142 19
	ldr	r3, .L19+4
	ldr	r3, [r3]
	ldr	r2, .L19+4
	bic	r3, r3, #1
	str	r3, [r2]
	b	.L14
.L18:
	.loc 1 136 9
	nop
.L14:
	.loc 1 143 1
	adds	r7, r7, #20
	.cfi_def_cfa_offset 4
	mov	sp, r7
	.cfi_def_cfa_register 13
	@ sp needed
	pop	{r7}
	.cfi_restore 7
	.cfi_def_cfa_offset 0
	bx	lr
.L20:
	.align	2
.L19:
	.word	TickCount
	.word	-536813552
	.word	83999
	.cfi_endproc
.LFE6:
	.size	delay_ms, .-delay_ms
	.align	1
	.global	spi_init
	.syntax unified
	.thumb
	.thumb_func
	.type	spi_init, %function
spi_init:
.LFB7:
	.loc 1 146 16
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	.cfi_def_cfa_offset 4
	.cfi_offset 7, -4
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 148 20
	ldr	r3, .L22
	ldr	r3, [r3, #16]
	ldr	r2, .L22
	orr	r3, r3, #22528
	str	r3, [r2, #16]
	.loc 1 151 9
	ldr	r3, .L22+4
	.loc 1 151 20
	mov	r2, #134217728
	str	r2, [r3]
	.loc 1 152 9
	ldr	r3, .L22+4
	.loc 1 152 20
	mov	r2, #134217728
	str	r2, [r3, #16]
	.loc 1 153 9
	ldr	r3, .L22+4
	.loc 1 153 20
	mov	r2, #134217728
	str	r2, [r3, #36]
	.loc 1 154 9
	ldr	r3, .L22+4
	.loc 1 154 20
	mov	r2, #134217728
	str	r2, [r3, #52]
	.loc 1 155 9
	ldr	r3, .L22+4
	.loc 1 155 20
	mov	r2, #134217728
	str	r2, [r3, #68]
	.loc 1 156 9
	ldr	r3, .L22+4
	.loc 1 156 20
	mov	r2, #134217728
	str	r2, [r3, #84]
	.loc 1 157 9
	ldr	r3, .L22+4
	.loc 1 157 20
	mov	r2, #134217728
	str	r2, [r3, #96]
	.loc 1 158 9
	ldr	r3, .L22+4
	.loc 1 158 20
	mov	r2, #134217728
	str	r2, [r3, #164]
	.loc 1 160 9
	ldr	r3, .L22+8
	.loc 1 160 20
	mov	r2, #268435456
	str	r2, [r3]
	.loc 1 161 9
	ldr	r3, .L22+8
	.loc 1 161 20
	mov	r2, #268435456
	str	r2, [r3, #16]
	.loc 1 162 9
	ldr	r3, .L22+8
	.loc 1 162 20
	mov	r2, #268435456
	str	r2, [r3, #36]
	.loc 1 163 9
	ldr	r3, .L22+8
	.loc 1 163 20
	mov	r2, #268435456
	str	r2, [r3, #52]
	.loc 1 164 9
	ldr	r3, .L22+8
	.loc 1 164 20
	mov	r2, #268435456
	str	r2, [r3, #68]
	.loc 1 165 9
	ldr	r3, .L22+8
	.loc 1 165 20
	mov	r2, #268435456
	str	r2, [r3, #84]
	.loc 1 166 9
	ldr	r3, .L22+8
	.loc 1 166 20
	mov	r2, #268435456
	str	r2, [r3, #96]
	.loc 1 167 9
	ldr	r3, .L22+8
	.loc 1 167 20
	mov	r2, #268435456
	str	r2, [r3, #164]
	.loc 1 169 9
	ldr	r3, .L22+12
	.loc 1 169 20
	movs	r2, #128
	str	r2, [r3]
	.loc 1 170 9
	ldr	r3, .L22+12
	.loc 1 170 20
	movs	r2, #128
	str	r2, [r3, #16]
	.loc 1 171 9
	ldr	r3, .L22+12
	.loc 1 171 20
	movs	r2, #128
	str	r2, [r3, #36]
	.loc 1 172 9
	ldr	r3, .L22+12
	.loc 1 172 20
	movs	r2, #128
	str	r2, [r3, #52]
	.loc 1 173 9
	ldr	r3, .L22+12
	.loc 1 173 20
	movs	r2, #128
	str	r2, [r3, #68]
	.loc 1 174 9
	ldr	r3, .L22+12
	.loc 1 174 20
	movs	r2, #128
	str	r2, [r3, #84]
	.loc 1 175 9
	ldr	r3, .L22+12
	.loc 1 175 20
	movs	r2, #128
	str	r2, [r3, #96]
	.loc 1 176 9
	ldr	r3, .L22+12
	.loc 1 176 20
	movs	r2, #128
	str	r2, [r3, #164]
	.loc 1 179 1
	nop
	mov	sp, r7
	.cfi_def_cfa_register 13
	@ sp needed
	pop	{r7}
	.cfi_restore 7
	.cfi_def_cfa_offset 0
	bx	lr
.L23:
	.align	2
.L22:
	.word	1074660864
	.word	1074663424
	.word	1074662912
	.word	1074664448
	.cfi_endproc
.LFE7:
	.size	spi_init, .-spi_init
	.align	1
	.global	spi_set_cs
	.syntax unified
	.thumb
	.thumb_func
	.type	spi_set_cs, %function
spi_set_cs:
.LFB8:
	.loc 1 181 27
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	.cfi_def_cfa_offset 4
	.cfi_offset 7, -4
	sub	sp, sp, #12
	.cfi_def_cfa_offset 16
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	mov	r3, r0
	strb	r3, [r7, #7]
	.loc 1 182 7
	ldrb	r3, [r7, #7]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L25
	.loc 1 183 13
	ldr	r3, .L28
	.loc 1 183 24
	mov	r2, #268435456
	str	r2, [r3, #52]
	.loc 1 187 1
	b	.L27
.L25:
	.loc 1 185 13
	ldr	r3, .L28
	.loc 1 185 24
	mov	r2, #268435456
	str	r2, [r3, #48]
.L27:
	.loc 1 187 1
	nop
	adds	r7, r7, #12
	.cfi_def_cfa_offset 4
	mov	sp, r7
	.cfi_def_cfa_register 13
	@ sp needed
	pop	{r7}
	.cfi_restore 7
	.cfi_def_cfa_offset 0
	bx	lr
.L29:
	.align	2
.L28:
	.word	1074662912
	.cfi_endproc
.LFE8:
	.size	spi_set_cs, .-spi_set_cs
	.align	1
	.global	spi_send_8
	.syntax unified
	.thumb
	.thumb_func
	.type	spi_send_8, %function
spi_send_8:
.LFB9:
	.loc 1 189 30
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	sub	sp, sp, #16
	.cfi_def_cfa_offset 24
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	mov	r3, r0
	strb	r3, [r7, #7]
	.loc 1 191 24
	ldrb	r3, [r7, #7]	@ zero_extendqisi2
	lsls	r3, r3, #7
	.loc 1 191 30
	sxtb	r2, r3
	.loc 1 191 47
	ldrb	r3, [r7, #7]	@ zero_extendqisi2
	lsls	r3, r3, #5
	sxtb	r3, r3
	and	r3, r3, #64
	sxtb	r3, r3
	.loc 1 191 30
	orrs	r3, r3, r2
	sxtb	r2, r3
	.loc 1 191 70
	ldrb	r3, [r7, #7]	@ zero_extendqisi2
	lsls	r3, r3, #3
	sxtb	r3, r3
	and	r3, r3, #32
	sxtb	r3, r3
	.loc 1 191 53
	orrs	r3, r3, r2
	sxtb	r2, r3
	.loc 1 191 93
	ldrb	r3, [r7, #7]	@ zero_extendqisi2
	lsls	r3, r3, #1
	sxtb	r3, r3
	and	r3, r3, #16
	sxtb	r3, r3
	.loc 1 191 76
	orrs	r3, r3, r2
	sxtb	r2, r3
	.loc 1 192 24
	ldrb	r3, [r7, #7]	@ zero_extendqisi2
	asrs	r3, r3, #1
	sxtb	r3, r3
	and	r3, r3, #8
	sxtb	r3, r3
	.loc 1 191 99
	orrs	r3, r3, r2
	sxtb	r2, r3
	.loc 1 192 47
	ldrb	r3, [r7, #7]	@ zero_extendqisi2
	asrs	r3, r3, #3
	sxtb	r3, r3
	and	r3, r3, #4
	sxtb	r3, r3
	.loc 1 192 30
	orrs	r3, r3, r2
	sxtb	r2, r3
	.loc 1 192 70
	ldrb	r3, [r7, #7]	@ zero_extendqisi2
	asrs	r3, r3, #5
	sxtb	r3, r3
	and	r3, r3, #2
	sxtb	r3, r3
	.loc 1 192 53
	orrs	r3, r3, r2
	sxtb	r2, r3
	.loc 1 192 93
	ldrb	r3, [r7, #7]	@ zero_extendqisi2
	lsrs	r3, r3, #7
	uxtb	r3, r3
	sxtb	r3, r3
	.loc 1 192 76
	orrs	r3, r3, r2
	sxtb	r3, r3
	.loc 1 190 13
	strb	r3, [r7, #14]
	.loc 1 193 10
	ldrb	r3, [r7, #14]
	strb	r3, [r7, #7]
	.loc 1 194 5
	movs	r0, #0
	bl	spi_set_cs
.LBB2:
	.loc 1 195 18
	movs	r3, #0
	strb	r3, [r7, #15]
	.loc 1 195 5
	b	.L31
.L34:
	.loc 1 196 13
	ldr	r3, .L35
	.loc 1 196 24
	mov	r2, #134217728
	str	r2, [r3, #52]
	.loc 1 197 12
	ldrb	r2, [r7, #7]	@ zero_extendqisi2
	ldrb	r3, [r7, #15]	@ zero_extendqisi2
	asr	r3, r2, r3
	and	r3, r3, #1
	.loc 1 197 11
	cmp	r3, #0
	beq	.L32
	.loc 1 198 17
	ldr	r3, .L35+4
	.loc 1 198 28
	movs	r2, #128
	str	r2, [r3, #48]
	b	.L33
.L32:
	.loc 1 200 17
	ldr	r3, .L35+4
	.loc 1 200 28
	movs	r2, #128
	str	r2, [r3, #52]
.L33:
	.loc 1 202 9 discriminator 2
	mov	r0, #1
	mov	r1, #0
	bl	delay_us
	.loc 1 203 13 discriminator 2
	ldr	r3, .L35
	.loc 1 203 24 discriminator 2
	mov	r2, #134217728
	str	r2, [r3, #48]
	.loc 1 204 9 discriminator 2
	mov	r0, #1
	mov	r1, #0
	bl	delay_us
	.loc 1 195 41 discriminator 2
	ldrb	r3, [r7, #15]	@ zero_extendqisi2
	adds	r3, r3, #1
	strb	r3, [r7, #15]
.L31:
	.loc 1 195 32 discriminator 1
	ldrb	r3, [r7, #15]	@ zero_extendqisi2
	cmp	r3, #7
	bls	.L34
.LBE2:
	.loc 1 206 5
	movs	r0, #1
	bl	spi_set_cs
	.loc 1 207 1
	nop
	adds	r7, r7, #16
	.cfi_def_cfa_offset 8
	mov	sp, r7
	.cfi_def_cfa_register 13
	@ sp needed
	pop	{r7, pc}
.L36:
	.align	2
.L35:
	.word	1074663424
	.word	1074664448
	.cfi_endproc
.LFE9:
	.size	spi_send_8, .-spi_send_8
	.align	1
	.global	display_init
	.syntax unified
	.thumb
	.thumb_func
	.type	display_init, %function
display_init:
.LFB10:
	.loc 1 209 20
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 210 5
	bl	delay_init
	.loc 1 211 2
	bl	spi_init
	.loc 1 212 6
	ldr	r3, .L38
	.loc 1 212 17
	mov	r2, #2097152
	str	r2, [r3]
	.loc 1 213 9
	ldr	r3, .L38
	.loc 1 213 20
	mov	r2, #2097152
	str	r2, [r3, #16]
	.loc 1 214 9
	ldr	r3, .L38
	.loc 1 214 20
	mov	r2, #2097152
	str	r2, [r3, #36]
	.loc 1 215 9
	ldr	r3, .L38
	.loc 1 215 20
	mov	r2, #2097152
	str	r2, [r3, #52]
	.loc 1 216 9
	ldr	r3, .L38
	.loc 1 216 20
	mov	r2, #2097152
	str	r2, [r3, #68]
	.loc 1 217 9
	ldr	r3, .L38
	.loc 1 217 20
	mov	r2, #2097152
	str	r2, [r3, #84]
	.loc 1 218 9
	ldr	r3, .L38
	.loc 1 218 20
	mov	r2, #2097152
	str	r2, [r3, #96]
	.loc 1 219 9
	ldr	r3, .L38
	.loc 1 219 20
	mov	r2, #2097152
	str	r2, [r3, #164]
	.loc 1 221 9
	ldr	r3, .L38
	.loc 1 221 20
	mov	r2, #4194304
	str	r2, [r3]
	.loc 1 222 9
	ldr	r3, .L38
	.loc 1 222 20
	mov	r2, #4194304
	str	r2, [r3, #16]
	.loc 1 223 9
	ldr	r3, .L38
	.loc 1 223 20
	mov	r2, #4194304
	str	r2, [r3, #36]
	.loc 1 224 9
	ldr	r3, .L38
	.loc 1 224 20
	mov	r2, #4194304
	str	r2, [r3, #52]
	.loc 1 225 9
	ldr	r3, .L38
	.loc 1 225 20
	mov	r2, #4194304
	str	r2, [r3, #68]
	.loc 1 226 9
	ldr	r3, .L38
	.loc 1 226 20
	mov	r2, #4194304
	str	r2, [r3, #84]
	.loc 1 227 9
	ldr	r3, .L38
	.loc 1 227 20
	mov	r2, #4194304
	str	r2, [r3, #96]
	.loc 1 228 9
	ldr	r3, .L38
	.loc 1 228 20
	mov	r2, #4194304
	str	r2, [r3, #164]
	.loc 1 230 2
	movs	r0, #1
	bl	spi_set_cs
	.loc 1 231 9
	ldr	r3, .L38
	.loc 1 231 20
	mov	r2, #2097152
	str	r2, [r3, #52]
	.loc 1 232 9
	ldr	r3, .L38
	.loc 1 232 20
	mov	r2, #4194304
	str	r2, [r3, #52]
	.loc 1 233 5
	mov	r0, #162
	mov	r1, #0
	bl	delay_ms
	.loc 1 234 9
	ldr	r3, .L38
	.loc 1 234 20
	mov	r2, #4194304
	str	r2, [r3, #48]
	.loc 1 235 5
	movs	r0, #0
	bl	spi_set_cs
	.loc 1 237 5
	movs	r0, #64
	bl	spi_send_8
	.loc 1 238 5
	movs	r0, #161
	bl	spi_send_8
	.loc 1 239 5
	movs	r0, #192
	bl	spi_send_8
	.loc 1 240 5
	movs	r0, #166
	bl	spi_send_8
	.loc 1 241 5
	movs	r0, #162
	bl	spi_send_8
	.loc 1 242 5
	movs	r0, #47
	bl	spi_send_8
	.loc 1 243 5
	movs	r0, #248
	bl	spi_send_8
	.loc 1 244 5
	movs	r0, #0
	bl	spi_send_8
	.loc 1 245 5
	movs	r0, #39
	bl	spi_send_8
	.loc 1 246 5
	movs	r0, #129
	bl	spi_send_8
	.loc 1 247 5
	movs	r0, #5
	bl	spi_send_8
	.loc 1 248 5
	movs	r0, #172
	bl	spi_send_8
	.loc 1 249 5
	movs	r0, #0
	bl	spi_send_8
	.loc 1 250 5
	movs	r0, #175
	bl	spi_send_8
	.loc 1 252 5
	mov	r0, #100
	mov	r1, #0
	bl	delay_ms
	.loc 1 253 5
	movs	r0, #165
	bl	spi_send_8
	.loc 1 254 5
	mov	r0, #100
	mov	r1, #0
	bl	delay_ms
	.loc 1 255 5
	mov	r0, #100
	mov	r1, #0
	bl	delay_ms
	.loc 1 256 5
	movs	r0, #164
	bl	spi_send_8
	.loc 1 257 5
	movs	r0, #1
	bl	spi_set_cs
	.loc 1 258 1
	nop
	pop	{r7, pc}
.L39:
	.align	2
.L38:
	.word	1074663936
	.cfi_endproc
.LFE10:
	.size	display_init, .-display_init
	.align	1
	.global	display_clear
	.syntax unified
	.thumb
	.thumb_func
	.type	display_clear, %function
display_clear:
.LFB11:
	.loc 1 260 21
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	sub	sp, sp, #8
	.cfi_def_cfa_offset 16
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 262 5
	movs	r0, #0
	bl	spi_set_cs
	.loc 1 263 11
	movs	r3, #0
	strb	r3, [r7, #7]
	.loc 1 263 5
	b	.L41
.L44:
	.loc 1 264 13
	ldr	r3, .L45
	.loc 1 264 24
	mov	r2, #2097152
	str	r2, [r3, #52]
	.loc 1 265 9
	ldrb	r3, [r7, #7]
	orn	r3, r3, #79
	uxtb	r3, r3
	mov	r0, r3
	bl	spi_send_8
	.loc 1 266 9
	movs	r0, #16
	bl	spi_send_8
	.loc 1 267 9
	movs	r0, #4
	bl	spi_send_8
	.loc 1 268 13
	ldr	r3, .L45
	.loc 1 268 24
	mov	r2, #2097152
	str	r2, [r3, #48]
	.loc 1 269 15
	movs	r3, #0
	strb	r3, [r7, #6]
	.loc 1 269 9
	b	.L42
.L43:
	.loc 1 270 13 discriminator 3
	movs	r0, #0
	bl	spi_send_8
	.loc 1 269 32 discriminator 3
	ldrb	r3, [r7, #6]	@ zero_extendqisi2
	adds	r3, r3, #1
	strb	r3, [r7, #6]
.L42:
	.loc 1 269 22 discriminator 1
	ldrsb	r3, [r7, #6]
	cmp	r3, #0
	bge	.L43
	.loc 1 263 31 discriminator 2
	ldrb	r3, [r7, #7]	@ zero_extendqisi2
	adds	r3, r3, #1
	strb	r3, [r7, #7]
.L41:
	.loc 1 263 18 discriminator 1
	ldrb	r3, [r7, #7]	@ zero_extendqisi2
	cmp	r3, #7
	bls	.L44
	.loc 1 273 5
	movs	r0, #1
	bl	spi_set_cs
	.loc 1 274 1
	nop
	adds	r7, r7, #8
	.cfi_def_cfa_offset 8
	mov	sp, r7
	.cfi_def_cfa_register 13
	@ sp needed
	pop	{r7, pc}
.L46:
	.align	2
.L45:
	.word	1074663936
	.cfi_endproc
.LFE11:
	.size	display_clear, .-display_clear
	.align	1
	.global	display_char
	.syntax unified
	.thumb
	.thumb_func
	.type	display_char, %function
display_char:
.LFB12:
	.loc 1 276 48
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	sub	sp, sp, #16
	.cfi_def_cfa_offset 24
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	mov	r3, r0
	strb	r3, [r7, #7]
	mov	r3, r1
	strb	r3, [r7, #6]
	mov	r3, r2
	strb	r3, [r7, #5]
	.loc 1 278 4
	ldrb	r3, [r7, #6]	@ zero_extendqisi2
	lsrs	r3, r3, #3
	strb	r3, [r7, #6]
	.loc 1 279 6
	ldr	r3, .L51
	.loc 1 279 17
	mov	r2, #2097152
	str	r2, [r3, #52]
	.loc 1 280 2
	ldrb	r3, [r7, #6]
	orn	r3, r3, #79
	uxtb	r3, r3
	mov	r0, r3
	bl	spi_send_8
	.loc 1 281 2
	ldrb	r3, [r7, #7]	@ zero_extendqisi2
	lsrs	r3, r3, #4
	uxtb	r3, r3
	orr	r3, r3, #16
	uxtb	r3, r3
	mov	r0, r3
	bl	spi_send_8
	.loc 1 282 2
	ldrb	r3, [r7, #7]
	and	r3, r3, #15
	uxtb	r3, r3
	mov	r0, r3
	bl	spi_send_8
	.loc 1 283 6
	ldr	r3, .L51
	.loc 1 283 17
	mov	r2, #2097152
	str	r2, [r3, #48]
	.loc 1 284 8
	movs	r3, #0
	strb	r3, [r7, #15]
	.loc 1 284 2
	b	.L48
.L49:
	.loc 1 285 22 discriminator 3
	ldrb	r3, [r7, #5]	@ zero_extendqisi2
	sub	r2, r3, #32
	.loc 1 285 28 discriminator 3
	mov	r3, r2
	lsls	r3, r3, #1
	add	r3, r3, r2
	lsls	r3, r3, #1
	mov	r2, r3
	.loc 1 285 35 discriminator 3
	ldrb	r3, [r7, #15]	@ zero_extendqisi2
	add	r3, r3, r2
	.loc 1 285 3 discriminator 3
	ldr	r2, .L51+4
	ldrb	r3, [r2, r3]	@ zero_extendqisi2
	mov	r0, r3
	bl	spi_send_8
	.loc 1 284 25 discriminator 3
	ldrb	r3, [r7, #15]	@ zero_extendqisi2
	adds	r3, r3, #1
	strb	r3, [r7, #15]
.L48:
	.loc 1 284 15 discriminator 1
	ldrb	r3, [r7, #15]	@ zero_extendqisi2
	cmp	r3, #5
	bls	.L49
	.loc 1 287 2
	nop
	.loc 1 288 1
	adds	r7, r7, #16
	.cfi_def_cfa_offset 8
	mov	sp, r7
	.cfi_def_cfa_register 13
	@ sp needed
	pop	{r7, pc}
.L52:
	.align	2
.L51:
	.word	1074663936
	.word	font
	.cfi_endproc
.LFE12:
	.size	display_char, .-display_char
	.align	1
	.global	display_str
	.syntax unified
	.thumb
	.thumb_func
	.type	display_str, %function
display_str:
.LFB13:
	.loc 1 290 50
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	sub	sp, sp, #16
	.cfi_def_cfa_offset 24
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	mov	r3, r0
	str	r2, [r7]
	strb	r3, [r7, #7]
	mov	r3, r1
	strb	r3, [r7, #6]
	.loc 1 292 5
	ldr	r3, [r7]
	cmp	r3, #0
	beq	.L58
	.loc 1 293 7
	b	.L56
.L57:
	.loc 1 294 8
	ldrb	r3, [r7, #7]
	adds	r3, r3, #6
	strb	r3, [r7, #7]
	.loc 1 295 5
	ldr	r3, [r7]
	ldrb	r3, [r3]
	strb	r3, [r7, #15]
	.loc 1 296 3
	ldrb	r2, [r7, #15]	@ zero_extendqisi2
	ldrb	r1, [r7, #6]	@ zero_extendqisi2
	ldrb	r3, [r7, #7]	@ zero_extendqisi2
	mov	r0, r3
	bl	display_char
	.loc 1 297 6
	ldr	r3, [r7]
	adds	r3, r3, #1
	str	r3, [r7]
.L56:
	.loc 1 293 8
	ldr	r3, [r7]
	ldrb	r3, [r3]	@ zero_extendqisi2
	.loc 1 293 13
	cmp	r3, #0
	bne	.L57
	b	.L53
.L58:
	.loc 1 292 19
	nop
.L53:
	.loc 1 299 1
	adds	r7, r7, #16
	.cfi_def_cfa_offset 8
	mov	sp, r7
	.cfi_def_cfa_register 13
	@ sp needed
	pop	{r7, pc}
	.cfi_endproc
.LFE13:
	.size	display_str, .-display_str
	.section	.rodata
	.align	2
.LC0:
	.ascii	"0000000000\000"
	.text
	.align	1
	.global	display_num
	.syntax unified
	.thumb
	.thumb_func
	.type	display_num, %function
display_num:
.LFB14:
	.loc 1 301 68
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	sub	sp, sp, #24
	.cfi_def_cfa_offset 32
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	str	r2, [r7]
	mov	r2, r3
	mov	r3, r0
	strb	r3, [r7, #7]
	mov	r3, r1
	strb	r3, [r7, #6]
	mov	r3, r2
	strb	r3, [r7, #5]
	.loc 1 302 7
	ldr	r2, .L66
	add	r3, r7, #8
	ldm	r2, {r0, r1, r2}
	stmia	r3!, {r0, r1}
	strh	r2, [r3]	@ movhi
	adds	r3, r3, #2
	lsrs	r2, r2, #16
	strb	r2, [r3]
	.loc 1 304 9
	ldrb	r3, [r7, #5]
	strb	r3, [r7, #23]
	.loc 1 306 5
	ldrsb	r3, [r7, #23]
	cmp	r3, #10
	bgt	.L65
	.loc 1 308 5
	ldrsb	r3, [r7, #23]
	.loc 1 308 8
	adds	r3, r3, #24
	add	r3, r3, r7
	movs	r2, #0
	strb	r2, [r3, #-16]
	.loc 1 309 7
	b	.L62
.L63:
	.loc 1 310 15
	ldr	r1, [r7]
	ldr	r3, .L66+4
	umull	r2, r3, r3, r1
	lsrs	r2, r3, #3
	mov	r3, r2
	lsls	r3, r3, #2
	add	r3, r3, r2
	lsls	r3, r3, #1
	subs	r2, r1, r3
	.loc 1 310 9
	mov	r3, r2
	strb	r3, [r7, #22]
	.loc 1 311 11
	ldr	r3, [r7]
	ldr	r2, .L66+4
	umull	r2, r3, r2, r3
	lsrs	r3, r3, #3
	str	r3, [r7]
	.loc 1 312 7
	ldrsb	r3, [r7, #23]
	.loc 1 312 15
	ldrb	r2, [r7, #22]
	adds	r2, r2, #48
	uxtb	r2, r2
	.loc 1 312 11
	adds	r3, r3, #24
	add	r3, r3, r7
	strb	r2, [r3, #-16]
.L62:
	.loc 1 309 8
	ldrb	r3, [r7, #23]	@ zero_extendqisi2
	subs	r3, r3, #1
	uxtb	r3, r3
	.loc 1 309 12
	strb	r3, [r7, #23]
	ldrsb	r3, [r7, #23]
	cmp	r3, #0
	bge	.L63
	.loc 1 314 2
	add	r2, r7, #8
	ldrb	r1, [r7, #6]	@ zero_extendqisi2
	ldrb	r3, [r7, #7]	@ zero_extendqisi2
	mov	r0, r3
	bl	display_str
	.loc 1 315 2
	b	.L59
.L65:
	.loc 1 306 12
	nop
.L59:
	.loc 1 316 1
	adds	r7, r7, #24
	.cfi_def_cfa_offset 8
	mov	sp, r7
	.cfi_def_cfa_register 13
	@ sp needed
	pop	{r7, pc}
.L67:
	.align	2
.L66:
	.word	.LC0
	.word	-858993459
	.cfi_endproc
.LFE14:
	.size	display_num, .-display_num
.Letext0:
	.file 2 "/Applications/ARM/arm-none-eabi/include/machine/_default_types.h"
	.file 3 "/Applications/ARM/arm-none-eabi/include/sys/_stdint.h"
	.file 4 "./system/core_cm3.h"
	.file 5 "./system/component/pio.h"
	.file 6 "./system/component/pmc.h"
	.file 7 "./system/sam3x8e.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0xb73
	.2byte	0x5
	.byte	0x1
	.byte	0x4
	.4byte	.Ldebug_abbrev0
	.uleb128 0x18
	.4byte	.LASF183
	.byte	0x1d
	.4byte	.LASF184
	.4byte	.LASF185
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.uleb128 0x9
	.4byte	.LASF0
	.byte	0x2
	.byte	0x29
	.byte	0x17
	.4byte	0x32
	.uleb128 0x5
	.byte	0x1
	.byte	0x6
	.4byte	.LASF2
	.uleb128 0x9
	.4byte	.LASF1
	.byte	0x2
	.byte	0x2b
	.byte	0x18
	.4byte	0x45
	.uleb128 0x5
	.byte	0x1
	.byte	0x8
	.4byte	.LASF3
	.uleb128 0x5
	.byte	0x2
	.byte	0x5
	.4byte	.LASF4
	.uleb128 0x5
	.byte	0x2
	.byte	0x7
	.4byte	.LASF5
	.uleb128 0x5
	.byte	0x4
	.byte	0x5
	.4byte	.LASF6
	.uleb128 0x9
	.4byte	.LASF7
	.byte	0x2
	.byte	0x4f
	.byte	0x19
	.4byte	0x6d
	.uleb128 0x5
	.byte	0x4
	.byte	0x7
	.4byte	.LASF8
	.uleb128 0x5
	.byte	0x8
	.byte	0x5
	.4byte	.LASF9
	.uleb128 0x9
	.4byte	.LASF10
	.byte	0x2
	.byte	0x69
	.byte	0x19
	.4byte	0x87
	.uleb128 0x5
	.byte	0x8
	.byte	0x7
	.4byte	.LASF11
	.uleb128 0x19
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x5
	.byte	0x4
	.byte	0x7
	.4byte	.LASF12
	.uleb128 0x5
	.byte	0x8
	.byte	0x4
	.4byte	.LASF13
	.uleb128 0x1a
	.byte	0x4
	.4byte	0xa9
	.uleb128 0x5
	.byte	0x1
	.byte	0x8
	.4byte	.LASF14
	.uleb128 0x9
	.4byte	.LASF15
	.byte	0x3
	.byte	0x14
	.byte	0x12
	.4byte	0x26
	.uleb128 0x9
	.4byte	.LASF16
	.byte	0x3
	.byte	0x18
	.byte	0x13
	.4byte	0x39
	.uleb128 0x3
	.4byte	0xbc
	.uleb128 0x9
	.4byte	.LASF17
	.byte	0x3
	.byte	0x30
	.byte	0x14
	.4byte	0x61
	.uleb128 0x3
	.4byte	0xcd
	.uleb128 0xb
	.4byte	0xd9
	.uleb128 0x9
	.4byte	.LASF18
	.byte	0x3
	.byte	0x3c
	.byte	0x14
	.4byte	0x7b
	.uleb128 0x1b
	.4byte	.LASF186
	.byte	0x5
	.byte	0x1
	.4byte	0x32
	.byte	0x7
	.byte	0x39
	.byte	0xe
	.4byte	0x22e
	.uleb128 0xa
	.4byte	.LASF19
	.sleb128 -14
	.uleb128 0xa
	.4byte	.LASF20
	.sleb128 -12
	.uleb128 0xa
	.4byte	.LASF21
	.sleb128 -11
	.uleb128 0xa
	.4byte	.LASF22
	.sleb128 -10
	.uleb128 0xa
	.4byte	.LASF23
	.sleb128 -5
	.uleb128 0xa
	.4byte	.LASF24
	.sleb128 -4
	.uleb128 0xa
	.4byte	.LASF25
	.sleb128 -2
	.uleb128 0xa
	.4byte	.LASF26
	.sleb128 -1
	.uleb128 0x2
	.4byte	.LASF27
	.byte	0
	.uleb128 0x2
	.4byte	.LASF28
	.byte	0x1
	.uleb128 0x2
	.4byte	.LASF29
	.byte	0x2
	.uleb128 0x2
	.4byte	.LASF30
	.byte	0x3
	.uleb128 0x2
	.4byte	.LASF31
	.byte	0x4
	.uleb128 0x2
	.4byte	.LASF32
	.byte	0x5
	.uleb128 0x2
	.4byte	.LASF33
	.byte	0x6
	.uleb128 0x2
	.4byte	.LASF34
	.byte	0x7
	.uleb128 0x2
	.4byte	.LASF35
	.byte	0x8
	.uleb128 0x2
	.4byte	.LASF36
	.byte	0x9
	.uleb128 0x2
	.4byte	.LASF37
	.byte	0xb
	.uleb128 0x2
	.4byte	.LASF38
	.byte	0xc
	.uleb128 0x2
	.4byte	.LASF39
	.byte	0xd
	.uleb128 0x2
	.4byte	.LASF40
	.byte	0xe
	.uleb128 0x2
	.4byte	.LASF41
	.byte	0x11
	.uleb128 0x2
	.4byte	.LASF42
	.byte	0x12
	.uleb128 0x2
	.4byte	.LASF43
	.byte	0x13
	.uleb128 0x2
	.4byte	.LASF44
	.byte	0x14
	.uleb128 0x2
	.4byte	.LASF45
	.byte	0x15
	.uleb128 0x2
	.4byte	.LASF46
	.byte	0x16
	.uleb128 0x2
	.4byte	.LASF47
	.byte	0x17
	.uleb128 0x2
	.4byte	.LASF48
	.byte	0x18
	.uleb128 0x2
	.4byte	.LASF49
	.byte	0x1a
	.uleb128 0x2
	.4byte	.LASF50
	.byte	0x1b
	.uleb128 0x2
	.4byte	.LASF51
	.byte	0x1c
	.uleb128 0x2
	.4byte	.LASF52
	.byte	0x1d
	.uleb128 0x2
	.4byte	.LASF53
	.byte	0x1e
	.uleb128 0x2
	.4byte	.LASF54
	.byte	0x1f
	.uleb128 0x2
	.4byte	.LASF55
	.byte	0x20
	.uleb128 0x2
	.4byte	.LASF56
	.byte	0x21
	.uleb128 0x2
	.4byte	.LASF57
	.byte	0x22
	.uleb128 0x2
	.4byte	.LASF58
	.byte	0x23
	.uleb128 0x2
	.4byte	.LASF59
	.byte	0x24
	.uleb128 0x2
	.4byte	.LASF60
	.byte	0x25
	.uleb128 0x2
	.4byte	.LASF61
	.byte	0x26
	.uleb128 0x2
	.4byte	.LASF62
	.byte	0x27
	.uleb128 0x2
	.4byte	.LASF63
	.byte	0x28
	.uleb128 0x2
	.4byte	.LASF64
	.byte	0x29
	.uleb128 0x2
	.4byte	.LASF65
	.byte	0x2a
	.uleb128 0x2
	.4byte	.LASF66
	.byte	0x2b
	.uleb128 0x2
	.4byte	.LASF67
	.byte	0x2c
	.uleb128 0x2
	.4byte	.LASF68
	.byte	0x2d
	.byte	0
	.uleb128 0x13
	.byte	0x8c
	.2byte	0x175
	.4byte	0x333
	.uleb128 0x4
	.4byte	.LASF69
	.2byte	0x177
	.4byte	0xde
	.byte	0
	.uleb128 0x4
	.4byte	.LASF70
	.2byte	0x178
	.4byte	0xd9
	.byte	0x4
	.uleb128 0x4
	.4byte	.LASF71
	.2byte	0x179
	.4byte	0xd9
	.byte	0x8
	.uleb128 0x4
	.4byte	.LASF72
	.2byte	0x17a
	.4byte	0xd9
	.byte	0xc
	.uleb128 0xc
	.ascii	"SCR\000"
	.2byte	0x17b
	.4byte	0xd9
	.byte	0x10
	.uleb128 0xc
	.ascii	"CCR\000"
	.2byte	0x17c
	.4byte	0xd9
	.byte	0x14
	.uleb128 0xc
	.ascii	"SHP\000"
	.2byte	0x17d
	.4byte	0x343
	.byte	0x18
	.uleb128 0x4
	.4byte	.LASF73
	.2byte	0x17e
	.4byte	0xd9
	.byte	0x24
	.uleb128 0x4
	.4byte	.LASF74
	.2byte	0x17f
	.4byte	0xd9
	.byte	0x28
	.uleb128 0x4
	.4byte	.LASF75
	.2byte	0x180
	.4byte	0xd9
	.byte	0x2c
	.uleb128 0x4
	.4byte	.LASF76
	.2byte	0x181
	.4byte	0xd9
	.byte	0x30
	.uleb128 0x4
	.4byte	.LASF77
	.2byte	0x182
	.4byte	0xd9
	.byte	0x34
	.uleb128 0x4
	.4byte	.LASF78
	.2byte	0x183
	.4byte	0xd9
	.byte	0x38
	.uleb128 0x4
	.4byte	.LASF79
	.2byte	0x184
	.4byte	0xd9
	.byte	0x3c
	.uleb128 0xc
	.ascii	"PFR\000"
	.2byte	0x185
	.4byte	0x35d
	.byte	0x40
	.uleb128 0xc
	.ascii	"DFR\000"
	.2byte	0x186
	.4byte	0xde
	.byte	0x48
	.uleb128 0xc
	.ascii	"ADR\000"
	.2byte	0x187
	.4byte	0xde
	.byte	0x4c
	.uleb128 0x4
	.4byte	.LASF80
	.2byte	0x188
	.4byte	0x377
	.byte	0x50
	.uleb128 0x4
	.4byte	.LASF81
	.2byte	0x189
	.4byte	0x396
	.byte	0x60
	.uleb128 0x4
	.4byte	.LASF82
	.2byte	0x18a
	.4byte	0x3a5
	.byte	0x74
	.uleb128 0x4
	.4byte	.LASF83
	.2byte	0x18b
	.4byte	0xd9
	.byte	0x88
	.byte	0
	.uleb128 0x6
	.4byte	0xc8
	.4byte	0x343
	.uleb128 0x7
	.4byte	0x95
	.byte	0xb
	.byte	0
	.uleb128 0x3
	.4byte	0x333
	.uleb128 0x6
	.4byte	0xde
	.4byte	0x358
	.uleb128 0x7
	.4byte	0x95
	.byte	0x1
	.byte	0
	.uleb128 0xb
	.4byte	0x348
	.uleb128 0x3
	.4byte	0x358
	.uleb128 0x6
	.4byte	0xde
	.4byte	0x372
	.uleb128 0x7
	.4byte	0x95
	.byte	0x3
	.byte	0
	.uleb128 0xb
	.4byte	0x362
	.uleb128 0x3
	.4byte	0x372
	.uleb128 0x3
	.4byte	0x372
	.uleb128 0x6
	.4byte	0xde
	.4byte	0x391
	.uleb128 0x7
	.4byte	0x95
	.byte	0x4
	.byte	0
	.uleb128 0xb
	.4byte	0x381
	.uleb128 0x3
	.4byte	0x391
	.uleb128 0x3
	.4byte	0x391
	.uleb128 0x3
	.4byte	0x391
	.uleb128 0x6
	.4byte	0xcd
	.4byte	0x3b5
	.uleb128 0x7
	.4byte	0x95
	.byte	0x4
	.byte	0
	.uleb128 0x14
	.4byte	.LASF84
	.2byte	0x18c
	.4byte	0x22e
	.uleb128 0x13
	.byte	0x10
	.2byte	0x2b5
	.4byte	0x3f9
	.uleb128 0x4
	.4byte	.LASF85
	.2byte	0x2b7
	.4byte	0xd9
	.byte	0
	.uleb128 0x4
	.4byte	.LASF86
	.2byte	0x2b8
	.4byte	0xd9
	.byte	0x4
	.uleb128 0xc
	.ascii	"VAL\000"
	.2byte	0x2b9
	.4byte	0xd9
	.byte	0x8
	.uleb128 0x4
	.4byte	.LASF87
	.2byte	0x2ba
	.4byte	0xde
	.byte	0xc
	.byte	0
	.uleb128 0x14
	.4byte	.LASF88
	.2byte	0x2bb
	.4byte	0x3c0
	.uleb128 0x1c
	.byte	0xec
	.byte	0x5
	.byte	0x29
	.byte	0x9
	.4byte	0x696
	.uleb128 0x1
	.4byte	.LASF89
	.byte	0x5
	.byte	0x2a
	.4byte	0xd9
	.byte	0
	.uleb128 0x1
	.4byte	.LASF90
	.byte	0x5
	.byte	0x2b
	.4byte	0xd9
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF91
	.byte	0x5
	.byte	0x2c
	.4byte	0xde
	.byte	0x8
	.uleb128 0x1
	.4byte	.LASF92
	.byte	0x5
	.byte	0x2d
	.4byte	0x6ab
	.byte	0xc
	.uleb128 0x1
	.4byte	.LASF93
	.byte	0x5
	.byte	0x2e
	.4byte	0xd9
	.byte	0x10
	.uleb128 0x1
	.4byte	.LASF94
	.byte	0x5
	.byte	0x2f
	.4byte	0xd9
	.byte	0x14
	.uleb128 0x1
	.4byte	.LASF95
	.byte	0x5
	.byte	0x30
	.4byte	0xde
	.byte	0x18
	.uleb128 0x1
	.4byte	.LASF96
	.byte	0x5
	.byte	0x31
	.4byte	0x6b0
	.byte	0x1c
	.uleb128 0x1
	.4byte	.LASF97
	.byte	0x5
	.byte	0x32
	.4byte	0xd9
	.byte	0x20
	.uleb128 0x1
	.4byte	.LASF98
	.byte	0x5
	.byte	0x33
	.4byte	0xd9
	.byte	0x24
	.uleb128 0x1
	.4byte	.LASF99
	.byte	0x5
	.byte	0x34
	.4byte	0xde
	.byte	0x28
	.uleb128 0x1
	.4byte	.LASF100
	.byte	0x5
	.byte	0x35
	.4byte	0x6b5
	.byte	0x2c
	.uleb128 0x1
	.4byte	.LASF101
	.byte	0x5
	.byte	0x36
	.4byte	0xd9
	.byte	0x30
	.uleb128 0x1
	.4byte	.LASF102
	.byte	0x5
	.byte	0x37
	.4byte	0xd9
	.byte	0x34
	.uleb128 0x1
	.4byte	.LASF103
	.byte	0x5
	.byte	0x38
	.4byte	0xd9
	.byte	0x38
	.uleb128 0x1
	.4byte	.LASF104
	.byte	0x5
	.byte	0x39
	.4byte	0xde
	.byte	0x3c
	.uleb128 0x1
	.4byte	.LASF105
	.byte	0x5
	.byte	0x3a
	.4byte	0xd9
	.byte	0x40
	.uleb128 0x1
	.4byte	.LASF106
	.byte	0x5
	.byte	0x3b
	.4byte	0xd9
	.byte	0x44
	.uleb128 0x1
	.4byte	.LASF107
	.byte	0x5
	.byte	0x3c
	.4byte	0xde
	.byte	0x48
	.uleb128 0x1
	.4byte	.LASF108
	.byte	0x5
	.byte	0x3d
	.4byte	0xde
	.byte	0x4c
	.uleb128 0x1
	.4byte	.LASF109
	.byte	0x5
	.byte	0x3e
	.4byte	0xd9
	.byte	0x50
	.uleb128 0x1
	.4byte	.LASF110
	.byte	0x5
	.byte	0x3f
	.4byte	0xd9
	.byte	0x54
	.uleb128 0x1
	.4byte	.LASF111
	.byte	0x5
	.byte	0x40
	.4byte	0xde
	.byte	0x58
	.uleb128 0x1
	.4byte	.LASF112
	.byte	0x5
	.byte	0x41
	.4byte	0x6ba
	.byte	0x5c
	.uleb128 0x1
	.4byte	.LASF113
	.byte	0x5
	.byte	0x42
	.4byte	0xd9
	.byte	0x60
	.uleb128 0x1
	.4byte	.LASF114
	.byte	0x5
	.byte	0x43
	.4byte	0xd9
	.byte	0x64
	.uleb128 0x1
	.4byte	.LASF115
	.byte	0x5
	.byte	0x44
	.4byte	0xde
	.byte	0x68
	.uleb128 0x1
	.4byte	.LASF116
	.byte	0x5
	.byte	0x45
	.4byte	0x6bf
	.byte	0x6c
	.uleb128 0x1
	.4byte	.LASF117
	.byte	0x5
	.byte	0x46
	.4byte	0xd9
	.byte	0x70
	.uleb128 0x1
	.4byte	.LASF118
	.byte	0x5
	.byte	0x47
	.4byte	0x701
	.byte	0x74
	.uleb128 0x1
	.4byte	.LASF119
	.byte	0x5
	.byte	0x48
	.4byte	0xd9
	.byte	0x80
	.uleb128 0x1
	.4byte	.LASF120
	.byte	0x5
	.byte	0x49
	.4byte	0xd9
	.byte	0x84
	.uleb128 0x1
	.4byte	.LASF121
	.byte	0x5
	.byte	0x4a
	.4byte	0xde
	.byte	0x88
	.uleb128 0x1
	.4byte	.LASF122
	.byte	0x5
	.byte	0x4b
	.4byte	0xd9
	.byte	0x8c
	.uleb128 0x1
	.4byte	.LASF123
	.byte	0x5
	.byte	0x4c
	.4byte	0x37c
	.byte	0x90
	.uleb128 0x1
	.4byte	.LASF124
	.byte	0x5
	.byte	0x4d
	.4byte	0xd9
	.byte	0xa0
	.uleb128 0x1
	.4byte	.LASF125
	.byte	0x5
	.byte	0x4e
	.4byte	0xd9
	.byte	0xa4
	.uleb128 0x1
	.4byte	.LASF126
	.byte	0x5
	.byte	0x4f
	.4byte	0xde
	.byte	0xa8
	.uleb128 0x1
	.4byte	.LASF127
	.byte	0x5
	.byte	0x50
	.4byte	0x6c4
	.byte	0xac
	.uleb128 0x1
	.4byte	.LASF128
	.byte	0x5
	.byte	0x51
	.4byte	0xd9
	.byte	0xb0
	.uleb128 0x1
	.4byte	.LASF129
	.byte	0x5
	.byte	0x52
	.4byte	0xd9
	.byte	0xb4
	.uleb128 0x1
	.4byte	.LASF130
	.byte	0x5
	.byte	0x53
	.4byte	0xde
	.byte	0xb8
	.uleb128 0x1
	.4byte	.LASF131
	.byte	0x5
	.byte	0x54
	.4byte	0x6c9
	.byte	0xbc
	.uleb128 0x1
	.4byte	.LASF132
	.byte	0x5
	.byte	0x55
	.4byte	0xd9
	.byte	0xc0
	.uleb128 0x1
	.4byte	.LASF133
	.byte	0x5
	.byte	0x56
	.4byte	0xd9
	.byte	0xc4
	.uleb128 0x1
	.4byte	.LASF134
	.byte	0x5
	.byte	0x57
	.4byte	0xde
	.byte	0xc8
	.uleb128 0x1
	.4byte	.LASF135
	.byte	0x5
	.byte	0x58
	.4byte	0x6ce
	.byte	0xcc
	.uleb128 0x1
	.4byte	.LASF136
	.byte	0x5
	.byte	0x59
	.4byte	0xd9
	.byte	0xd0
	.uleb128 0x1
	.4byte	.LASF137
	.byte	0x5
	.byte	0x5a
	.4byte	0xd9
	.byte	0xd4
	.uleb128 0x1
	.4byte	.LASF138
	.byte	0x5
	.byte	0x5b
	.4byte	0xde
	.byte	0xd8
	.uleb128 0x1
	.4byte	.LASF139
	.byte	0x5
	.byte	0x5c
	.4byte	0x6d3
	.byte	0xdc
	.uleb128 0x1
	.4byte	.LASF140
	.byte	0x5
	.byte	0x5d
	.4byte	0xde
	.byte	0xe0
	.uleb128 0x1
	.4byte	.LASF141
	.byte	0x5
	.byte	0x5e
	.4byte	0xd9
	.byte	0xe4
	.uleb128 0x1
	.4byte	.LASF142
	.byte	0x5
	.byte	0x5f
	.4byte	0xde
	.byte	0xe8
	.byte	0
	.uleb128 0x6
	.4byte	0xde
	.4byte	0x6a6
	.uleb128 0x7
	.4byte	0x95
	.byte	0
	.byte	0
	.uleb128 0xb
	.4byte	0x696
	.uleb128 0x3
	.4byte	0x6a6
	.uleb128 0x3
	.4byte	0x6a6
	.uleb128 0x3
	.4byte	0x6a6
	.uleb128 0x3
	.4byte	0x6a6
	.uleb128 0x3
	.4byte	0x6a6
	.uleb128 0x3
	.4byte	0x6a6
	.uleb128 0x3
	.4byte	0x6a6
	.uleb128 0x3
	.4byte	0x6a6
	.uleb128 0x3
	.4byte	0x6a6
	.uleb128 0x3
	.4byte	0x6a6
	.uleb128 0x3
	.4byte	0x6a6
	.uleb128 0x3
	.4byte	0x6a6
	.uleb128 0x3
	.4byte	0x6a6
	.uleb128 0x6
	.4byte	0xde
	.4byte	0x6fc
	.uleb128 0x7
	.4byte	0x95
	.byte	0x2
	.byte	0
	.uleb128 0xb
	.4byte	0x6ec
	.uleb128 0x3
	.4byte	0x6fc
	.uleb128 0x15
	.ascii	"Pio\000"
	.byte	0x5
	.byte	0x60
	.4byte	0x404
	.uleb128 0x1d
	.2byte	0x110
	.byte	0x6
	.byte	0x29
	.byte	0x9
	.4byte	0x8a8
	.uleb128 0x1
	.4byte	.LASF143
	.byte	0x6
	.byte	0x2a
	.4byte	0xd9
	.byte	0
	.uleb128 0x1
	.4byte	.LASF144
	.byte	0x6
	.byte	0x2b
	.4byte	0xd9
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF145
	.byte	0x6
	.byte	0x2c
	.4byte	0xde
	.byte	0x8
	.uleb128 0x1
	.4byte	.LASF92
	.byte	0x6
	.byte	0x2d
	.4byte	0x6d8
	.byte	0xc
	.uleb128 0x1
	.4byte	.LASF146
	.byte	0x6
	.byte	0x2e
	.4byte	0xd9
	.byte	0x10
	.uleb128 0x1
	.4byte	.LASF147
	.byte	0x6
	.byte	0x2f
	.4byte	0xd9
	.byte	0x14
	.uleb128 0x1
	.4byte	.LASF148
	.byte	0x6
	.byte	0x30
	.4byte	0xde
	.byte	0x18
	.uleb128 0x1
	.4byte	.LASF149
	.byte	0x6
	.byte	0x31
	.4byte	0xd9
	.byte	0x1c
	.uleb128 0x1
	.4byte	.LASF150
	.byte	0x6
	.byte	0x32
	.4byte	0xd9
	.byte	0x20
	.uleb128 0x1
	.4byte	.LASF151
	.byte	0x6
	.byte	0x33
	.4byte	0xde
	.byte	0x24
	.uleb128 0x1
	.4byte	.LASF152
	.byte	0x6
	.byte	0x34
	.4byte	0xd9
	.byte	0x28
	.uleb128 0x1
	.4byte	.LASF96
	.byte	0x6
	.byte	0x35
	.4byte	0x6dd
	.byte	0x2c
	.uleb128 0x1
	.4byte	.LASF153
	.byte	0x6
	.byte	0x36
	.4byte	0xd9
	.byte	0x30
	.uleb128 0x1
	.4byte	.LASF100
	.byte	0x6
	.byte	0x37
	.4byte	0x6e2
	.byte	0x34
	.uleb128 0x1
	.4byte	.LASF154
	.byte	0x6
	.byte	0x38
	.4byte	0xd9
	.byte	0x38
	.uleb128 0x1
	.4byte	.LASF112
	.byte	0x6
	.byte	0x39
	.4byte	0x6e7
	.byte	0x3c
	.uleb128 0x1
	.4byte	.LASF155
	.byte	0x6
	.byte	0x3a
	.4byte	0x8b8
	.byte	0x40
	.uleb128 0x1
	.4byte	.LASF116
	.byte	0x6
	.byte	0x3b
	.4byte	0x39b
	.byte	0x4c
	.uleb128 0x1
	.4byte	.LASF156
	.byte	0x6
	.byte	0x3c
	.4byte	0xd9
	.byte	0x60
	.uleb128 0x1
	.4byte	.LASF157
	.byte	0x6
	.byte	0x3d
	.4byte	0xd9
	.byte	0x64
	.uleb128 0x1
	.4byte	.LASF158
	.byte	0x6
	.byte	0x3e
	.4byte	0xde
	.byte	0x68
	.uleb128 0x1
	.4byte	.LASF159
	.byte	0x6
	.byte	0x3f
	.4byte	0xde
	.byte	0x6c
	.uleb128 0x1
	.4byte	.LASF160
	.byte	0x6
	.byte	0x40
	.4byte	0xd9
	.byte	0x70
	.uleb128 0x1
	.4byte	.LASF161
	.byte	0x6
	.byte	0x41
	.4byte	0xd9
	.byte	0x74
	.uleb128 0x1
	.4byte	.LASF162
	.byte	0x6
	.byte	0x42
	.4byte	0xd9
	.byte	0x78
	.uleb128 0x1
	.4byte	.LASF118
	.byte	0x6
	.byte	0x43
	.4byte	0x8d2
	.byte	0x7c
	.uleb128 0x1
	.4byte	.LASF163
	.byte	0x6
	.byte	0x44
	.4byte	0xd9
	.byte	0xe4
	.uleb128 0x1
	.4byte	.LASF164
	.byte	0x6
	.byte	0x45
	.4byte	0xde
	.byte	0xe8
	.uleb128 0x1
	.4byte	.LASF123
	.byte	0x6
	.byte	0x46
	.4byte	0x3a0
	.byte	0xec
	.uleb128 0xe
	.4byte	.LASF165
	.byte	0x47
	.4byte	0xd9
	.2byte	0x100
	.uleb128 0xe
	.4byte	.LASF166
	.byte	0x48
	.4byte	0xd9
	.2byte	0x104
	.uleb128 0xe
	.4byte	.LASF167
	.byte	0x49
	.4byte	0xde
	.2byte	0x108
	.uleb128 0xe
	.4byte	.LASF168
	.byte	0x4a
	.4byte	0xd9
	.2byte	0x10c
	.byte	0
	.uleb128 0x6
	.4byte	0xd9
	.4byte	0x8b8
	.uleb128 0x7
	.4byte	0x95
	.byte	0x2
	.byte	0
	.uleb128 0x3
	.4byte	0x8a8
	.uleb128 0x6
	.4byte	0xde
	.4byte	0x8cd
	.uleb128 0x7
	.4byte	0x95
	.byte	0x19
	.byte	0
	.uleb128 0xb
	.4byte	0x8bd
	.uleb128 0x3
	.4byte	0x8cd
	.uleb128 0x15
	.ascii	"Pmc\000"
	.byte	0x6
	.byte	0x4b
	.4byte	0x711
	.uleb128 0x6
	.4byte	0xbc
	.4byte	0x8f3
	.uleb128 0x1e
	.4byte	0x95
	.2byte	0x245
	.byte	0
	.uleb128 0x1f
	.4byte	.LASF187
	.byte	0x1
	.byte	0xf
	.byte	0x9
	.4byte	0x8e2
	.uleb128 0x5
	.byte	0x3
	.4byte	font
	.uleb128 0xf
	.4byte	.LASF170
	.byte	0x67
	.byte	0x1a
	.4byte	0xd9
	.uleb128 0x5
	.byte	0x3
	.4byte	TickCount
	.uleb128 0x10
	.4byte	.LASF171
	.2byte	0x12d
	.4byte	.LFB14
	.4byte	.LFE14-.LFB14
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x98e
	.uleb128 0x8
	.ascii	"X\000"
	.2byte	0x12d
	.byte	0x1a
	.4byte	0xbc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -25
	.uleb128 0x8
	.ascii	"Y\000"
	.2byte	0x12d
	.byte	0x25
	.4byte	0xbc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -26
	.uleb128 0x8
	.ascii	"num\000"
	.2byte	0x12d
	.byte	0x31
	.4byte	0xcd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x20
	.4byte	.LASF169
	.byte	0x1
	.2byte	0x12d
	.byte	0x3e
	.4byte	0xbc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -27
	.uleb128 0xd
	.ascii	"str\000"
	.2byte	0x12e
	.byte	0x7
	.4byte	0x98e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xd
	.ascii	"d\000"
	.2byte	0x12f
	.byte	0xd
	.4byte	0xbc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -10
	.uleb128 0xd
	.ascii	"w\000"
	.2byte	0x130
	.byte	0x9
	.4byte	0xb0
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.byte	0
	.uleb128 0x6
	.4byte	0xa9
	.4byte	0x99e
	.uleb128 0x7
	.4byte	0x95
	.byte	0xa
	.byte	0
	.uleb128 0x10
	.4byte	.LASF172
	.2byte	0x122
	.4byte	.LFB13
	.4byte	.LFE13-.LFB13
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x9ea
	.uleb128 0x8
	.ascii	"X\000"
	.2byte	0x122
	.byte	0x1a
	.4byte	0xbc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.uleb128 0x8
	.ascii	"Y\000"
	.2byte	0x122
	.byte	0x25
	.4byte	0xbc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -18
	.uleb128 0x8
	.ascii	"str\000"
	.2byte	0x122
	.byte	0x2e
	.4byte	0xa3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xd
	.ascii	"c\000"
	.2byte	0x123
	.byte	0x7
	.4byte	0xa9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.byte	0
	.uleb128 0x10
	.4byte	.LASF173
	.2byte	0x114
	.4byte	.LFB12
	.4byte	.LFE12-.LFB12
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xa34
	.uleb128 0x8
	.ascii	"X\000"
	.2byte	0x114
	.byte	0x1b
	.4byte	0xbc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.uleb128 0x8
	.ascii	"Y\000"
	.2byte	0x114
	.byte	0x26
	.4byte	0xbc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -18
	.uleb128 0x8
	.ascii	"c\000"
	.2byte	0x114
	.byte	0x2e
	.4byte	0xa9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -19
	.uleb128 0xd
	.ascii	"j\000"
	.2byte	0x115
	.byte	0xa
	.4byte	0xbc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.byte	0
	.uleb128 0x21
	.4byte	.LASF188
	.byte	0x1
	.2byte	0x104
	.byte	0x6
	.4byte	.LFB11
	.4byte	.LFE11-.LFB11
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xa66
	.uleb128 0xd
	.ascii	"i\000"
	.2byte	0x105
	.byte	0xa
	.4byte	0xbc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.uleb128 0xd
	.ascii	"j\000"
	.2byte	0x105
	.byte	0xc
	.4byte	0xbc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -10
	.byte	0
	.uleb128 0x22
	.4byte	.LASF177
	.byte	0x1
	.byte	0xd1
	.byte	0x6
	.4byte	.LFB10
	.4byte	.LFE10-.LFB10
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x23
	.4byte	.LASF174
	.byte	0x1
	.byte	0xbd
	.byte	0x6
	.4byte	.LFB9
	.4byte	.LFE9-.LFB9
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xac3
	.uleb128 0x24
	.4byte	.LASF175
	.byte	0x1
	.byte	0xbd
	.byte	0x19
	.4byte	0xbc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.uleb128 0x16
	.ascii	"v2\000"
	.byte	0xbe
	.byte	0xd
	.4byte	0xbc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -10
	.uleb128 0x25
	.4byte	.LBB2
	.4byte	.LBE2-.LBB2
	.uleb128 0x16
	.ascii	"bit\000"
	.byte	0xc3
	.byte	0x12
	.4byte	0xbc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.byte	0
	.byte	0
	.uleb128 0x11
	.4byte	.LASF176
	.byte	0xb5
	.4byte	.LFB8
	.4byte	.LFE8-.LFB8
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xae4
	.uleb128 0x12
	.ascii	"i\000"
	.byte	0xb5
	.byte	0x19
	.4byte	0xbc
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.byte	0
	.uleb128 0x17
	.4byte	.LASF178
	.byte	0x92
	.4byte	.LFB7
	.4byte	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x11
	.4byte	.LASF179
	.byte	0x82
	.4byte	.LFB6
	.4byte	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xb24
	.uleb128 0x12
	.ascii	"us\000"
	.byte	0x82
	.byte	0x18
	.4byte	0xe3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xf
	.4byte	.LASF180
	.byte	0x8a
	.byte	0xe
	.4byte	0xcd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x11
	.4byte	.LASF181
	.byte	0x73
	.4byte	.LFB5
	.4byte	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xb54
	.uleb128 0x12
	.ascii	"us\000"
	.byte	0x73
	.byte	0x18
	.4byte	0xe3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xf
	.4byte	.LASF180
	.byte	0x7b
	.byte	0xe
	.4byte	0xcd
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x17
	.4byte	.LASF182
	.byte	0x6d
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x26
	.4byte	.LASF189
	.byte	0x1
	.byte	0x69
	.byte	0x6
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.byte	0
	.section	.debug_abbrev,"",%progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 17
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 4
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 18
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xd
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 4
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 18
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 6
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 17
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 6
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 6
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7a
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 4
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 9
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 4
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 3
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 3
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 6
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7a
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0x4
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0x5
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x1f
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x20
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x21
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x22
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x23
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x24
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x25
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x26
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7a
	.uleb128 0x19
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",%progbits
	.4byte	0x1c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	0
	.4byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF83:
	.ascii	"CPACR\000"
.LASF171:
	.ascii	"display_num\000"
.LASF28:
	.ascii	"RSTC_IRQn\000"
.LASF47:
	.ascii	"TWI1_IRQn\000"
.LASF141:
	.ascii	"PIO_WPMR\000"
.LASF67:
	.ascii	"CAN1_IRQn\000"
.LASF183:
	.ascii	"GNU C17 11.2.1 20220111 -mcpu=cortex-m3 -mfloat-abi"
	.ascii	"=soft -mthumb -march=armv7-m -g -fmessage-length=0\000"
.LASF103:
	.ascii	"PIO_ODSR\000"
.LASF12:
	.ascii	"unsigned int\000"
.LASF86:
	.ascii	"LOAD\000"
.LASF36:
	.ascii	"SMC_IRQn\000"
.LASF76:
	.ascii	"DFSR\000"
.LASF63:
	.ascii	"UOTGHS_IRQn\000"
.LASF61:
	.ascii	"DACC_IRQn\000"
.LASF39:
	.ascii	"PIOC_IRQn\000"
.LASF87:
	.ascii	"CALIB\000"
.LASF105:
	.ascii	"PIO_IER\000"
.LASF53:
	.ascii	"TC3_IRQn\000"
.LASF119:
	.ascii	"PIO_SCIFSR\000"
.LASF25:
	.ascii	"PendSV_IRQn\000"
.LASF152:
	.ascii	"CKGR_PLLAR\000"
.LASF177:
	.ascii	"display_init\000"
.LASF20:
	.ascii	"MemoryManagement_IRQn\000"
.LASF117:
	.ascii	"PIO_ABSR\000"
.LASF17:
	.ascii	"uint32_t\000"
.LASF15:
	.ascii	"int8_t\000"
.LASF149:
	.ascii	"CKGR_UCKR\000"
.LASF80:
	.ascii	"MMFR\000"
.LASF130:
	.ascii	"PIO_AIMMR\000"
.LASF58:
	.ascii	"TC8_IRQn\000"
.LASF133:
	.ascii	"PIO_LSR\000"
.LASF11:
	.ascii	"long long unsigned int\000"
.LASF184:
	.ascii	"display.c\000"
.LASF62:
	.ascii	"DMAC_IRQn\000"
.LASF151:
	.ascii	"CKGR_MCFR\000"
.LASF108:
	.ascii	"PIO_ISR\000"
.LASF159:
	.ascii	"PMC_IMR\000"
.LASF139:
	.ascii	"Reserved11\000"
.LASF34:
	.ascii	"EFC1_IRQn\000"
.LASF106:
	.ascii	"PIO_IDR\000"
.LASF185:
	.ascii	"/Users/bilas/Desktop/as428/carvgit.hy428/arduino_as"
	.ascii	"signments/as2_timers/solution\000"
.LASF140:
	.ascii	"PIO_LOCKSR\000"
.LASF50:
	.ascii	"TC0_IRQn\000"
.LASF43:
	.ascii	"USART2_IRQn\000"
.LASF169:
	.ascii	"width\000"
.LASF69:
	.ascii	"CPUID\000"
.LASF160:
	.ascii	"PMC_FSMR\000"
.LASF162:
	.ascii	"PMC_FOCR\000"
.LASF178:
	.ascii	"spi_init\000"
.LASF164:
	.ascii	"PMC_WPSR\000"
.LASF10:
	.ascii	"__uint64_t\000"
.LASF79:
	.ascii	"AFSR\000"
.LASF49:
	.ascii	"SSC_IRQn\000"
.LASF146:
	.ascii	"PMC_PCER0\000"
.LASF165:
	.ascii	"PMC_PCER1\000"
.LASF179:
	.ascii	"delay_ms\000"
.LASF115:
	.ascii	"PIO_PUSR\000"
.LASF155:
	.ascii	"PMC_PCK\000"
.LASF168:
	.ascii	"PMC_PCR\000"
.LASF99:
	.ascii	"PIO_IFSR\000"
.LASF113:
	.ascii	"PIO_PUDR\000"
.LASF75:
	.ascii	"HFSR\000"
.LASF64:
	.ascii	"TRNG_IRQn\000"
.LASF55:
	.ascii	"TC5_IRQn\000"
.LASF98:
	.ascii	"PIO_IFDR\000"
.LASF66:
	.ascii	"CAN0_IRQn\000"
.LASF14:
	.ascii	"char\000"
.LASF95:
	.ascii	"PIO_OSR\000"
.LASF72:
	.ascii	"AIRCR\000"
.LASF94:
	.ascii	"PIO_ODR\000"
.LASF176:
	.ascii	"spi_set_cs\000"
.LASF142:
	.ascii	"PIO_WPSR\000"
.LASF175:
	.ascii	"data\000"
.LASF132:
	.ascii	"PIO_ESR\000"
.LASF16:
	.ascii	"uint8_t\000"
.LASF38:
	.ascii	"PIOB_IRQn\000"
.LASF114:
	.ascii	"PIO_PUER\000"
.LASF134:
	.ascii	"PIO_ELSR\000"
.LASF97:
	.ascii	"PIO_IFER\000"
.LASF154:
	.ascii	"PMC_USB\000"
.LASF93:
	.ascii	"PIO_OER\000"
.LASF9:
	.ascii	"long long int\000"
.LASF46:
	.ascii	"TWI0_IRQn\000"
.LASF189:
	.ascii	"SysTick_Handler\000"
.LASF74:
	.ascii	"CFSR\000"
.LASF102:
	.ascii	"PIO_CODR\000"
.LASF161:
	.ascii	"PMC_FSPR\000"
.LASF31:
	.ascii	"WDT_IRQn\000"
.LASF21:
	.ascii	"BusFault_IRQn\000"
.LASF65:
	.ascii	"EMAC_IRQn\000"
.LASF138:
	.ascii	"PIO_FRLHSR\000"
.LASF35:
	.ascii	"UART_IRQn\000"
.LASF187:
	.ascii	"font\000"
.LASF174:
	.ascii	"spi_send_8\000"
.LASF92:
	.ascii	"Reserved1\000"
.LASF59:
	.ascii	"PWM_IRQn\000"
.LASF100:
	.ascii	"Reserved3\000"
.LASF112:
	.ascii	"Reserved4\000"
.LASF116:
	.ascii	"Reserved5\000"
.LASF118:
	.ascii	"Reserved6\000"
.LASF123:
	.ascii	"Reserved7\000"
.LASF127:
	.ascii	"Reserved8\000"
.LASF131:
	.ascii	"Reserved9\000"
.LASF60:
	.ascii	"ADC_IRQn\000"
.LASF57:
	.ascii	"TC7_IRQn\000"
.LASF180:
	.ascii	"start\000"
.LASF48:
	.ascii	"SPI0_IRQn\000"
.LASF52:
	.ascii	"TC2_IRQn\000"
.LASF0:
	.ascii	"__int8_t\000"
.LASF125:
	.ascii	"PIO_OWDR\000"
.LASF88:
	.ascii	"SysTick_Type\000"
.LASF129:
	.ascii	"PIO_AIMDR\000"
.LASF13:
	.ascii	"long double\000"
.LASF186:
	.ascii	"IRQn\000"
.LASF104:
	.ascii	"PIO_PDSR\000"
.LASF107:
	.ascii	"PIO_IMR\000"
.LASF170:
	.ascii	"TickCount\000"
.LASF33:
	.ascii	"EFC0_IRQn\000"
.LASF77:
	.ascii	"MMFAR\000"
.LASF29:
	.ascii	"RTC_IRQn\000"
.LASF82:
	.ascii	"RESERVED0\000"
.LASF73:
	.ascii	"SHCSR\000"
.LASF4:
	.ascii	"short int\000"
.LASF45:
	.ascii	"HSMCI_IRQn\000"
.LASF124:
	.ascii	"PIO_OWER\000"
.LASF157:
	.ascii	"PMC_IDR\000"
.LASF6:
	.ascii	"long int\000"
.LASF42:
	.ascii	"USART1_IRQn\000"
.LASF128:
	.ascii	"PIO_AIMER\000"
.LASF19:
	.ascii	"NonMaskableInt_IRQn\000"
.LASF150:
	.ascii	"CKGR_MOR\000"
.LASF137:
	.ascii	"PIO_REHLSR\000"
.LASF121:
	.ascii	"PIO_IFDGSR\000"
.LASF18:
	.ascii	"uint64_t\000"
.LASF40:
	.ascii	"PIOD_IRQn\000"
.LASF156:
	.ascii	"PMC_IER\000"
.LASF101:
	.ascii	"PIO_SODR\000"
.LASF1:
	.ascii	"__uint8_t\000"
.LASF84:
	.ascii	"SCB_Type\000"
.LASF78:
	.ascii	"BFAR\000"
.LASF71:
	.ascii	"VTOR\000"
.LASF54:
	.ascii	"TC4_IRQn\000"
.LASF96:
	.ascii	"Reserved2\000"
.LASF136:
	.ascii	"PIO_FELLSR\000"
.LASF26:
	.ascii	"SysTick_IRQn\000"
.LASF120:
	.ascii	"PIO_DIFSR\000"
.LASF70:
	.ascii	"ICSR\000"
.LASF8:
	.ascii	"long unsigned int\000"
.LASF188:
	.ascii	"display_clear\000"
.LASF173:
	.ascii	"display_char\000"
.LASF91:
	.ascii	"PIO_PSR\000"
.LASF27:
	.ascii	"SUPC_IRQn\000"
.LASF90:
	.ascii	"PIO_PDR\000"
.LASF24:
	.ascii	"DebugMonitor_IRQn\000"
.LASF22:
	.ascii	"UsageFault_IRQn\000"
.LASF3:
	.ascii	"unsigned char\000"
.LASF135:
	.ascii	"Reserved10\000"
.LASF7:
	.ascii	"__uint32_t\000"
.LASF23:
	.ascii	"SVCall_IRQn\000"
.LASF41:
	.ascii	"USART0_IRQn\000"
.LASF126:
	.ascii	"PIO_OWSR\000"
.LASF30:
	.ascii	"RTT_IRQn\000"
.LASF145:
	.ascii	"PMC_SCSR\000"
.LASF89:
	.ascii	"PIO_PER\000"
.LASF153:
	.ascii	"PMC_MCKR\000"
.LASF144:
	.ascii	"PMC_SCDR\000"
.LASF181:
	.ascii	"delay_us\000"
.LASF68:
	.ascii	"PERIPH_COUNT_IRQn\000"
.LASF111:
	.ascii	"PIO_MDSR\000"
.LASF2:
	.ascii	"signed char\000"
.LASF5:
	.ascii	"short unsigned int\000"
.LASF110:
	.ascii	"PIO_MDDR\000"
.LASF37:
	.ascii	"PIOA_IRQn\000"
.LASF148:
	.ascii	"PMC_PCSR0\000"
.LASF167:
	.ascii	"PMC_PCSR1\000"
.LASF56:
	.ascii	"TC6_IRQn\000"
.LASF182:
	.ascii	"delay_init\000"
.LASF172:
	.ascii	"display_str\000"
.LASF81:
	.ascii	"ISAR\000"
.LASF163:
	.ascii	"PMC_WPMR\000"
.LASF51:
	.ascii	"TC1_IRQn\000"
.LASF32:
	.ascii	"PMC_IRQn\000"
.LASF44:
	.ascii	"USART3_IRQn\000"
.LASF143:
	.ascii	"PMC_SCER\000"
.LASF158:
	.ascii	"PMC_SR\000"
.LASF147:
	.ascii	"PMC_PCDR0\000"
.LASF166:
	.ascii	"PMC_PCDR1\000"
.LASF122:
	.ascii	"PIO_SCDR\000"
.LASF109:
	.ascii	"PIO_MDER\000"
.LASF85:
	.ascii	"CTRL\000"
	.ident	"GCC: (GNU Toolchain for the Arm Architecture 11.2-2022.02 (arm-11.14)) 11.2.1 20220111"
