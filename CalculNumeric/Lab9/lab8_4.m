tk = 1 : 5;
% tk = 1 ./ tk;
MyVandermonde(tk)
fliplr(vander(tk))

% clear;
% fprintf("Conditioning numbers for Vandermonde matrices with tk = 1/k are:\n");
% for i = 10 : 15
%     tk = 1 : i;
%     tk = 1 ./ tk;
%     
%     V = vander(tk);
%     cdnNr = cond(V);
%     fprintf("for i=%d -> cond: %f\n", i, cdnNr);
% end
% 
% fprintf("\nConditioning numbers for Vandermonde matrices with tk = -1 + 2k/n are:\n");
% for i = 10 : 15
%     tk = 1 : i;
%     tk = (2*tk)/i - 1;
%     
%     V = vander(tk);
%     cdnNr = cond(V);
%     fprintf("for i=%d -> cond: %f\n", i, cdnNr);
% end

function result = MyVandermonde(tk)
    n = length(tk);
    
    tk = rot90(tk, -1);
    result = ones(n);
    result(:, 2) = tk; 
    for i = 3 : n
        result(:, i) = result(:, 2) .^ (i - 1);
    end
end