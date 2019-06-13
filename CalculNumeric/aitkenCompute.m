function result = aitkenCompute(x, xi, xj, fij, fjj)
    result = 1 / (xi-xj);
    result = result * ( (fjj * (xi-x)) - (fij*(xj-x)) );
end