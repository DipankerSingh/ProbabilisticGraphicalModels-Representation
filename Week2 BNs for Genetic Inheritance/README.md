Bayesian-Network-for-Genetic-Inheritance
========================================
This is programming assignment 2 in Probabilistic Graphical Models course of Daphne Koller.  
The course info can be found here https://class.coursera.org/pgm-003/class/index.  
The details of this assignment is described in PA2Description.pdf.  
Further information of genetic, allele, and inheritance please see PA2Appendix.pdf

The codes are written by Octave.  
For further info of Octave please see http://www.gnu.org/software/octave/

In this assignment set, a small Bayesian network for evaluating client's credit will be created.  
This set include the following functions:

1. AssignmentToIndex.m - Converts an assignment, A, over variables with cardinality D to an index 
   into the .val vector for a factor.

2. IndexToAssignment.m - Converts an index, I, into the .val vector into an assignment 
   over variables with cardinality D.

3. SetValueOfAssignment.m - Sets the value of a variable assignment in a factor.

4. computeSigmoid.m - Computes the value of the sigmoid of all of the numbers in 
   an n x 1 vector, where n is the length of z.

5. GetValueOfAssignment.m - Gets the value of a variable assignment in a factor.

6. childCopyGivenFreqsFactor.m - Creates a factor whose values are the frequencies of each 
   allele in the population.

7. phenotypeGivenGenotypeMendelianFactor.m - Computes the probability of each phenotype 
   given the different genotypes for a trait.  It assumes that there is 1 dominant
   allele and 1 recessive allele.

8. phenotypeGivenGenotypeFactor.m - Computes the probability of each phenotype given the 
   different genotypes for a trait.

9. genotypeGivenAlleleFreqsFactor.m - This function computes the probability of each genotype 
   given the allele frequencies in the population.

10. genotypeGivenParentsGenotypesFactor.m - This function computes a factor representing 
    the CPD for the genotype of a child given the parents' genotypes.

11. constructGeneticNetwork.m - This function constructs a Bayesian network for genetic inheritance.  
    It assumes that there are only 2 phenotypes.  It also assumes that either both parents are 
    specified or neither parent is specified.

12. childCopyGivenParentalsFactor.m - This function makes a factor with the probability of 
    a child inheriting each allele from a parent given each possibility for that parent's 
    maternal copy of the gene and that parent's paternal copy of the gene.

13. phenotypeGivenCopiesFactor.m - This function makes a factor whose values are the 
    probabilities of a phenotype given an allele combination.

14. constructDecoupledGeneticNetwork.m - This function constructs a Bayesian network 
    for genetic inheritance.  It assumes that there are only 2 phenotypes.  It also assumes that, 
    in the pedigree, either both parents are specified or neither parent is specified.

15. constructSigmoidPhenotypeFactor.m - This function takes a cell array of alleles' weights 
    and constructs a factor expressing a sigmoid CPD.

16. generateAlleleGenotypeMappers.m - This function creates a map from pairs of allele IDs 
    to genotype IDs and from genotype IDs to pairs of allele IDs.

17. sampleGeneticNetworks.m - This script contains the solutions for the code for some simple examples.

