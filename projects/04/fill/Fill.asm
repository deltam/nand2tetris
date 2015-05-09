// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, the
// program clears the screen, i.e. writes "white" in every pixel.

// Put your code here.
(START)
    // clear
    @24575 // SCREENの最後アドレス
    M=0   // 最後のアドレスに番兵を設定
    @SCREEN
    D=A
    @R0
    M=D
(CLEAR)
    @R0
    A=M
    D=M
    @LOOP
    D;JEQ // SCREENメモリの番兵に到着したら終わる
    @R0
    A=M
    M=0
    @R0
    M=M+1
    @CLEAR
    0;JMP

(LOOP)
    @KBD
    D=M
    @START // キーが押されてなかったらクリアしてループ継続
    D;JEQ

    @24575 // SCREENの最後アドレス
    M=-1   // 最後のアドレスに番兵を設定
    @SCREEN
    D=A
    @R0
    M=D
(FILL)
    @R0
    A=M
    D=M
    @LOOP
    D;JLT // SCREENメモリの番兵に到着したらLOOPに戻る
    @R0
    A=M
    M=-1
    @R0
    M=M+1
    @FILL
    0;JMP
