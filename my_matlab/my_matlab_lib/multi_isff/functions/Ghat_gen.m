function [Ghat] = Ghat_gen(Go,k,n)

%%% generate the Go without ones (ratio to self)

for i=1:n
    temp = Go(i,:);
    temp(k) = [];
    Ghat(i,:) = temp;
end