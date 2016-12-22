Credit-Net
==========

Programming Assignment 1 in Probabilistic Graphical Models course of Daphne Koller.  
The course info can be found here https://class.coursera.org/pgm-003/class/index.  
The details of this assignment is described in PGM_Programming_Assignment_1.pdf

The codes are written by Octave.  
For further info of Octave please see http://www.gnu.org/software/octave/

In this assignment set, a small Bayesian network for evaluating client's credit will be created.
This set include the following functions:

1. FactorProduct.m - This function should compute the product of two factors. 

2. FactorMarginalization.m - This function should sum over the given variables in a given factor 
   and return the resulting factor.

3. ObserveEvidence.m - This function should modify a set of factors given the observed values 
   of some of the variables, so that assignments not consistent with the observed values are 
   set to zero (in effect, reducing them). These factors do not need to be renormalized.

4. ComputeJointDistribution.m - This function should return a factor representing the 
   joint distribution given a set of factors that define a Bayesian network. You may assume that 
   you will only be given factors defining valid CPDs, so no input validation is required.

5. ComputeMarginal.m - This function should return the marginals over input variables 
   (the input variables are those that remain in the marginal), given a set of factors 
   that define a Bayesian network, and, optionally, evidence.

6. ConvertNetwork.m - Reads in files in the .net format of SAMIAM into a vector (struct array) of factors. 
   For further info of Samiam please see http://reasoning.cs.ucla.edu/samiam/

7. StandardizeFactor.m - Sorts the variables in F and returns an equivalent factor G.  
   Used only to standardize output for grading purposes.  

8. AssignmentToIndex.m - Converts an assignment, A, over variables with cardinality D 
   to an index into the .val vector for a factor.

9. IndexToAssignment.m - converts an index, I, into the .val vector into an assignment 
   over variables with cardinality D.

10. GetValueOfAssignment.m - Gets the value of a variable assignment in a factor.

11. SetValueOfAssignment.m - Sets the value of a variable assignment in a factor.

12. FactorTutorial.m - Detailed description of the factor data structure and related functions.

13. Credit_net.net - Credit net in the format of Samiam