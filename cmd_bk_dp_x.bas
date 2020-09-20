!--------------------------------------------------
!- Sunday, September 20, 2020 1:54:47 AM
!- Import of : 
!- c:\users\markx\google drive\prg\programming\jellyfish\cmd_bk_dp_x.prg
!- Commodore 64
!--------------------------------------------------
100 V=9:REM INPUT"{white}device";V
105 IF V<8 OR V>11 GOTO 100
110 INPUT"track";T
115 IF T<1 OR T>255 GOTO 110
120 INPUT"sector";S
125 IF S<O OR S>255 GOTO 120
200 OPEN15,V,15:OPEN5,V,5,"#"
210 PRINT#15,"u1";5;0;T;S
300 PT=0:FOR I=0 TO 255
310 GET#5,I$:IF I$="" THEN I$=CHR$(0)
320 H$=I$:H=ASC(H$)
350 IF H<32 THEN H$=CHR$(150)+"."+CHR$(5)
360 IF H>127 AND H<159 THEN H$=CHR$(154)+"."+CHR$(5)
370 IF H=160 THEN H$=CHR$(18)+CHR$(154)+" "+CHR$(146)+CHR$(5)
399 REM HEADER
400 IF T=1 AND S=1 THEN GOSUB 1000
404 REM BAM
405 IF T=1 AND S>1 AND S<34 THEN GOSUB 2000
409 REM DIR
410 IF T=1 AND S>33 AND S<64 THEN GOSUB 3000
414 REM BLOCK
415 IF T=1 AND S>63 THEN GOSUB 4000
416 IF T=1 AND S=0 THEN GOSUB 4000
420 IF T>1 THEN GOSUB 4000
500 NEXT I
800 CLOSE5:CLOSE15
900 END
1000 REM HEADER OUTPUT
1110 IF I<2 THEN PRINT H" ";
1115 IF I=2 OR I=32 OR I=39 THEN PRINT
1120 IF I>2 AND I<32 THEN PRINT H$;
1140 IF I>31 AND I<39 THEN PRINT H" ";
1150 IF I>38 THEN PRINT H$;
1500 RETURN
2000 REM BAM OUTPUT
2110 IF S<3 GOTO 2200
2120 PRINT H;
2150 RETURN
2200 IF I<2 THEN PRINT H" ";
2210 IF I=2 OR I=7 OR I=9 OR I=32 THEN PRINT
2220 IF I>1 AND I<7 THEN PRINT H$;
2240 IF I>6 AND I<9 THEN PRINT H" ";
2260 IF I>9 AND I<32 THEN PRINT H$;
2280 IF I>31 THEN PRINT H;
2500 RETURN
3000 REM DIR OUTPUT
3100 IF PT<2 THEN PRINT H" ";
3110 IF PT=2 OR PT=21 OR PT=30 THEN PRINT
3115 IF PT>1 AND PT<5 THEN PRINT H" ";
3120 IF PT>4 AND PT<21 THEN PRINT H$;
3140 IF PT>20 AND PT<30 THEN PRINT H" ";
3160 IF PT>29 THEN PRINT H" ";
3170 PT=PT+1:IF PT>31 THEN PT=0
3500 RETURN
4000 REM BLOCK OUTPUT
4110 IF I<4 THEN PRINT H" ";
4115 IF I=4 OR I=255 THEN PRINT
4120 IF I>3 THEN PRINT H$;
4500 RETURN
9000 REM OPEN15,9,15:OPEN5,9,5,"#"
9001 REM PRINT#15,"b-a:";0;15;155
9002 REM INPUT#15,EE,E$,TT,SS
9003 REM PRINT EE E$ TT SS
9004 REM CLOSE5:CLOSE15
9100 REM OPEN15,9,15:OPEN5,9,5,"#"
9101 REM PRINT#15,"u1";5;0;15;134
9102 REM PRINT#15,"b-p";5;1
9103 REM GET#5,A$:IF A$="" THEN A$=CHR$(0)
9104 REM PRINT ASC(A$)
9105 REM PRINT#15,"b-p";5;1
9106 REM PRINT#5,CHR$(156)
9107 REM PRINT#15,"u2";5;0;15;134
9108 REM PRINT#15,"u1";5;0;15;134
9109 REM PRINT#15,"b-p";5;1
9110 REM GET#5,A$:IF A$="" THEN A$=CHR$(0)
9111 REM PRINT ASC(A$)
9112 REM CLOSE5:CLOSE15
11110 OPEN15,9,15:OPEN5,9,15,"#"
11120 PRINT#15,"cP"+CHR$(0)
11130 PRINT#15,"m-w"+CHR$(0)+CHR$(40)+CHR$(2)+CHR$(1)+CHR$(0)
11140 PRINT#15,"m-w"+CHR$(40)+CHR$(0)+CHR$(1)+CHR$(128)
11150 PRINT#15,"m-r"+CHR$(40)+CHR$(0)+CHR$(1)
11160 GET#15,Q$
11165 IF Q$=""THEN Q$=CHR$(0)
11167 IF ASC(Q$)>127THEN11150
11170 PRINT"status";ASC(Q$)
11180 PRINT#15,"m-r"+CHR$(192)+CHR$(40)+CHR$(2)
11190 GET#15,Q$:TT=ASC(Q$)
11200 GET#15,Q$:TS=ASC(Q$)
11210 PRINT"transtrack&sector";TT;" ";TS
11220 PRINT#15,"m-r"+CHR$(0)+CHR$(3)+CHR$(0)
11230 FORX=0TO15
11235 D=X
11237 GOSUB12000
11240 PRINT D$;TAB(6);:D$=""
11250 FORY=1TO16
11260 GET#15,Q$
11265 IF Q$="" THEN Q$=CHR$(0)
11266 D=ASC(Q$)
11268 IFD>31 AND D<96 THEN D$=CHR$(D):GOTO11270
11269 GOSUB12000
11270 PRINT D$;:D$=""
11280 NEXT Y
11290 PRINT
11300 NEXT X
11500 CLOSE5:CLOSE15
11505 END
12000 D1=ABS(D)
12001 D2=INT(D1/16)
12002 D1=D1-(D2*16)
12003 IFD1<10THEN D$=CHR$(48+D1)+D$
12004 IFD1>9THEN D$=CHR$(55+D1)+D$
12005 IFD2<10THEN D$=CHR$(48+D2)+D$
12006 IFD2>9THEN D$=CHR$(55+D2)+D$
12007 RETURN