function [Sdct] = matrix_dct(P)    %where P is the vector to apply the dct
N=length(P);
Cf=[1/sqrt(2),ones(1,N-1)];
S=zeros(1,N);
for f=0: N-1;
    for x=0: N-1;
        W(f+1, x+1)=cos((2*x+1)*pi*f/(2*N));  %matrix kernel
    end
end
Sdct=W*P';   
Sdct=sqrt(2/N)*Sdct.*Cf'; 