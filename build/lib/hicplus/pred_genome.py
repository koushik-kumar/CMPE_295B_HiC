import os,sys
import logging
from torch.utils import data
from hicplus import model
import torch
import torch.nn as nn
import torch.optim as optim
from torch.autograd import Variable
import straw
from scipy.sparse import csr_matrix, coo_matrix, vstack, hstack
from scipy import sparse
import numpy as np
from hicplus import utils
from time import gmtime, strftime
from datetime import datetime
import argparse

startTime = datetime.now()

def pred_genome():
    genomeH = np.array([])
    for i in range(19,23):
        genomeV = np.array([])
        for j in range(19,23):
            if j < i:
                continue
            MatV = chrMatrix_pred(i,j)
            genomeV = hstack([genomeV, MatV]) if genomeV.size else MatV
            logging.debug(str(i) +','+str(j))
        chrh = vstack([genomeH, genomeV])

    return(genomeH)


def main():
    Mat = pred_genome().toarray()
    #logging.debug(str((Mat.shape))
    np.save('genome.pred.npy', Mat)

if __name__ == '__main__':
    main()
