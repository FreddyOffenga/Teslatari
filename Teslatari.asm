; Testlatari
; F#READY, 2022-01-27

            org $0080

waitsync
            lda #0
            sta $d011
            sta 559

            lda $d40b
            bne waitsync

            lda $d20a
            cmp 19
            bcs waitsync

next_line
            lda $d20a
            pha
            bmi do_dec
do_inc      inc xpos
            bvc next
do_dec      dec xpos            
next
            pla
            and #$8f
            eor #$80
            sta 704

            lda #3
            sta $d40a
            sta $d011                        
            sta $d01f

xpos        = *+1
            lda #0
            sta $d004

            cmp $d20a
            bne next_line

            beq waitsync