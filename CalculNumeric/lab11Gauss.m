A = [ 3 -1  0  0  0  0;
     -1  3 -1  0  0  0;
      0 -1  3 -1  0  0;
      0  0 -1  3 -1  0;
      0  0  0 -1  3 -1;
      0  0  0  0 -1  3 ];

b = [2; 1; 1; 1; 1; 2];

A1 = [ 3  1  1;
      -2  4  0;
      -1  2 -6 ];

b1 = [12; 2; -5];

solve(A,b,0.000001)
solve(A1,b1,0.000001)

function ret = solve(A, b, er)
    [~,n] = size(A);
    x = rand(n,1);
    xx = rand(n,1);
    count = 0;
    
  while(norm(x - xx) > er)
        count= count+1;
        if(count>100)
            break;
        end
        x = xx;
        xx = zeros(n,1);
        
        for i=1:n
            subtract = 0;
            for j = 1:n%A(i,1:i-1) * x(1:i-1) - A(i,i+1:n) * x(i+1:n)
                if(j==i)
                    continue;
                end
                if(j<i)
                    subtract = subtract + A(i,j) * xx(j);
                end
                if(j>i)
                    subtract = subtract + A(i,j) * x(j);
                end
                
            end
            xx(i) = 1 / A(i, i) * (b(i) - subtract);

        end
  end
%return current step count and solution vector
count
ret = x;
end