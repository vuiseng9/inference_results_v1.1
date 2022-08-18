#!/bin/bash

# sudo pqos -R 
# sudo pqos -a "llc:1=0-15;llc:2=16-31;"
# sudo pqos -e "llc:1=0x00f;llc:2=0xff0;"
# sudo pqos -e "mba:1=100;mba:2=100;"

# mkdir perf_bert_4_8_100_100
# numactl -m 0 -N 0 -C 0-15 /data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/build/bert_inference -n 4 -j 4 --test_scenario=Server --model_file=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/bert.pt --sample_file=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/squad.pt --mlperf_config=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/inference/mlperf.conf --user_config=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/user.conf -o perf_bert_4_8_100_100 -b 2 &
# P1=$!

# python3 run.py --workload-name resnet50 \
#     --mlperf-conf resnet50/pytorch-cpu/mlperf_inference/mlperf.conf \
#     --user-conf resnet50/pytorch-cpu/scripts/ICX/user.conf.ICX40C_2S \
#     --workload-config resnet50/pytorch-cpu/scripts/ICX/resnet50-config_Server_ICX40C_2S.yml \
#     --num-instance 16 \
#     --cpus-per-instance 1 \
#     --cores-offset 16 \
#     --warmup 500 \
#     --output-dir perf_resnet50_4_8_100_100 \
#     --scenario Server \
#     --mode Performance &
# P2=$!
# sleep 300
# ps aux > pid_list
# python3 filter_pid.py pid_list python3 > tmp
# python3 filter_pid.py pid_list bert_inference >> tmp
# cat tmp | sudo kill `xargs`
# wait $P1 $P2

# sudo pqos -R 
# sudo pqos -a "llc:1=0-15;llc:2=16-31;"
# sudo pqos -e "llc:1=0x00f;llc:2=0xff0;"
# sudo pqos -e "mba:1=100;mba:2=100;"

# mkdir perf_bert_4_8_100_100
# numactl -m 0 -N 0 -C 0-15 /data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/build/bert_inference -n 4 -j 4 --test_scenario=Server --model_file=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/bert.pt --sample_file=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/squad.pt --mlperf_config=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/inference/mlperf.conf --user_config=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/user.conf -o perf_bert_4_8_100_100 -b 2 &
# P1=$!

# python3 run.py --workload-name resnet50 \
#     --mlperf-conf resnet50/pytorch-cpu/mlperf_inference/mlperf.conf \
#     --user-conf resnet50/pytorch-cpu/scripts/ICX/user.conf.ICX40C_2S \
#     --workload-config resnet50/pytorch-cpu/scripts/ICX/resnet50-config_Server_ICX40C_2S.yml \
#     --num-instance 16 \
#     --cpus-per-instance 1 \
#     --cores-offset 16 \
#     --warmup 500 \
#     --output-dir perf_resnet50_4_8_100_100 \
#     --scenario Server \
#     --mode Performance &
# P2=$!
# sleep 300
# ps aux > pid_list
# python3 filter_pid.py pid_list python3 > tmp
# python3 filter_pid.py pid_list bert_inference >> tmp
# cat tmp | sudo kill `xargs`
# wait $P1 $P2

# sudo pqos -R 
# sudo pqos -a "llc:1=0-15;llc:2=16-31;"
# sudo pqos -e "llc:1=0x3ff;llc:2=0xc00;"
# sudo pqos -e "mba:1=100;mba:2=100;"

# mkdir perf_bert_10_2_100_100
# numactl -m 0 -N 0 -C 0-15 /data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/build/bert_inference -n 4 -j 4 --test_scenario=Server --model_file=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/bert.pt --sample_file=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/squad.pt --mlperf_config=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/inference/mlperf.conf --user_config=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/user.conf -o perf_bert_10_2_100_100 -b 2 &
# P1=$!

# python3 run.py --workload-name resnet50 \
#     --mlperf-conf resnet50/pytorch-cpu/mlperf_inference/mlperf.conf \
#     --user-conf resnet50/pytorch-cpu/scripts/ICX/user.conf.ICX40C_2S \
#     --workload-config resnet50/pytorch-cpu/scripts/ICX/resnet50-config_Server_ICX40C_2S.yml \
#     --num-instance 16 \
#     --cpus-per-instance 1 \
#     --cores-offset 16 \
#     --warmup 500 \
#     --output-dir perf_resnet50_10_2_100_100 \
#     --scenario Server \
#     --mode Performance &
# P2=$!
# sleep 300
# ps aux > pid_list
# python3 filter_pid.py pid_list python3 > tmp
# python3 filter_pid.py pid_list bert_inference >> tmp
# cat tmp | sudo kill `xargs`
# wait $P1 $P2

# sudo pqos -R 
# sudo pqos -a "llc:1=0-15;llc:2=16-31;"
# sudo pqos -e "llc:1=0x00f;llc:2=0xff0;"
# sudo pqos -e "mba:1=100;mba:2=20;"

# mkdir perf_bert_4_8_100_20
# numactl -m 0 -N 0 -C 0-15 /data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/build/bert_inference -n 4 -j 4 --test_scenario=Server --model_file=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/bert.pt --sample_file=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/squad.pt --mlperf_config=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/inference/mlperf.conf --user_config=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/user.conf -o perf_bert_4_8_100_20 -b 2 &
# P1=$!

# python3 run.py --workload-name resnet50 \
#     --mlperf-conf resnet50/pytorch-cpu/mlperf_inference/mlperf.conf \
#     --user-conf resnet50/pytorch-cpu/scripts/ICX/user.conf.ICX40C_2S \
#     --workload-config resnet50/pytorch-cpu/scripts/ICX/resnet50-config_Server_ICX40C_2S.yml \
#     --num-instance 16 \
#     --cpus-per-instance 1 \
#     --cores-offset 16 \
#     --warmup 500 \
#     --output-dir perf_resnet50_4_8_100_20 \
#     --scenario Server \
#     --mode Performance &
# P2=$!
# sleep 300
# ps aux > pid_list
# python3 filter_pid.py pid_list python3 > tmp
# python3 filter_pid.py pid_list bert_inference >> tmp
# cat tmp | sudo kill `xargs`
# wait $P1 $P2

# sudo pqos -R 
# sudo pqos -a "llc:1=0-15;llc:2=16-31;"
# sudo pqos -e "llc:1=0x00f;llc:2=0xff0;"
# sudo pqos -e "mba:1=100;mba:2=20;"

# mkdir perf_bert_4_8_100_20
# numactl -m 0 -N 0 -C 0-15 /data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/build/bert_inference -n 4 -j 4 --test_scenario=Server --model_file=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/bert.pt --sample_file=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/squad.pt --mlperf_config=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/inference/mlperf.conf --user_config=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/user.conf -o perf_bert_4_8_100_20 -b 2 &
# P1=$!

# python3 run.py --workload-name resnet50 \
#     --mlperf-conf resnet50/pytorch-cpu/mlperf_inference/mlperf.conf \
#     --user-conf resnet50/pytorch-cpu/scripts/ICX/user.conf.ICX40C_2S \
#     --workload-config resnet50/pytorch-cpu/scripts/ICX/resnet50-config_Server_ICX40C_2S.yml \
#     --num-instance 16 \
#     --cpus-per-instance 1 \
#     --cores-offset 16 \
#     --warmup 500 \
#     --output-dir perf_resnet50_4_8_100_20 \
#     --scenario Server \
#     --mode Performance &
# P2=$!
# sleep 300
# ps aux > pid_list
# python3 filter_pid.py pid_list python3 > tmp
# python3 filter_pid.py pid_list bert_inference >> tmp
# cat tmp | sudo kill `xargs`
# wait $P1 $P2

# sudo pqos -R 
# sudo pqos -a "llc:1=0-15;llc:2=16-31;"
# sudo pqos -e "llc:1=0x3ff;llc:2=0xc00;"
# sudo pqos -e "mba:1=100;mba:2=20;"

# mkdir perf_bert_10_2_100_20
# numactl -m 0 -N 0 -C 0-15 /data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/build/bert_inference -n 4 -j 4 --test_scenario=Server --model_file=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/bert.pt --sample_file=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/squad.pt --mlperf_config=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/inference/mlperf.conf --user_config=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/user.conf -o perf_bert_10_2_100_20 -b 2 &
# P1=$!

# python3 run.py --workload-name resnet50 \
#     --mlperf-conf resnet50/pytorch-cpu/mlperf_inference/mlperf.conf \
#     --user-conf resnet50/pytorch-cpu/scripts/ICX/user.conf.ICX40C_2S \
#     --workload-config resnet50/pytorch-cpu/scripts/ICX/resnet50-config_Server_ICX40C_2S.yml \
#     --num-instance 16 \
#     --cpus-per-instance 1 \
#     --cores-offset 16 \
#     --warmup 500 \
#     --output-dir perf_resnet50_10_2_100_20 \
#     --scenario Server \
#     --mode Performance &
# P2=$!
# sleep 300
# ps aux > pid_list
# python3 filter_pid.py pid_list python3 > tmp
# python3 filter_pid.py pid_list bert_inference >> tmp
# cat tmp | sudo kill `xargs`
# wait $P1 $P2

# sudo pqos -R 
# sudo pqos -a "llc:1=0-15;llc:2=16-31;"
# sudo pqos -e "llc:1=0x00f;llc:2=0xff0;"
# sudo pqos -e "mba:1=20;mba:2=100;"

# mkdir perf_bert_4_8_20_100
# numactl -m 0 -N 0 -C 0-15 /data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/build/bert_inference -n 4 -j 4 --test_scenario=Server --model_file=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/bert.pt --sample_file=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/squad.pt --mlperf_config=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/inference/mlperf.conf --user_config=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/user.conf -o perf_bert_4_8_20_100 -b 2 &
# P1=$!

# python3 run.py --workload-name resnet50 \
#     --mlperf-conf resnet50/pytorch-cpu/mlperf_inference/mlperf.conf \
#     --user-conf resnet50/pytorch-cpu/scripts/ICX/user.conf.ICX40C_2S \
#     --workload-config resnet50/pytorch-cpu/scripts/ICX/resnet50-config_Server_ICX40C_2S.yml \
#     --num-instance 16 \
#     --cpus-per-instance 1 \
#     --cores-offset 16 \
#     --warmup 500 \
#     --output-dir perf_resnet50_4_8_20_100 \
#     --scenario Server \
#     --mode Performance &
# P2=$!
# sleep 300
# ps aux > pid_list
# python3 filter_pid.py pid_list python3 > tmp
# python3 filter_pid.py pid_list bert_inference >> tmp
# cat tmp | sudo kill `xargs`
# wait $P1 $P2

# sudo pqos -R 
# sudo pqos -a "llc:1=0-15;llc:2=16-31;"
# sudo pqos -e "llc:1=0x00f;llc:2=0xff0;"
# sudo pqos -e "mba:1=20;mba:2=100;"

# mkdir perf_bert_4_8_20_100
# numactl -m 0 -N 0 -C 0-15 /data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/build/bert_inference -n 4 -j 4 --test_scenario=Server --model_file=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/bert.pt --sample_file=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/squad.pt --mlperf_config=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/inference/mlperf.conf --user_config=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/user.conf -o perf_bert_4_8_20_100 -b 2 &
# P1=$!

# python3 run.py --workload-name resnet50 \
#     --mlperf-conf resnet50/pytorch-cpu/mlperf_inference/mlperf.conf \
#     --user-conf resnet50/pytorch-cpu/scripts/ICX/user.conf.ICX40C_2S \
#     --workload-config resnet50/pytorch-cpu/scripts/ICX/resnet50-config_Server_ICX40C_2S.yml \
#     --num-instance 16 \
#     --cpus-per-instance 1 \
#     --cores-offset 16 \
#     --warmup 500 \
#     --output-dir perf_resnet50_4_8_20_100 \
#     --scenario Server \
#     --mode Performance &
# P2=$!
# sleep 300
# ps aux > pid_list
# python3 filter_pid.py pid_list python3 > tmp
# python3 filter_pid.py pid_list bert_inference >> tmp
# cat tmp | sudo kill `xargs`
# wait $P1 $P2

# sudo pqos -R 
# sudo pqos -a "llc:1=0-15;llc:2=16-31;"
# sudo pqos -e "llc:1=0x3ff;llc:2=0xc00;"
# sudo pqos -e "mba:1=20;mba:2=100;"

# mkdir perf_bert_10_2_20_100
# numactl -m 0 -N 0 -C 0-15 /data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/build/bert_inference -n 4 -j 4 --test_scenario=Server --model_file=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/bert.pt --sample_file=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/squad.pt --mlperf_config=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/inference/mlperf.conf --user_config=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/user.conf -o perf_bert_10_2_20_100 -b 2 &
# P1=$!

# python3 run.py --workload-name resnet50 \
#     --mlperf-conf resnet50/pytorch-cpu/mlperf_inference/mlperf.conf \
#     --user-conf resnet50/pytorch-cpu/scripts/ICX/user.conf.ICX40C_2S \
#     --workload-config resnet50/pytorch-cpu/scripts/ICX/resnet50-config_Server_ICX40C_2S.yml \
#     --num-instance 16 \
#     --cpus-per-instance 1 \
#     --cores-offset 16 \
#     --warmup 500 \
#     --output-dir perf_resnet50_10_2_20_100 \
#     --scenario Server \
#     --mode Performance &
# P2=$!
# sleep 300
# ps aux > pid_list
# python3 filter_pid.py pid_list python3 > tmp
# python3 filter_pid.py pid_list bert_inference >> tmp
# cat tmp | sudo kill `xargs`
# wait $P1 $P2







sudo pqos -R 
sudo pqos -a "llc:1=0-15;llc:2=16-31;"
sudo pqos -e "llc:1=0x00f;llc:2=0xff0;"
sudo pqos -e "mba:1=50;mba:2=100;"

mkdir perf_bert_4_8_50_100
numactl -m 0 -N 0 -C 0-15 /data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/build/bert_inference -n 4 -j 4 --test_scenario=Server --model_file=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/bert.pt --sample_file=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/squad.pt --mlperf_config=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/inference/mlperf.conf --user_config=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/user.conf -o perf_bert_4_8_50_100 -b 2 &
P1=$!

python3 run.py --workload-name resnet50 \
    --mlperf-conf resnet50/pytorch-cpu/mlperf_inference/mlperf.conf \
    --user-conf resnet50/pytorch-cpu/scripts/ICX/user.conf.ICX40C_2S \
    --workload-config resnet50/pytorch-cpu/scripts/ICX/resnet50-config_Server_ICX40C_2S.yml \
    --num-instance 16 \
    --cpus-per-instance 1 \
    --cores-offset 16 \
    --warmup 500 \
    --output-dir perf_resnet50_4_8_50_100 \
    --scenario Server \
    --mode Performance &
P2=$!
sleep 300
ps aux > pid_list
python3 filter_pid.py pid_list python3 > tmp
python3 filter_pid.py pid_list bert_inference >> tmp
cat tmp | sudo kill `xargs`
wait $P1 $P2

sudo pqos -R 
sudo pqos -a "llc:1=0-15;llc:2=16-31;"
sudo pqos -e "llc:1=0x00f;llc:2=0xff0;"
sudo pqos -e "mba:1=60;mba:2=100;"

mkdir perf_bert_4_8_60_100
numactl -m 0 -N 0 -C 0-15 /data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/build/bert_inference -n 4 -j 4 --test_scenario=Server --model_file=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/bert.pt --sample_file=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/squad.pt --mlperf_config=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/inference/mlperf.conf --user_config=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/user.conf -o perf_bert_4_8_60_100 -b 2 &
P1=$!

python3 run.py --workload-name resnet50 \
    --mlperf-conf resnet50/pytorch-cpu/mlperf_inference/mlperf.conf \
    --user-conf resnet50/pytorch-cpu/scripts/ICX/user.conf.ICX40C_2S \
    --workload-config resnet50/pytorch-cpu/scripts/ICX/resnet50-config_Server_ICX40C_2S.yml \
    --num-instance 16 \
    --cpus-per-instance 1 \
    --cores-offset 16 \
    --warmup 500 \
    --output-dir perf_resnet50_4_8_60_100 \
    --scenario Server \
    --mode Performance &
P2=$!
sleep 300
ps aux > pid_list
python3 filter_pid.py pid_list python3 > tmp
python3 filter_pid.py pid_list bert_inference >> tmp
cat tmp | sudo kill `xargs`
wait $P1 $P2

sudo pqos -R 
sudo pqos -a "llc:1=0-15;llc:2=16-31;"
sudo pqos -e "llc:1=0x00f;llc:2=0xff0;"
sudo pqos -e "mba:1=70;mba:2=100;"

mkdir perf_bert_4_8_70_100
numactl -m 0 -N 0 -C 0-15 /data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/build/bert_inference -n 4 -j 4 --test_scenario=Server --model_file=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/bert.pt --sample_file=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/squad.pt --mlperf_config=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/inference/mlperf.conf --user_config=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/user.conf -o perf_bert_4_8_70_100 -b 2 &
P1=$!

python3 run.py --workload-name resnet50 \
    --mlperf-conf resnet50/pytorch-cpu/mlperf_inference/mlperf.conf \
    --user-conf resnet50/pytorch-cpu/scripts/ICX/user.conf.ICX40C_2S \
    --workload-config resnet50/pytorch-cpu/scripts/ICX/resnet50-config_Server_ICX40C_2S.yml \
    --num-instance 16 \
    --cpus-per-instance 1 \
    --cores-offset 16 \
    --warmup 500 \
    --output-dir perf_resnet50_4_8_70_100 \
    --scenario Server \
    --mode Performance &
P2=$!
sleep 300
ps aux > pid_list
python3 filter_pid.py pid_list python3 > tmp
python3 filter_pid.py pid_list bert_inference >> tmp
cat tmp | sudo kill `xargs`
wait $P1 $P2

sudo pqos -R 
sudo pqos -a "llc:1=0-15;llc:2=16-31;"
sudo pqos -e "llc:1=0x00f;llc:2=0xff0;"
sudo pqos -e "mba:1=80;mba:2=100;"

mkdir perf_bert_4_8_80_100
numactl -m 0 -N 0 -C 0-15 /data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/build/bert_inference -n 4 -j 4 --test_scenario=Server --model_file=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/bert.pt --sample_file=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/squad.pt --mlperf_config=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/inference/mlperf.conf --user_config=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/user.conf -o perf_bert_4_8_80_100 -b 2 &
P1=$!

python3 run.py --workload-name resnet50 \
    --mlperf-conf resnet50/pytorch-cpu/mlperf_inference/mlperf.conf \
    --user-conf resnet50/pytorch-cpu/scripts/ICX/user.conf.ICX40C_2S \
    --workload-config resnet50/pytorch-cpu/scripts/ICX/resnet50-config_Server_ICX40C_2S.yml \
    --num-instance 16 \
    --cpus-per-instance 1 \
    --cores-offset 16 \
    --warmup 500 \
    --output-dir perf_resnet50_4_8_80_100 \
    --scenario Server \
    --mode Performance &
P2=$!
sleep 300
ps aux > pid_list
python3 filter_pid.py pid_list python3 > tmp
python3 filter_pid.py pid_list bert_inference >> tmp
cat tmp | sudo kill `xargs`
wait $P1 $P2

sudo pqos -R 
sudo pqos -a "llc:1=0-15;llc:2=16-31;"
sudo pqos -e "llc:1=0x00f;llc:2=0xff0;"
sudo pqos -e "mba:1=90;mba:2=100;"

mkdir perf_bert_4_8_90_100
numactl -m 0 -N 0 -C 0-15 /data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/build/bert_inference -n 4 -j 4 --test_scenario=Server --model_file=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/bert.pt --sample_file=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/squad.pt --mlperf_config=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/inference/mlperf.conf --user_config=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/user.conf -o perf_bert_4_8_90_100 -b 2 &
P1=$!

python3 run.py --workload-name resnet50 \
    --mlperf-conf resnet50/pytorch-cpu/mlperf_inference/mlperf.conf \
    --user-conf resnet50/pytorch-cpu/scripts/ICX/user.conf.ICX40C_2S \
    --workload-config resnet50/pytorch-cpu/scripts/ICX/resnet50-config_Server_ICX40C_2S.yml \
    --num-instance 16 \
    --cpus-per-instance 1 \
    --cores-offset 16 \
    --warmup 500 \
    --output-dir perf_resnet50_4_8_90_100 \
    --scenario Server \
    --mode Performance &
P2=$!
sleep 300
ps aux > pid_list
python3 filter_pid.py pid_list python3 > tmp
python3 filter_pid.py pid_list bert_inference >> tmp
cat tmp | sudo kill `xargs`
wait $P1 $P2

sudo pqos -R 
sudo pqos -a "llc:1=0-15;llc:2=16-31;"
sudo pqos -e "llc:1=0x00f;llc:2=0xff0;"
sudo pqos -e "mba:1=100;mba:2=100;"

mkdir perf_bert_4_8_100_100
numactl -m 0 -N 0 -C 0-15 /data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/build/bert_inference -n 4 -j 4 --test_scenario=Server --model_file=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/bert.pt --sample_file=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/squad.pt --mlperf_config=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/inference/mlperf.conf --user_config=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/user.conf -o perf_bert_4_8_100_100 -b 2 &
P1=$!

python3 run.py --workload-name resnet50 \
    --mlperf-conf resnet50/pytorch-cpu/mlperf_inference/mlperf.conf \
    --user-conf resnet50/pytorch-cpu/scripts/ICX/user.conf.ICX40C_2S \
    --workload-config resnet50/pytorch-cpu/scripts/ICX/resnet50-config_Server_ICX40C_2S.yml \
    --num-instance 16 \
    --cpus-per-instance 1 \
    --cores-offset 16 \
    --warmup 500 \
    --output-dir perf_resnet50_4_8_100_100 \
    --scenario Server \
    --mode Performance &
P2=$!
sleep 300
ps aux > pid_list
python3 filter_pid.py pid_list python3 > tmp
python3 filter_pid.py pid_list bert_inference >> tmp
cat tmp | sudo kill `xargs`
wait $P1 $P2

sudo pqos -R 
sudo pqos -a "llc:1=0-15;llc:2=16-31;"
sudo pqos -e "llc:1=0x00f;llc:2=0xff0;"
sudo pqos -e "mba:1=100;mba:2=90;"

mkdir perf_bert_4_8_100_90
numactl -m 0 -N 0 -C 0-15 /data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/build/bert_inference -n 4 -j 4 --test_scenario=Server --model_file=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/bert.pt --sample_file=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/squad.pt --mlperf_config=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/inference/mlperf.conf --user_config=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/user.conf -o perf_bert_4_8_100_90 -b 2 &
P1=$!

python3 run.py --workload-name resnet50 \
    --mlperf-conf resnet50/pytorch-cpu/mlperf_inference/mlperf.conf \
    --user-conf resnet50/pytorch-cpu/scripts/ICX/user.conf.ICX40C_2S \
    --workload-config resnet50/pytorch-cpu/scripts/ICX/resnet50-config_Server_ICX40C_2S.yml \
    --num-instance 16 \
    --cpus-per-instance 1 \
    --cores-offset 16 \
    --warmup 500 \
    --output-dir perf_resnet50_4_8_100_90 \
    --scenario Server \
    --mode Performance &
P2=$!
sleep 300
ps aux > pid_list
python3 filter_pid.py pid_list python3 > tmp
python3 filter_pid.py pid_list bert_inference >> tmp
cat tmp | sudo kill `xargs`
wait $P1 $P2

sudo pqos -R 
sudo pqos -a "llc:1=0-15;llc:2=16-31;"
sudo pqos -e "llc:1=0x00f;llc:2=0xff0;"
sudo pqos -e "mba:1=100;mba:2=80;"

mkdir perf_bert_4_8_100_80
numactl -m 0 -N 0 -C 0-15 /data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/build/bert_inference -n 4 -j 4 --test_scenario=Server --model_file=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/bert.pt --sample_file=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/squad.pt --mlperf_config=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/inference/mlperf.conf --user_config=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/user.conf -o perf_bert_4_8_100_80 -b 2 &
P1=$!

python3 run.py --workload-name resnet50 \
    --mlperf-conf resnet50/pytorch-cpu/mlperf_inference/mlperf.conf \
    --user-conf resnet50/pytorch-cpu/scripts/ICX/user.conf.ICX40C_2S \
    --workload-config resnet50/pytorch-cpu/scripts/ICX/resnet50-config_Server_ICX40C_2S.yml \
    --num-instance 16 \
    --cpus-per-instance 1 \
    --cores-offset 16 \
    --warmup 500 \
    --output-dir perf_resnet50_4_8_100_80 \
    --scenario Server \
    --mode Performance &
P2=$!
sleep 300
ps aux > pid_list
python3 filter_pid.py pid_list python3 > tmp
python3 filter_pid.py pid_list bert_inference >> tmp
cat tmp | sudo kill `xargs`
wait $P1 $P2

sudo pqos -R 
sudo pqos -a "llc:1=0-15;llc:2=16-31;"
sudo pqos -e "llc:1=0x00f;llc:2=0xff0;"
sudo pqos -e "mba:1=100;mba:2=70;"

mkdir perf_bert_4_8_100_70
numactl -m 0 -N 0 -C 0-15 /data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/build/bert_inference -n 4 -j 4 --test_scenario=Server --model_file=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/bert.pt --sample_file=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/squad.pt --mlperf_config=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/inference/mlperf.conf --user_config=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/user.conf -o perf_bert_4_8_100_70 -b 2 &
P1=$!

python3 run.py --workload-name resnet50 \
    --mlperf-conf resnet50/pytorch-cpu/mlperf_inference/mlperf.conf \
    --user-conf resnet50/pytorch-cpu/scripts/ICX/user.conf.ICX40C_2S \
    --workload-config resnet50/pytorch-cpu/scripts/ICX/resnet50-config_Server_ICX40C_2S.yml \
    --num-instance 16 \
    --cpus-per-instance 1 \
    --cores-offset 16 \
    --warmup 500 \
    --output-dir perf_resnet50_4_8_100_70 \
    --scenario Server \
    --mode Performance &
P2=$!
sleep 300
ps aux > pid_list
python3 filter_pid.py pid_list python3 > tmp
python3 filter_pid.py pid_list bert_inference >> tmp
cat tmp | sudo kill `xargs`
wait $P1 $P2

sudo pqos -R 
sudo pqos -a "llc:1=0-15;llc:2=16-31;"
sudo pqos -e "llc:1=0x00f;llc:2=0xff0;"
sudo pqos -e "mba:1=100;mba:2=60;"

mkdir perf_bert_4_8_100_60
numactl -m 0 -N 0 -C 0-15 /data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/build/bert_inference -n 4 -j 4 --test_scenario=Server --model_file=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/bert.pt --sample_file=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/squad.pt --mlperf_config=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/inference/mlperf.conf --user_config=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/user.conf -o perf_bert_4_8_100_60 -b 2 &
P1=$!

python3 run.py --workload-name resnet50 \
    --mlperf-conf resnet50/pytorch-cpu/mlperf_inference/mlperf.conf \
    --user-conf resnet50/pytorch-cpu/scripts/ICX/user.conf.ICX40C_2S \
    --workload-config resnet50/pytorch-cpu/scripts/ICX/resnet50-config_Server_ICX40C_2S.yml \
    --num-instance 16 \
    --cpus-per-instance 1 \
    --cores-offset 16 \
    --warmup 500 \
    --output-dir perf_resnet50_4_8_100_60 \
    --scenario Server \
    --mode Performance &
P2=$!
sleep 300
ps aux > pid_list
python3 filter_pid.py pid_list python3 > tmp
python3 filter_pid.py pid_list bert_inference >> tmp
cat tmp | sudo kill `xargs`
wait $P1 $P2

sudo pqos -R 
sudo pqos -a "llc:1=0-15;llc:2=16-31;"
sudo pqos -e "llc:1=0x00f;llc:2=0xff0;"
sudo pqos -e "mba:1=100;mba:2=50;"

mkdir perf_bert_4_8_100_50
numactl -m 0 -N 0 -C 0-15 /data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/build/bert_inference -n 4 -j 4 --test_scenario=Server --model_file=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/bert.pt --sample_file=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/squad.pt --mlperf_config=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/inference/mlperf.conf --user_config=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/user.conf -o perf_bert_4_8_100_50 -b 2 &
P1=$!

python3 run.py --workload-name resnet50 \
    --mlperf-conf resnet50/pytorch-cpu/mlperf_inference/mlperf.conf \
    --user-conf resnet50/pytorch-cpu/scripts/ICX/user.conf.ICX40C_2S \
    --workload-config resnet50/pytorch-cpu/scripts/ICX/resnet50-config_Server_ICX40C_2S.yml \
    --num-instance 16 \
    --cpus-per-instance 1 \
    --cores-offset 16 \
    --warmup 500 \
    --output-dir perf_resnet50_4_8_100_50 \
    --scenario Server \
    --mode Performance &
P2=$!
sleep 300
ps aux > pid_list
python3 filter_pid.py pid_list python3 > tmp
python3 filter_pid.py pid_list bert_inference >> tmp
cat tmp | sudo kill `xargs`
wait $P1 $P2