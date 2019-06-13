clear;
fprintf("Conditioning numbers for Hilbert matrices are:\n");
for i = 10 : 15
    H = hilb(i);
    cdnNr = cond(H);
    fprintf("for i = %d -> cond = %f\n", i, cdnNr);
end