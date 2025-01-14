#!/bin/sh

# Run the interactive cQA simulations using BERT-cQA model

# Job name
#PBS -N intcqa_bert

# Output file
#PBS -o pbs_intercqabert_output.log

# Error file
#PBS -e pbs_intercqabert_err.log

# request resources and set limits
#PBS -l walltime=72:00:00
#PBS -l select=1:ncpus=24:mem=128GB:ompthreads=24
# 'select' chooses number of nodes.

#  load required modules
module load lang/python/anaconda/pytorch

# We might need to add the global paths to our code to the pythonpath. Also set the data directories globally.
cd /work/es1595/text_ranking_bayesian_optimisation

# Run the script using heuristics only and no interactions.

#  run the script with GPPL-IMP, GPPL-UNPA, GPPL-EIG, GPPL-Random, BT-Random.
#python -u stage1_coala.py GPPLHH 0 cqa_bert_imp_gpplhh "[imp]" . 4 10 BERT
#python -u stage1_coala.py H 0 cqa_bert_H "[random]" . 4 10 BERT
python -u stage1_coala.py LR     0 cqa_bert_DR2_unc_lr     "[unc]" . 4 10 BERT
#python -u stage1_coala.py LR     0 cqa_bert_ran_lr     "[random]" . 4 10 BERT
python -u stage1_coala.py GPPLHH 0 cqa_bert_DR2_ran_gpplhh "[random]" . 4 10 BERT
python -u stage1_coala.py GPPLHH 0 cqa_bert_DR2_eig_gpplhh "[eig]" . 4 10 BERT
#
python -u stage1_coala.py GPPLHH 0 cqa_bert_DR2_imp_gpplhh_1 "[imp]" . 4 1 BERT
#python -u stage1_coala.py LR     0 cqa_bert_unc_lr_1     "[unc]" . 4 1 BERT
#python -u stage1_coala.py LR     0 cqa_bert_ran_lr_1     "[random]" . 4 1 BERT
python -u stage1_coala.py GPPLHH 0 cqa_bert_DR2_ran_gpplhh_1 "[random]" . 4 1 BERT
python -u stage1_coala.py GPPLHH 0 cqa_bert_DR2_eig_gpplhh_1 "[eig]" . 4 1 BERT

python -u stage1_coala.py GPPLHH 0 cqa_bert_DR2_imp_gpplhh_5 "[imp]" . 4 5 BERT
#python -u stage1_coala.py LR     0 cqa_bert_unc_lr_5     "[unc]" . 4 5 BERT
#python -u stage1_coala.py LR     0 cqa_bert_ran_lr_5     "[random]" . 4 5 BERT
python -u stage1_coala.py GPPLHH 0 cqa_bert_DR2_ran_gpplhh_5 "[random]" . 4 5 BERT
python -u stage1_coala.py GPPLHH 0 cqa_bert_DR2_eig_gpplhh_5 "[eig]" . 4 5 BERT

python -u stage1_coala.py GPPLHH 0 cqa_bert_DR2_imp_gpplhh_15 "[imp]" . 4 15 BERT
#python -u stage1_coala.py LR     0 cqa_bert_unc_lr_15     "[unc]" . 4 15 BERT
#python -u stage1_coala.py LR     0 cqa_bert_ran_lr_15     "[random]" . 4 15 BERT
python -u stage1_coala.py GPPLHH 0 cqa_bert_DR2_ran_gpplhh_15 "[random]" . 4 15 BERT
python -u stage1_coala.py GPPLHH 0 cqa_bert_DR2_eig_gpplhh_15 "[eig]" . 4 15 BERT

python -u stage1_coala.py GPPLHH 0 cqa_bert_DR2_imp_gpplhh_20 "[imp]" . 4 20 BERT
#python -u stage1_coala.py LR     0 cqa_bert_ran_lr_20     "[random]" . 4 20 BERT
#python -u stage1_coala.py LR     0 cqa_bert_unc_lr_20    "[unc]" . 4 20 BERT
python -u stage1_coala.py GPPLHH 0 cqa_bert_DR2_ran_gpplhh_20 "[random]" . 4 20 BERT
python -u stage1_coala.py GPPLHH 0 cqa_bert_DR2_eig_gpplhh_20 "[eig]" . 4 20 BERT

# To submit: qsub run_bert_cqa.sh
# To display the queue: qstat -Q gpu (this is usually where the GPU job ends up)
# Display server status: qstat -B <server>
# Display job information: qstat <jobID>

# To monitor job progress:
# qstat -f | grep exec_host
# Find the node where this job is running.
# ssh to the node.
# tail /var/spool/pbs/spool/<job ID>.bp1.OU
