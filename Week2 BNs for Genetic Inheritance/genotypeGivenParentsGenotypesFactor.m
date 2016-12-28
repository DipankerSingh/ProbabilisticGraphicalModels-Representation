function genotypeFactor = genotypeGivenParentsGenotypesFactor(numAlleles, genotypeVarChild, genotypeVarParentOne, genotypeVarParentTwo)
% This function computes a factor representing the CPD for the genotype of
% a child given the parents' genotypes.

% THE VARIABLE TO THE LEFT OF THE CONDITIONING BAR MUST BE THE FIRST
% VARIABLE IN THE .var FIELD FOR GRADING PURPOSES

% When writing this function, make sure to consider all possible genotypes 
% from both parents and all possible genotypes for the child.

% Input:
%   numAlleles: int that is the number of alleles
%   genotypeVarChild: Variable number corresponding to the variable for the
%   child's genotype (goes in the .var part of the factor)
%   genotypeVarParentOne: Variable number corresponding to the variable for
%   the first parent's genotype (goes in the .var part of the factor)
%   genotypeVarParentTwo: Variable number corresponding to the variable for
%   the second parent's genotype (goes in the .var part of the factor)
%
% Output:
%   genotypeFactor: Factor in which val is probability of the child having 
%   each genotype (note that this is the FULL CPD with no evidence 
%   observed)

% The number of genotypes is (number of alleles choose 2) + number of 
% alleles -- need to add number of alleles at the end to account for homozygotes

genotypeFactor = struct('var', [], 'card', [], 'val', []);

% Each allele has an ID.  Each genotype also has an ID.  We need allele and
% genotype IDs so that we know what genotype and alleles correspond to each
% probability in the .val part of the factor.  For example, the first entry
% in .val corresponds to the probability of having the genotype with
% genotype ID 1, which consists of having two copies of the allele with
% allele ID 1, given that both parents also have the genotype with genotype
% ID 1.  There is a mapping from a pair of allele IDs to genotype IDs and 
% from genotype IDs to a pair of allele IDs below; we compute this mapping 
% using generateAlleleGenotypeMappers(numAlleles). (A genotype consists of 
% 2 alleles.)

[allelesToGenotypes, genotypesToAlleles] = generateAlleleGenotypeMappers(numAlleles);

% One or both of these matrices might be useful.
%
%   1.  allelesToGenotypes: n x n matrix that maps pairs of allele IDs to 
%   genotype IDs, where n is the number of alleles -- if 
%   allelesToGenotypes(i, j) = k, then the genotype with ID k comprises of 
%   the alleles with IDs i and j
%
%   2.  genotypesToAlleles: m x 2 matrix of allele IDs, where m is the 
%   number of genotypes -- if genotypesToAlleles(k, :) = [i, j], then the 
%   genotype with ID k is comprised of the allele with ID i and the allele 
%   with ID j

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%INSERT YOUR CODE HERE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  

% Fill in genotypeFactor.var.  This should be a 1-D row vector.
genotypeFactor.var = [genotypeVarChild,genotypeVarParentOne,genotypeVarParentTwo];
% Fill in genotypeFactor.card.  This should be a 1-D row vector.
genotypeFactor.card = [size(genotypesToAlleles,1),size(genotypesToAlleles,1),size(genotypesToAlleles,1)];

genotypeFactor.val = zeros(1, prod(genotypeFactor.card));
% Replace the zeros in genotypeFactor.val with the correct values.
for i = 1 : numAlleles
  for j = 1 : numAlleles
    for k = 1: numAlleles
      for l = 1: numAlleles
        for m = 1:numAlleles
          for n = 1:numAlleles
            temp1 = [0];
            temp2 = [0];
            temp3 = [0];
            temp4 = [0];
            if m == i
              temp1(1) = temp1(1) + 1;
            end
            if m == j 
              temp1(1) = temp1(1) + 1;
            end
            if m == k
              temp2(1) = temp2(1) + 1;
            end
            if m == l 
              temp2(1) = temp2(1) + 1;
            end
            if n == i
              temp3(1) = temp3(1) + 1;
            end
            if n == j 
              temp3(1) = temp3(1) + 1;
            end
            if n == k
              temp4(1) = temp4(1) + 1;
            end
            if n == l 
              temp4(1) = temp4(1) + 1;
            end
            genotypeFactor.val(1,((allelesToGenotypes(i,j) - 1)*size(genotypesToAlleles,1)*size(genotypesToAlleles,1)) + ((allelesToGenotypes(k,l)-1)*size(genotypesToAlleles,1)) + allelesToGenotypes(m,n)) = ((temp1(1)/2)*(temp4(1)/2)) + ((temp2(1)/2)*(temp3(1)/2)); 
            if m == n
            genotypeFactor.val(1,((allelesToGenotypes(i,j) - 1)*size(genotypesToAlleles,1)*size(genotypesToAlleles,1)) + ((allelesToGenotypes(k,l)-1)*size(genotypesToAlleles,1)) + allelesToGenotypes(m,n)) = genotypeFactor.val(1,((allelesToGenotypes(i,j) - 1)*size(genotypesToAlleles,1)*size(genotypesToAlleles,1)) + ((allelesToGenotypes(k,l)-1)*size(genotypesToAlleles,1)) + allelesToGenotypes(m,n))/2;  
            end
          end
        end
      end
    end
  end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%