function [ n ] = getNBeigenvalues( A, x )
% Finds the number of eigenvalues smaller than x

[m,n] = size(A);
px = zeros(m,1); % opeenvolgende waarden van 30.9 opslaan
px(1) = A(1,1)-x;
px(2) = (A(2,2)-x)*px(1) - (A(1,2)^2);
for i=3:m
    px(i) = (A(i,i)-x)*px(i-1) - (A(i,i-1)^2)*px(i-2);
end

% sign changes tellen
s = sign(px);
if px(1)<0
    n = 1;
else
    n=0;
end

for i=2:m
    if (s(i)~=s(i-1) && s(i)~= 0)
        n = n+1;
    end
end

end