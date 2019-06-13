function [result, step] = romberg(f, a, b, err)
    h = b-a;

    previous = h/2 * (f(a) + f(b));             %Q_t0
    current = 1/2 * previous + h * f(a + h/2);  %Q_t1
    
    i = 2; %We start computing from Q_t2
    %i is only used in computing the step
    while abs(current - previous) > err
        previous = current;
        
        frac = 1 / (2^i); %so we don't compute this a lot of times
        start = frac * h;
        step = 2 * start;
        finish = (1 - frac) * h;
        x = start : step : finish;
        x = x + a; %don't forget to add all the a's
        
        current = 1/2 * previous + h * frac * sum(f(x));
        
        i = i + 1;
    end
    
    result = current;
    step = i;
end