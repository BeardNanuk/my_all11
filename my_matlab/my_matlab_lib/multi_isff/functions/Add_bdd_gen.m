function [Add,bdd] = Add_bdd_gen(Go,Ghat,ro,k,n)

%%% generate the Add, bdd for a source k

ntotal=0;

for i = 1:n
    for j = 1:n
%         fprintf('i,j: %d %d\n',i,j);
        if j~=i
        ntotal=ntotal+1;
        ro(j);
        bdd(ntotal,:)= - Go(i,k)+ro(i)/ro(j)*Go(j,k);
        Add(ntotal,:) = Ghat(i,:) - ro(i)/ro(j) * Ghat(j,:);
        end
    end
end