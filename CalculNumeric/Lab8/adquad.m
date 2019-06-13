function I = adquad(f, a, b, err)
    I1 = repsimpson(f, a, b, 1);
    I2 = repsimpson(f, a, (a+b)/2, 1) + repsimpson(f, (a+b)/2, b, 1);
    
    if abs(I1 - I2) < 15 * err
        I = I2;
    else
        I = adquad(f, a, (a+b)/2, err/2) + adquad(f, (a+b)/2, b, err/2);
    end
end