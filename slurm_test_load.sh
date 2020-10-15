#!/bin/bash
#
#SBATCH --job-name=Hi-C_KD
#SBATCH --output=Hi-C_test_1gpu_100e_50k.log
#
#SBATCH --time=46:30:00
#SBATCH --nodes=1   # number of nodes
#SBATCH --ntasks=1
#SBATCH --gres=gpu:1
#SBATCH --gpus-per-task=1
#SBATCH --mem-per-gpu=8000
#SBATCH --mem-per-cpu=20000

#SBATCH --partition=gpu
#SBATCH --mail-user=Khang.Doan@sjsu.edu
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL
#SBATCH --mail-type=BEGIN
export OMP_NUM_THREADS=4
export OMP_PLACES=cores
export OMP_PROC_BIND=spread
conda init bash
echo "Starting Job"
source activate hicPlus_36
python --version
cd ~/workspace/hicplus
module load cuda/10.1
srun hicplus train -i ~/uploads/gm12878_in_situ_paternal.hic -r 16 -c 19 
#srun hicplus train -i ~/uploads/gm12878_in_situ_paternal.hic -r 16 -c 19 -k /home/007402876/workspace/hicplus/model/2020-10-14/model500.model
# srun hicplus train -i ~/uploads/CP190_HiChIP.hic -r 8 -c 19
#&> ~/workspace/hicplus/trainingLog1.txt 

#hicplus train -i ~/uploads/gm12878_in_situ_paternal.hic -r 16 -c 19 > trainingLog.txt

echo "job finished"
exit 0
