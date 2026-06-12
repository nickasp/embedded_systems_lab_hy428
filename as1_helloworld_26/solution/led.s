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
	.file	"led.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	1
	.global	led_init
	.syntax unified
	.thumb
	.thumb_func
	.type	led_init, %function
led_init:
.LFB3:
	.file 1 "led.c"
	.loc 1 4 16
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 6 20
	ldr	r3, .L2
	ldr	r3, [r3, #16]
	ldr	r2, .L2
	orr	r3, r3, #4096
	str	r3, [r2, #16]
	.loc 1 8 9
	ldr	r3, .L2+4
	.loc 1 8 19
	mov	r2, #33554432
	str	r2, [r3]
	.loc 1 9 9
	ldr	r3, .L2+4
	.loc 1 9 19
	mov	r2, #33554432
	str	r2, [r3, #16]
	.loc 1 11 2
	bl	led_off
	.loc 1 12 1
	nop
	pop	{r7, pc}
.L3:
	.align	2
.L2:
	.word	1074660864
	.word	1074663424
	.cfi_endproc
.LFE3:
	.size	led_init, .-led_init
	.align	1
	.global	led_on
	.syntax unified
	.thumb
	.thumb_func
	.type	led_on, %function
led_on:
.LFB4:
	.loc 1 14 14
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	.cfi_def_cfa_offset 4
	.cfi_offset 7, -4
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 16 9
	ldr	r3, .L5
	.loc 1 16 20
	mov	r2, #33554432
	str	r2, [r3, #48]
	.loc 1 17 1
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
	.word	1074663424
	.cfi_endproc
.LFE4:
	.size	led_on, .-led_on
	.align	1
	.global	led_off
	.syntax unified
	.thumb
	.thumb_func
	.type	led_off, %function
led_off:
.LFB5:
	.loc 1 19 15
	.cfi_startproc
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	.cfi_def_cfa_offset 4
	.cfi_offset 7, -4
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 21 9
	ldr	r3, .L8
	.loc 1 21 20
	mov	r2, #33554432
	str	r2, [r3, #52]
	.loc 1 22 1
	nop
	mov	sp, r7
	.cfi_def_cfa_register 13
	@ sp needed
	pop	{r7}
	.cfi_restore 7
	.cfi_def_cfa_offset 0
	bx	lr
.L9:
	.align	2
.L8:
	.word	1074663424
	.cfi_endproc
.LFE5:
	.size	led_off, .-led_off
.Letext0:
	.file 2 "/Applications/ARM/arm-none-eabi/include/machine/_default_types.h"
	.file 3 "/Applications/ARM/arm-none-eabi/include/sys/_stdint.h"
	.file 4 "./system/component/pio.h"
	.file 5 "./system/component/pmc.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x5e2
	.2byte	0x5
	.byte	0x1
	.byte	0x4
	.4byte	.Ldebug_abbrev0
	.uleb128 0xb
	.4byte	.LASF96
	.byte	0x1d
	.4byte	.LASF97
	.4byte	.LASF98
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.4byte	.LASF0
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.4byte	.LASF1
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.4byte	.LASF2
	.uleb128 0x3
	.byte	0x2
	.byte	0x7
	.4byte	.LASF3
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.4byte	.LASF4
	.uleb128 0x8
	.4byte	.LASF11
	.byte	0x2
	.byte	0x4f
	.byte	0x19
	.4byte	0x55
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.4byte	.LASF5
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.4byte	.LASF6
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.4byte	.LASF7
	.uleb128 0xc
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.4byte	.LASF8
	.uleb128 0x3
	.byte	0x8
	.byte	0x4
	.4byte	.LASF9
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.4byte	.LASF10
	.uleb128 0x8
	.4byte	.LASF12
	.byte	0x3
	.byte	0x30
	.byte	0x14
	.4byte	0x49
	.uleb128 0x2
	.4byte	0x86
	.uleb128 0x4
	.4byte	0x92
	.uleb128 0x5
	.4byte	0x97
	.4byte	0xac
	.uleb128 0x6
	.4byte	0x71
	.byte	0x3
	.byte	0
	.uleb128 0x4
	.4byte	0x9c
	.uleb128 0x2
	.4byte	0xac
	.uleb128 0x5
	.4byte	0x97
	.4byte	0xc6
	.uleb128 0x6
	.4byte	0x71
	.byte	0x4
	.byte	0
	.uleb128 0x4
	.4byte	0xb6
	.uleb128 0x2
	.4byte	0xc6
	.uleb128 0x2
	.4byte	0xc6
	.uleb128 0xd
	.byte	0xec
	.byte	0x4
	.byte	0x29
	.byte	0x9
	.4byte	0x367
	.uleb128 0x1
	.4byte	.LASF13
	.byte	0x4
	.byte	0x2a
	.4byte	0x92
	.byte	0
	.uleb128 0x1
	.4byte	.LASF14
	.byte	0x4
	.byte	0x2b
	.4byte	0x92
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF15
	.byte	0x4
	.byte	0x2c
	.4byte	0x97
	.byte	0x8
	.uleb128 0x1
	.4byte	.LASF16
	.byte	0x4
	.byte	0x2d
	.4byte	0x37c
	.byte	0xc
	.uleb128 0x1
	.4byte	.LASF17
	.byte	0x4
	.byte	0x2e
	.4byte	0x92
	.byte	0x10
	.uleb128 0x1
	.4byte	.LASF18
	.byte	0x4
	.byte	0x2f
	.4byte	0x92
	.byte	0x14
	.uleb128 0x1
	.4byte	.LASF19
	.byte	0x4
	.byte	0x30
	.4byte	0x97
	.byte	0x18
	.uleb128 0x1
	.4byte	.LASF20
	.byte	0x4
	.byte	0x31
	.4byte	0x381
	.byte	0x1c
	.uleb128 0x1
	.4byte	.LASF21
	.byte	0x4
	.byte	0x32
	.4byte	0x92
	.byte	0x20
	.uleb128 0x1
	.4byte	.LASF22
	.byte	0x4
	.byte	0x33
	.4byte	0x92
	.byte	0x24
	.uleb128 0x1
	.4byte	.LASF23
	.byte	0x4
	.byte	0x34
	.4byte	0x97
	.byte	0x28
	.uleb128 0x1
	.4byte	.LASF24
	.byte	0x4
	.byte	0x35
	.4byte	0x386
	.byte	0x2c
	.uleb128 0x1
	.4byte	.LASF25
	.byte	0x4
	.byte	0x36
	.4byte	0x92
	.byte	0x30
	.uleb128 0x1
	.4byte	.LASF26
	.byte	0x4
	.byte	0x37
	.4byte	0x92
	.byte	0x34
	.uleb128 0x1
	.4byte	.LASF27
	.byte	0x4
	.byte	0x38
	.4byte	0x92
	.byte	0x38
	.uleb128 0x1
	.4byte	.LASF28
	.byte	0x4
	.byte	0x39
	.4byte	0x97
	.byte	0x3c
	.uleb128 0x1
	.4byte	.LASF29
	.byte	0x4
	.byte	0x3a
	.4byte	0x92
	.byte	0x40
	.uleb128 0x1
	.4byte	.LASF30
	.byte	0x4
	.byte	0x3b
	.4byte	0x92
	.byte	0x44
	.uleb128 0x1
	.4byte	.LASF31
	.byte	0x4
	.byte	0x3c
	.4byte	0x97
	.byte	0x48
	.uleb128 0x1
	.4byte	.LASF32
	.byte	0x4
	.byte	0x3d
	.4byte	0x97
	.byte	0x4c
	.uleb128 0x1
	.4byte	.LASF33
	.byte	0x4
	.byte	0x3e
	.4byte	0x92
	.byte	0x50
	.uleb128 0x1
	.4byte	.LASF34
	.byte	0x4
	.byte	0x3f
	.4byte	0x92
	.byte	0x54
	.uleb128 0x1
	.4byte	.LASF35
	.byte	0x4
	.byte	0x40
	.4byte	0x97
	.byte	0x58
	.uleb128 0x1
	.4byte	.LASF36
	.byte	0x4
	.byte	0x41
	.4byte	0x38b
	.byte	0x5c
	.uleb128 0x1
	.4byte	.LASF37
	.byte	0x4
	.byte	0x42
	.4byte	0x92
	.byte	0x60
	.uleb128 0x1
	.4byte	.LASF38
	.byte	0x4
	.byte	0x43
	.4byte	0x92
	.byte	0x64
	.uleb128 0x1
	.4byte	.LASF39
	.byte	0x4
	.byte	0x44
	.4byte	0x97
	.byte	0x68
	.uleb128 0x1
	.4byte	.LASF40
	.byte	0x4
	.byte	0x45
	.4byte	0x390
	.byte	0x6c
	.uleb128 0x1
	.4byte	.LASF41
	.byte	0x4
	.byte	0x46
	.4byte	0x92
	.byte	0x70
	.uleb128 0x1
	.4byte	.LASF42
	.byte	0x4
	.byte	0x47
	.4byte	0x3d2
	.byte	0x74
	.uleb128 0x1
	.4byte	.LASF43
	.byte	0x4
	.byte	0x48
	.4byte	0x92
	.byte	0x80
	.uleb128 0x1
	.4byte	.LASF44
	.byte	0x4
	.byte	0x49
	.4byte	0x92
	.byte	0x84
	.uleb128 0x1
	.4byte	.LASF45
	.byte	0x4
	.byte	0x4a
	.4byte	0x97
	.byte	0x88
	.uleb128 0x1
	.4byte	.LASF46
	.byte	0x4
	.byte	0x4b
	.4byte	0x92
	.byte	0x8c
	.uleb128 0x1
	.4byte	.LASF47
	.byte	0x4
	.byte	0x4c
	.4byte	0xb1
	.byte	0x90
	.uleb128 0x1
	.4byte	.LASF48
	.byte	0x4
	.byte	0x4d
	.4byte	0x92
	.byte	0xa0
	.uleb128 0x1
	.4byte	.LASF49
	.byte	0x4
	.byte	0x4e
	.4byte	0x92
	.byte	0xa4
	.uleb128 0x1
	.4byte	.LASF50
	.byte	0x4
	.byte	0x4f
	.4byte	0x97
	.byte	0xa8
	.uleb128 0x1
	.4byte	.LASF51
	.byte	0x4
	.byte	0x50
	.4byte	0x395
	.byte	0xac
	.uleb128 0x1
	.4byte	.LASF52
	.byte	0x4
	.byte	0x51
	.4byte	0x92
	.byte	0xb0
	.uleb128 0x1
	.4byte	.LASF53
	.byte	0x4
	.byte	0x52
	.4byte	0x92
	.byte	0xb4
	.uleb128 0x1
	.4byte	.LASF54
	.byte	0x4
	.byte	0x53
	.4byte	0x97
	.byte	0xb8
	.uleb128 0x1
	.4byte	.LASF55
	.byte	0x4
	.byte	0x54
	.4byte	0x39a
	.byte	0xbc
	.uleb128 0x1
	.4byte	.LASF56
	.byte	0x4
	.byte	0x55
	.4byte	0x92
	.byte	0xc0
	.uleb128 0x1
	.4byte	.LASF57
	.byte	0x4
	.byte	0x56
	.4byte	0x92
	.byte	0xc4
	.uleb128 0x1
	.4byte	.LASF58
	.byte	0x4
	.byte	0x57
	.4byte	0x97
	.byte	0xc8
	.uleb128 0x1
	.4byte	.LASF59
	.byte	0x4
	.byte	0x58
	.4byte	0x39f
	.byte	0xcc
	.uleb128 0x1
	.4byte	.LASF60
	.byte	0x4
	.byte	0x59
	.4byte	0x92
	.byte	0xd0
	.uleb128 0x1
	.4byte	.LASF61
	.byte	0x4
	.byte	0x5a
	.4byte	0x92
	.byte	0xd4
	.uleb128 0x1
	.4byte	.LASF62
	.byte	0x4
	.byte	0x5b
	.4byte	0x97
	.byte	0xd8
	.uleb128 0x1
	.4byte	.LASF63
	.byte	0x4
	.byte	0x5c
	.4byte	0x3a4
	.byte	0xdc
	.uleb128 0x1
	.4byte	.LASF64
	.byte	0x4
	.byte	0x5d
	.4byte	0x97
	.byte	0xe0
	.uleb128 0x1
	.4byte	.LASF65
	.byte	0x4
	.byte	0x5e
	.4byte	0x92
	.byte	0xe4
	.uleb128 0x1
	.4byte	.LASF66
	.byte	0x4
	.byte	0x5f
	.4byte	0x97
	.byte	0xe8
	.byte	0
	.uleb128 0x5
	.4byte	0x97
	.4byte	0x377
	.uleb128 0x6
	.4byte	0x71
	.byte	0
	.byte	0
	.uleb128 0x4
	.4byte	0x367
	.uleb128 0x2
	.4byte	0x377
	.uleb128 0x2
	.4byte	0x377
	.uleb128 0x2
	.4byte	0x377
	.uleb128 0x2
	.4byte	0x377
	.uleb128 0x2
	.4byte	0x377
	.uleb128 0x2
	.4byte	0x377
	.uleb128 0x2
	.4byte	0x377
	.uleb128 0x2
	.4byte	0x377
	.uleb128 0x2
	.4byte	0x377
	.uleb128 0x2
	.4byte	0x377
	.uleb128 0x2
	.4byte	0x377
	.uleb128 0x2
	.4byte	0x377
	.uleb128 0x2
	.4byte	0x377
	.uleb128 0x5
	.4byte	0x97
	.4byte	0x3cd
	.uleb128 0x6
	.4byte	0x71
	.byte	0x2
	.byte	0
	.uleb128 0x4
	.4byte	0x3bd
	.uleb128 0x2
	.4byte	0x3cd
	.uleb128 0x9
	.ascii	"Pio\000"
	.byte	0x4
	.byte	0x60
	.4byte	0xd5
	.uleb128 0xe
	.2byte	0x110
	.byte	0x5
	.byte	0x29
	.byte	0x9
	.4byte	0x579
	.uleb128 0x1
	.4byte	.LASF67
	.byte	0x5
	.byte	0x2a
	.4byte	0x92
	.byte	0
	.uleb128 0x1
	.4byte	.LASF68
	.byte	0x5
	.byte	0x2b
	.4byte	0x92
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF69
	.byte	0x5
	.byte	0x2c
	.4byte	0x97
	.byte	0x8
	.uleb128 0x1
	.4byte	.LASF16
	.byte	0x5
	.byte	0x2d
	.4byte	0x3a9
	.byte	0xc
	.uleb128 0x1
	.4byte	.LASF70
	.byte	0x5
	.byte	0x2e
	.4byte	0x92
	.byte	0x10
	.uleb128 0x1
	.4byte	.LASF71
	.byte	0x5
	.byte	0x2f
	.4byte	0x92
	.byte	0x14
	.uleb128 0x1
	.4byte	.LASF72
	.byte	0x5
	.byte	0x30
	.4byte	0x97
	.byte	0x18
	.uleb128 0x1
	.4byte	.LASF73
	.byte	0x5
	.byte	0x31
	.4byte	0x92
	.byte	0x1c
	.uleb128 0x1
	.4byte	.LASF74
	.byte	0x5
	.byte	0x32
	.4byte	0x92
	.byte	0x20
	.uleb128 0x1
	.4byte	.LASF75
	.byte	0x5
	.byte	0x33
	.4byte	0x97
	.byte	0x24
	.uleb128 0x1
	.4byte	.LASF76
	.byte	0x5
	.byte	0x34
	.4byte	0x92
	.byte	0x28
	.uleb128 0x1
	.4byte	.LASF20
	.byte	0x5
	.byte	0x35
	.4byte	0x3ae
	.byte	0x2c
	.uleb128 0x1
	.4byte	.LASF77
	.byte	0x5
	.byte	0x36
	.4byte	0x92
	.byte	0x30
	.uleb128 0x1
	.4byte	.LASF24
	.byte	0x5
	.byte	0x37
	.4byte	0x3b3
	.byte	0x34
	.uleb128 0x1
	.4byte	.LASF78
	.byte	0x5
	.byte	0x38
	.4byte	0x92
	.byte	0x38
	.uleb128 0x1
	.4byte	.LASF36
	.byte	0x5
	.byte	0x39
	.4byte	0x3b8
	.byte	0x3c
	.uleb128 0x1
	.4byte	.LASF79
	.byte	0x5
	.byte	0x3a
	.4byte	0x589
	.byte	0x40
	.uleb128 0x1
	.4byte	.LASF40
	.byte	0x5
	.byte	0x3b
	.4byte	0xcb
	.byte	0x4c
	.uleb128 0x1
	.4byte	.LASF80
	.byte	0x5
	.byte	0x3c
	.4byte	0x92
	.byte	0x60
	.uleb128 0x1
	.4byte	.LASF81
	.byte	0x5
	.byte	0x3d
	.4byte	0x92
	.byte	0x64
	.uleb128 0x1
	.4byte	.LASF82
	.byte	0x5
	.byte	0x3e
	.4byte	0x97
	.byte	0x68
	.uleb128 0x1
	.4byte	.LASF83
	.byte	0x5
	.byte	0x3f
	.4byte	0x97
	.byte	0x6c
	.uleb128 0x1
	.4byte	.LASF84
	.byte	0x5
	.byte	0x40
	.4byte	0x92
	.byte	0x70
	.uleb128 0x1
	.4byte	.LASF85
	.byte	0x5
	.byte	0x41
	.4byte	0x92
	.byte	0x74
	.uleb128 0x1
	.4byte	.LASF86
	.byte	0x5
	.byte	0x42
	.4byte	0x92
	.byte	0x78
	.uleb128 0x1
	.4byte	.LASF42
	.byte	0x5
	.byte	0x43
	.4byte	0x5a3
	.byte	0x7c
	.uleb128 0x1
	.4byte	.LASF87
	.byte	0x5
	.byte	0x44
	.4byte	0x92
	.byte	0xe4
	.uleb128 0x1
	.4byte	.LASF88
	.byte	0x5
	.byte	0x45
	.4byte	0x97
	.byte	0xe8
	.uleb128 0x1
	.4byte	.LASF47
	.byte	0x5
	.byte	0x46
	.4byte	0xd0
	.byte	0xec
	.uleb128 0x7
	.4byte	.LASF89
	.byte	0x47
	.4byte	0x92
	.2byte	0x100
	.uleb128 0x7
	.4byte	.LASF90
	.byte	0x48
	.4byte	0x92
	.2byte	0x104
	.uleb128 0x7
	.4byte	.LASF91
	.byte	0x49
	.4byte	0x97
	.2byte	0x108
	.uleb128 0x7
	.4byte	.LASF92
	.byte	0x4a
	.4byte	0x92
	.2byte	0x10c
	.byte	0
	.uleb128 0x5
	.4byte	0x92
	.4byte	0x589
	.uleb128 0x6
	.4byte	0x71
	.byte	0x2
	.byte	0
	.uleb128 0x2
	.4byte	0x579
	.uleb128 0x5
	.4byte	0x97
	.4byte	0x59e
	.uleb128 0x6
	.4byte	0x71
	.byte	0x19
	.byte	0
	.uleb128 0x4
	.4byte	0x58e
	.uleb128 0x2
	.4byte	0x59e
	.uleb128 0x9
	.ascii	"Pmc\000"
	.byte	0x5
	.byte	0x4b
	.4byte	0x3e2
	.uleb128 0xa
	.4byte	.LASF93
	.byte	0x13
	.4byte	.LFB5
	.4byte	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xa
	.4byte	.LASF94
	.byte	0xe
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xf
	.4byte	.LASF95
	.byte	0x1
	.byte	0x4
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
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3
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
	.uleb128 0x4
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 5
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
	.uleb128 0x8
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
	.uleb128 0x9
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
	.uleb128 0xa
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
	.uleb128 0xb
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
	.uleb128 0xc
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
	.uleb128 0xd
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
	.uleb128 0xe
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
	.uleb128 0xf
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
.LASF69:
	.ascii	"PMC_SCSR\000"
.LASF86:
	.ascii	"PMC_FOCR\000"
.LASF85:
	.ascii	"PMC_FSPR\000"
.LASF34:
	.ascii	"PIO_MDDR\000"
.LASF81:
	.ascii	"PMC_IDR\000"
.LASF29:
	.ascii	"PIO_IER\000"
.LASF11:
	.ascii	"__uint32_t\000"
.LASF53:
	.ascii	"PIO_AIMDR\000"
.LASF18:
	.ascii	"PIO_ODR\000"
.LASF19:
	.ascii	"PIO_OSR\000"
.LASF2:
	.ascii	"short int\000"
.LASF60:
	.ascii	"PIO_FELLSR\000"
.LASF45:
	.ascii	"PIO_IFDGSR\000"
.LASF27:
	.ascii	"PIO_ODSR\000"
.LASF98:
	.ascii	"/Users/bilas/archive/courses/428/assignments/carvgi"
	.ascii	"t.hy428/arduino_assignments/as1_helloworld/solution"
	.ascii	"\000"
.LASF61:
	.ascii	"PIO_REHLSR\000"
.LASF64:
	.ascii	"PIO_LOCKSR\000"
.LASF89:
	.ascii	"PMC_PCER1\000"
.LASF48:
	.ascii	"PIO_OWER\000"
.LASF97:
	.ascii	"led.c\000"
.LASF95:
	.ascii	"led_init\000"
.LASF73:
	.ascii	"CKGR_UCKR\000"
.LASF65:
	.ascii	"PIO_WPMR\000"
.LASF84:
	.ascii	"PMC_FSMR\000"
.LASF16:
	.ascii	"Reserved1\000"
.LASF20:
	.ascii	"Reserved2\000"
.LASF24:
	.ascii	"Reserved3\000"
.LASF56:
	.ascii	"PIO_ESR\000"
.LASF40:
	.ascii	"Reserved5\000"
.LASF42:
	.ascii	"Reserved6\000"
.LASF47:
	.ascii	"Reserved7\000"
.LASF51:
	.ascii	"Reserved8\000"
.LASF55:
	.ascii	"Reserved9\000"
.LASF74:
	.ascii	"CKGR_MOR\000"
.LASF71:
	.ascii	"PMC_PCDR0\000"
.LASF90:
	.ascii	"PMC_PCDR1\000"
.LASF31:
	.ascii	"PIO_IMR\000"
.LASF80:
	.ascii	"PMC_IER\000"
.LASF9:
	.ascii	"long double\000"
.LASF6:
	.ascii	"long long int\000"
.LASF22:
	.ascii	"PIO_IFDR\000"
.LASF23:
	.ascii	"PIO_IFSR\000"
.LASF77:
	.ascii	"PMC_MCKR\000"
.LASF96:
	.ascii	"GNU C17 11.2.1 20220111 -mcpu=cortex-m3 -mfloat-abi"
	.ascii	"=soft -mthumb -march=armv7-m -g -fmessage-length=0\000"
.LASF4:
	.ascii	"long int\000"
.LASF28:
	.ascii	"PIO_PDSR\000"
.LASF43:
	.ascii	"PIO_SCIFSR\000"
.LASF37:
	.ascii	"PIO_PUDR\000"
.LASF39:
	.ascii	"PIO_PUSR\000"
.LASF57:
	.ascii	"PIO_LSR\000"
.LASF83:
	.ascii	"PMC_IMR\000"
.LASF70:
	.ascii	"PMC_PCER0\000"
.LASF54:
	.ascii	"PIO_AIMMR\000"
.LASF1:
	.ascii	"unsigned char\000"
.LASF94:
	.ascii	"led_on\000"
.LASF87:
	.ascii	"PMC_WPMR\000"
.LASF67:
	.ascii	"PMC_SCER\000"
.LASF0:
	.ascii	"signed char\000"
.LASF7:
	.ascii	"long long unsigned int\000"
.LASF12:
	.ascii	"uint32_t\000"
.LASF8:
	.ascii	"unsigned int\000"
.LASF72:
	.ascii	"PMC_PCSR0\000"
.LASF91:
	.ascii	"PMC_PCSR1\000"
.LASF88:
	.ascii	"PMC_WPSR\000"
.LASF78:
	.ascii	"PMC_USB\000"
.LASF59:
	.ascii	"Reserved10\000"
.LASF63:
	.ascii	"Reserved11\000"
.LASF21:
	.ascii	"PIO_IFER\000"
.LASF35:
	.ascii	"PIO_MDSR\000"
.LASF58:
	.ascii	"PIO_ELSR\000"
.LASF82:
	.ascii	"PMC_SR\000"
.LASF10:
	.ascii	"char\000"
.LASF49:
	.ascii	"PIO_OWDR\000"
.LASF46:
	.ascii	"PIO_SCDR\000"
.LASF3:
	.ascii	"short unsigned int\000"
.LASF38:
	.ascii	"PIO_PUER\000"
.LASF44:
	.ascii	"PIO_DIFSR\000"
.LASF76:
	.ascii	"CKGR_PLLAR\000"
.LASF41:
	.ascii	"PIO_ABSR\000"
.LASF26:
	.ascii	"PIO_CODR\000"
.LASF5:
	.ascii	"long unsigned int\000"
.LASF36:
	.ascii	"Reserved4\000"
.LASF30:
	.ascii	"PIO_IDR\000"
.LASF32:
	.ascii	"PIO_ISR\000"
.LASF75:
	.ascii	"CKGR_MCFR\000"
.LASF62:
	.ascii	"PIO_FRLHSR\000"
.LASF66:
	.ascii	"PIO_WPSR\000"
.LASF13:
	.ascii	"PIO_PER\000"
.LASF33:
	.ascii	"PIO_MDER\000"
.LASF93:
	.ascii	"led_off\000"
.LASF17:
	.ascii	"PIO_OER\000"
.LASF25:
	.ascii	"PIO_SODR\000"
.LASF79:
	.ascii	"PMC_PCK\000"
.LASF50:
	.ascii	"PIO_OWSR\000"
.LASF52:
	.ascii	"PIO_AIMER\000"
.LASF92:
	.ascii	"PMC_PCR\000"
.LASF14:
	.ascii	"PIO_PDR\000"
.LASF15:
	.ascii	"PIO_PSR\000"
.LASF68:
	.ascii	"PMC_SCDR\000"
	.ident	"GCC: (GNU Toolchain for the Arm Architecture 11.2-2022.02 (arm-11.14)) 11.2.1 20220111"
