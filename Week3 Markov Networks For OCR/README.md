Markov Networks for OCR
==========

Programming Assignment 2 in Probabilistic Graphical Models course of Daphne Koller.  
The course info can be found here https://class.coursera.org/pgm-003/class/index.  
The details of this assignment is described in PA-Markov-Networks-for-OCR.pdf

The codes are written by Octave.  
For further info of Octave please see http://www.gnu.org/software/octave/

In this assignment, applied the graphical model framework to the task of optical character recognition (OCR).
The goal is to accept as input an image of text and output the text content itself.
A small Markov network for OCR will be created.

This set include the following functions:

1.ComputeImageFactor.m: a function that scores the match between
each individual image/character pair. It returns a vector of K(number of possible characters,here 26) values. The ith entry in that vector is the “score” for character i on the provided image.

2.ComputeSingletonFactors.m: This function takes a list of images and the provided image model. It generates one factor for every image provided.
The factor values are given by the vector returned from ComputeImageFactor on
each image. 

3.RunInference.m: This function calls a binary (C++) implementation of an inference engine to find the MAP assignment given a set of factors.

4.BuildOCRNetwork.m: This function strings together all of the factors for a single word.

5. ComputeJointDistribution.m - This function should return a factor representing the 
   joint distribution given a set of factors that define a Bayesian network. You may assume that 
   you will only be given factors defining valid CPDs, so no input validation is required.

6.ComputeWordPredictions.m: This function accepts the cell array of word images (i.e.,allWords) and returns a cell array such that wordPredictions{i} is an array of the predicted (MAP) assignments to the ith word’s characters.

7.ScorePredictions.m: Given allWords and the predictions computed by ComputeWordPredictions.m, returns the character and word level accuracies. The character level accuracy is simply the number of correctly identified characters divided by the total number of characters.
The word accuracy is the number of words in which every character is correctly identified divided by the total number of words.

8.ScoreModel.m: A wrapper around the above two function, this computes the character and word accuracies for the current model.

9.ComputeEqualPairwiseFactors.m: This function accepts an
array of the images in one word and the value K, the size of the alphabet (for our purposes,it is 26). It should compute the n-1 pairwise factors.For this function,assignd a value of 1 to every single possible factor value.

10.ComputePairwiseFactors.m: This function is just like ComputeEqualPairwiseFactors,but it also uses the pairwiseModel. For the factor values, an assignment of character i to the first character and character j to the second should have a score of pairwiseModel(i,j).

11.ComputeTripletFactors.m: This function is just like ComputePairwiseFactors, except that it uses tripletList.mat to compute factors over triplets.

12.ComputeSimilarityFactor.m: This function accepts a list of all the images in a word and two indices, i and j. It returns one factor: the similarity factor between the ith and jth images. 

13.ComputeAllSimilarityFactors.m: This function computes a list of every similarity factor for the images in a given word. That is, it uses ComputeSimilarityFactor for every i; j pair (i != j) in the word and return the resulting list of factors.

14.ChooseTopSimilarityFactors.m: This function takes in an array of all the similarity factors and a parameter F, and return the top F factors based on their similarity score. Ties may be broken arbitrarily.

15. AssignmentToIndex.m - Converts an assignment, A, over variables with cardinality D 
   to an index into the .val vector for a factor.

16. IndexToAssignment.m - converts an index, I, into the .val vector into an assignment 
   over variables with cardinality D.

17. GetValueOfAssignment.m - Gets the value of a variable assignment in a factor.

18. SetValueOfAssignment.m - Sets the value of a variable assignment in a factor.

