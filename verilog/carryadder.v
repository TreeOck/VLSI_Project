module carryadder(s0, s1, s2, s3, c4, c0, a0, b0, a1, b1, a2, b2, a3, b3);

// Defining the inputs, outputs and wires of the carryadder
input c0, a0, b0, a1, b1, a2, b2, a3, b3;
output s0, s1, s2, s3, c4;

wire p0, g0, p1, g1, p2, g2, p3, g3, t1, t2, t3, t4,
    t5, t6, t7, t8, t9, t10, t11, t12, t13, t14, t15, t16;


// Defining the carryadder logic in blocks

// First, the carry-propogate and carry-generate block of the carryadder

// First digits
xor G1(p0, a0, b0);
and G2(g0, a0, b0);

// Second digits
xor G3(p1, a1, b1);
and G4(g1, a1, b1);

// Third digits
xor G5(p2, a2, b2);
and G6(g2, a2, b2);

// Fourth digits
xor G7(p3, a3, b3);
and G8(g3, a3, b3);

// Then, the carry-lookahead generator block of the carryadder

// C1
and G9(t1, p0, c0);
or G10(c1, g0, t1);

// C2
and G11(t2, p0, p1, c0);
and G12(t3, g0, p1);
or G13(t4, t3, G1);
or G14(c2, t2, t4);

// C3
and G15(t5, p0, p1, p2, c0);
and G16(t6, g0, p1, p2);
and G17(t7, g1, p2);
or G18(t8, g2, t7);
or G19(t9, t6, t8);
or G20(c3, t5, t9);

// C4
and G21(t10, p0, p1, p2, p3, c0);
and G22(t11, g0, p1, p2, p3);
and G23(t12, g1, p2, p3);
and G24(t13, g2, p3);
or G25(t14, g3, t13);
or G26(t15, t12, t14);
or G27(t16, t11, t15);
or G28(c4, t10, t16);

// Then the sum block of the carryadder

// S0
xor G29(s0, p0, c0);

// S1
xor G30(s1, p1, c1);

// S2
xor G31(s2, p2, c2);

// S3
xor G32(s3, p3, c3);

endmodule