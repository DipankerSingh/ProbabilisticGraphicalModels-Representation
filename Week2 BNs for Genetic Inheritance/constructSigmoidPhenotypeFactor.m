function phenotypeFactor = constructSigmoidPhenotypeFactor(alleleWeights, geneCopyVarOneList, geneCopyVarTwoList, phenotypeVar)
% This function takes a cell array of alleles' weights and constructs a 
% factor expressing a sigmoid CPD.
%
% You can assume that there are only 2 genes involved in the CPD.
%
% In the factor, for each gene, each allele assignment maps to the allele
% whose weight is at the corresponding location.  For example, for gene 1,
% allele assignment 1 maps to the allele whose weight is at
% alleleWeights{1}(1) (same as w_1^1), allele assignment 2 maps to the
% allele whose weight is at alleleWeights{1}(2) (same as w_2^1),....  
% 
% You may assume that there are 2 possible phenotypes.
% For the phenotypes, assignment 1 maps to having the physical trait, and
% assignment 2 maps to not having the physical trait.
%
% THE VARIABLE TO THE LEFT OF THE CONDITIONING BAR MUST BE THE FIRST
% VARIABLE IN THE .var FIELD FOR GRADING PURPOSES
%
% Input:
%   alleleWeights: Cell array of weights, where each entry is an 1 x n 
%   of weights for the alleles for a gene (n is the number of alleles for
%   the gene)
%   geneCopyVarOneList: m x 1 vector (m is the number of genes) of variable 
%   numbers that are the variable numbers for each of the first parent's 
%   copy of each gene (numbers in this list go in the .var part of the
%   factor)
%   geneCopyVarTwoList: m x 1 vector (m is the number of genes) of variable 
%   numbers that are the variable numbers for each of the second parent's 
%   copy of each gene (numbers in this list go in the .var part of the
%   factor) -- Note that both copies of each gene are from the same person,
%   but each copy originally came from a different parent
%   phenotypeVar: Variable number corresponding to the variable for the 
%   phenotype (goes in the .var part of the factor)
%
% Output:
%   phenotypeFactor: Factor in which the values are the probabilities of 
%   having each phenotype for each allele combination (note that this is 
%   the FULL CPD with no evidence observed)

phenotypeFactor = struct('var', [], 'card', [], 'val', []);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% INSERT YOUR CODE HERE
% Note that computeSigmoid.m will be useful for this function.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  

% Fill in phenotypeFactor.var.  This should be a 1-D row vector.
phenotypeFactor.var(1,1) = phenotypeVar;
for i = 1:size(geneCopyVarOneList,1)
  phenotypeFactor.var(1,i+1) = geneCopyVarOneList(i);
end 
for i = 1:size(geneCopyVarTwoList,1)
  phenotypeFactor.var(1,i+1+size(geneCopyVarOneList,1)) = geneCopyVarTwoList(i);
end

% Fill in phenotypeFactor.card.  This should be a 1-D row vector.
phenotypeFactor.card = ones(1,length(phenotypeFactor.var));
phenotypeFactor.card(1,1) = 2;
for i = 1:size(geneCopyVarOneList,1)
  phenotypeFactor.card(1,i+1) = length(alleleWeights{i});
  phenotypeFactor.card(1,i+1+size(geneCopyVarOneList,1)) = length(alleleWeights{i});
end  

phenotypeFactor.val = zeros(1, prod(phenotypeFactor.card));
% Replace the zeros in phentoypeFactor.val with the correct values.
temp = [1];
for i = 1:length(alleleWeights{2})
  for j = 1:length(alleleWeights{1})
    for k = 1:length(alleleWeights{2})
      for l = 1:length(alleleWeights{1})
        phenotypeFactor.val(1,temp(1)) = alleleWeights{2}(i) + alleleWeights{1}(j) + alleleWeights{2}(k) + alleleWeights{1}(l);   
        temp(1) = temp(1) + 2;  
      end
    end
  end
end
temp = [2];
phenotypeFactor.val = computeSigmoid(phenotypeFactor.val);
temp = [2];
for i = 1:2:prod(phenotypeFactor.card)
  phenotypeFactor.val(1,temp(1)) = 1 - phenotypeFactor.val(1,i);
  temp(1) = temp(1) + 2;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%