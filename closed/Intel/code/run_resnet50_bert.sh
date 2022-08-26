#!/bin/bash

# bash resnet50/pytorch-cpu/scripts/ICX/mlperf_run_server.sh
# cd bert-99/pytorch-cpu
# bash run_server.sh

# export LD_LIBRARY_PATH="${CONDA_PREFIX}/lib/python3.7/site-packages/torch_ipex-1.8.0-py3.7-linux-x86_64.egg/lib:${CONDA_PREFIX}/lib:$LD_LIBRARY_PATH"
# export LD_PRELOAD=$CONDA_PREFIX/lib/libiomp5.so
# export LD_PRELOAD=${CONDA_PREFIX}/lib/libjemalloc.so
# export MALLOC_CONF="oversize_threshold:1,background_thread:true,percpu_arena:percpu,metadata_thp:always,dirty_decay_ms:9000000000,muzzy_decay_ms:9000000000";
# export LD_PRELOAD=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/resnet50/pytorch-cpu/lib/libjemalloc.so:$LD_PRELOAD
# export MALLOC_CONF="oversize_threshold:1,background_thread:true,metadata_thp:auto,dirty_decay_ms:9000000000,muzzy_decay_ms:9000000000"
# export DNNL_MAX_CPU_ISA=AVX512_CORE_AMX
# export DNNL_PRIMITIVE_CACHE_CAPACITY=1024

# sed -i -e "s/1472/700/g" resnet50/pytorch-cpu/scripts/ICX/user.conf.ICX40C_2S
# sed -i -e "s/260/120/g" bert-99/pytorch-cpu/user.conf
# bash parallel_model.sh
# mkdir resnet_8llc_bert_4llc_0
# mv perf_bert_* resnet_8llc_bert_4llc_0
# mv perf_resnet50_* resnet_8llc_bert_4llc_0
# bash parallel_model.sh
# mkdir resnet_8llc_bert_4llc_1
# mv perf_bert_* resnet_8llc_bert_4llc_1
# mv perf_resnet50_* resnet_8llc_bert_4llc_1
# bash parallel_model.sh
# mkdir resnet_8llc_bert_4llc_2
# mv perf_bert_* resnet_8llc_bert_4llc_2
# mv perf_resnet50_* resnet_8llc_bert_4llc_2
# bash parallel_model.sh
# mkdir resnet_8llc_bert_4llc_3
# mv perf_bert_* resnet_8llc_bert_4llc_3
# mv perf_resnet50_* resnet_8llc_bert_4llc_3

# sed -i -e "s/8_4/6_6/g" parallel_model.sh
# sed -i -e "s/llc:1=0x0ff;llc:2=0xf00;/llc:1=0x03f;llc:2=0xfc0;/g" parallel_model.sh
# bash parallel_model.sh
# mkdir resnet_6llc_bert_6llc_0
# mv perf_bert_* resnet_6llc_bert_6llc_0
# mv perf_resnet50_* resnet_6llc_bert_6llc_0
# bash parallel_model.sh
# mkdir resnet_6llc_bert_6llc_1
# mv perf_bert_* resnet_6llc_bert_6llc_1
# mv perf_resnet50_* resnet_6llc_bert_6llc_1
# bash parallel_model.sh
# mkdir resnet_6llc_bert_6llc_2
# mv perf_bert_* resnet_6llc_bert_6llc_2
# mv perf_resnet50_* resnet_6llc_bert_6llc_2
# bash parallel_model.sh
# mkdir resnet_6llc_bert_6llc_3
# mv perf_bert_* resnet_6llc_bert_6llc_3
# mv perf_resnet50_* resnet_6llc_bert_6llc_3

# sed -i -e "s/6_6/4_8/g" parallel_model.sh
# sed -i -e "s/llc:1=0x03f;llc:2=0xfc0;/llc:1=0x00f;llc:2=0xff0;/g" parallel_model.sh
# bash parallel_model.sh
# mkdir resnet_4llc_bert_8llc_0
# mv perf_bert_* resnet_4llc_bert_8llc_0
# mv perf_resnet50_* resnet_4llc_bert_8llc_0
# bash parallel_model.sh
# mkdir resnet_4llc_bert_8llc_1
# mv perf_bert_* resnet_4llc_bert_8llc_1
# mv perf_resnet50_* resnet_4llc_bert_8llc_1
# bash parallel_model.sh
# mkdir resnet_4llc_bert_8llc_2
# mv perf_bert_* resnet_4llc_bert_8llc_2
# mv perf_resnet50_* resnet_4llc_bert_8llc_2
# bash parallel_model.sh
# mkdir resnet_4llc_bert_8llc_3
# mv perf_bert_* resnet_4llc_bert_8llc_3
# mv perf_resnet50_* resnet_4llc_bert_8llc_3

# resnet50 650 700 750
# bert 110 120 130

# high 750 mid 120
# mid 700 mid 120

# mid 700 high 130
# sed -i -e "s/120/130/g" bert-99/pytorch-cpu/user.conf
# bash parallel_model.sh
# mkdir resnet_700qps_bert_130qps
# mv perf_bert_* resnet_700qps_bert_130qps
# mv perf_resnet50_* resnet_700qps_bert_130qps

# mid 700 low 110
# sed -i -e "s/130/110/g" bert-99/pytorch-cpu/user.conf
# bash parallel_model.sh
# mkdir resnet_700qps_bert_110qps
# mv perf_bert_* resnet_700qps_bert_110qps
# mv perf_resnet50_* resnet_700qps_bert_110qps

# high 750 low 110
# sed -i -e "s/700/750/g" resnet50/pytorch-cpu/scripts/ICX/user.conf.ICX40C_2S
# bash parallel_model.sh
# mkdir resnet_750qps_bert_110qps
# mv perf_bert_* resnet_750qps_bert_110qps
# mv perf_resnet50_* resnet_750qps_bert_110qps

# high 750 high 130
# sed -i -e "s/110/130/g" bert-99/pytorch-cpu/user.conf
# bash parallel_model.sh
# mkdir resnet_750qps_bert_130qps
# mv perf_bert_* resnet_750qps_bert_130qps
# mv perf_resnet50_* resnet_750qps_bert_130qps

# low 650 high 130
# sed -i -e "s/750/650/g" resnet50/pytorch-cpu/scripts/ICX/user.conf.ICX40C_2S
# bash parallel_model.sh
# mkdir resnet_650qps_bert_130qps
# mv perf_bert_* resnet_650qps_bert_130qps
# mv perf_resnet50_* resnet_650qps_bert_130qps

# low 650 mid 120
# sed -i -e "s/130/120/g" bert-99/pytorch-cpu/user.conf
# bash parallel_model.sh
# mkdir resnet_650qps_bert_120qps
# mv perf_bert_* resnet_650qps_bert_120qps
# mv perf_resnet50_* resnet_650qps_bert_120qps

# low 650 low 110
# sed -i -e "s/120/110/g" bert-99/pytorch-cpu/user.conf
# bash parallel_model.sh
# mkdir resnet_650qps_bert_110qps
# mv perf_bert_* resnet_650qps_bert_110qps
# mv perf_resnet50_* resnet_650qps_bert_110qps

# sed -i -e "s/650/1472/g" resnet50/pytorch-cpu/scripts/ICX/user.conf.ICX40C_2S
# sed -i -e "s/110/260/g" bert-99/pytorch-cpu/user.conf
# bash resnet50/pytorch-cpu/scripts/ICX/mlperf_run_server.sh
# cd bert-99/pytorch-cpu
# bash run_server.sh

# 100 50
sed -i -e "s/50/100/g" resnet50/pytorch-cpu/scripts/ICX/user.conf.ICX40C_2S
sed -i -e "s/10/50/g" bert-99/pytorch-cpu/user.conf
bash parallel_model.sh
mkdir resnet_100qps_bert_50qps
mv perf_bert_* resnet_100qps_bert_50qps
mv perf_resnet50_* resnet_100qps_bert_50qps

# 90 40
sed -i -e "s/100/90/g" resnet50/pytorch-cpu/scripts/ICX/user.conf.ICX40C_2S
sed -i -e "s/50/40/g" bert-99/pytorch-cpu/user.conf
bash parallel_model.sh
mkdir resnet_90qps_bert_40qps
mv perf_bert_* resnet_90qps_bert_40qps
mv perf_resnet50_* resnet_90qps_bert_40qps

# 80 30
sed -i -e "s/90/80/g" resnet50/pytorch-cpu/scripts/ICX/user.conf.ICX40C_2S
sed -i -e "s/40/30/g" bert-99/pytorch-cpu/user.conf
bash parallel_model.sh
mkdir resnet_80qps_bert_30qps
mv perf_bert_* resnet_80qps_bert_30qps
mv perf_resnet50_* resnet_80qps_bert_30qps

# 70 20
sed -i -e "s/80/70/g" resnet50/pytorch-cpu/scripts/ICX/user.conf.ICX40C_2S
sed -i -e "s/30/20/g" bert-99/pytorch-cpu/user.conf
bash parallel_model.sh
mkdir resnet_70qps_bert_20qps
mv perf_bert_* resnet_70qps_bert_20qps
mv perf_resnet50_* resnet_70qps_bert_20qps

# 60 10
sed -i -e "s/70/60/g" resnet50/pytorch-cpu/scripts/ICX/user.conf.ICX40C_2S
sed -i -e "s/20/10/g" bert-99/pytorch-cpu/user.conf
bash parallel_model.sh
mkdir resnet_60qps_bert_10qps
mv perf_bert_* resnet_60qps_bert_10qps
mv perf_resnet50_* resnet_60qps_bert_10qps

# # 200 120
# sed -i -e "s/700/200/g" resnet50/pytorch-cpu/scripts/ICX/user.conf.ICX40C_2S
# sed -i -e "s/10/120/g" bert-99/pytorch-cpu/user.conf
# bash parallel_model.sh
# mkdir resnet_200qps_bert_120qps
# mv perf_bert_* resnet_200qps_bert_120qps
# mv perf_resnet50_* resnet_200qps_bert_120qps

# # 100 120
# sed -i -e "s/200/100/g" resnet50/pytorch-cpu/scripts/ICX/user.conf.ICX40C_2S
# bash parallel_model.sh
# mkdir resnet_100qps_bert_120qps
# mv perf_bert_* resnet_100qps_bert_120qps
# mv perf_resnet50_* resnet_100qps_bert_120qps

# # 100 50
# sed -i -e "s/120/50/g" bert-99/pytorch-cpu/user.conf
# bash parallel_model.sh
# mkdir resnet_100qps_bert_50qps
# mv perf_bert_* resnet_100qps_bert_50qps
# mv perf_resnet50_* resnet_100qps_bert_50qps

# sudo pqos -R 

# mkdir perf_bert_none_0
# numactl -m 0 -N 0 -C 0-31 /data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/build/bert_inference -n 8 -j 4 --test_scenario=Server --model_file=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/bert.pt --sample_file=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/squad.pt --mlperf_config=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/inference/mlperf.conf --user_config=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/user.conf -o perf_bert_none_0 -b 2 &
# P1=$!

# numactl -m 0 -N 0 -C 0-31 python3 run.py --workload-name resnet50 \
#     --mlperf-conf resnet50/pytorch-cpu/mlperf_inference/mlperf.conf \
#     --user-conf resnet50/pytorch-cpu/scripts/ICX/user.conf.ICX40C_2S \
#     --workload-config resnet50/pytorch-cpu/scripts/ICX/resnet50-config_Server_ICX40C_2S.yml \
#     --num-instance 32 \
#     --cpus-per-instance 1 \
#     --cores-offset 0 \
#     --warmup 500 \
#     --output-dir perf_resnet50_none_0 \
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

# mkdir perf_bert_none_1
# numactl -m 0 -N 0 -C 0-31 /data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/build/bert_inference -n 8 -j 4 --test_scenario=Server --model_file=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/bert.pt --sample_file=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/squad.pt --mlperf_config=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/inference/mlperf.conf --user_config=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/user.conf -o perf_bert_none_1 -b 2 &
# P1=$!

# numactl -m 0 -N 0 -C 0-31 python3 run.py --workload-name resnet50 \
#     --mlperf-conf resnet50/pytorch-cpu/mlperf_inference/mlperf.conf \
#     --user-conf resnet50/pytorch-cpu/scripts/ICX/user.conf.ICX40C_2S \
#     --workload-config resnet50/pytorch-cpu/scripts/ICX/resnet50-config_Server_ICX40C_2S.yml \
#     --num-instance 32 \
#     --cpus-per-instance 1 \
#     --cores-offset 0 \
#     --warmup 500 \
#     --output-dir perf_resnet50_none_1 \
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

# mkdir perf_bert_none_2
# numactl -m 0 -N 0 -C 0-31 /data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/build/bert_inference -n 8 -j 4 --test_scenario=Server --model_file=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/bert.pt --sample_file=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/squad.pt --mlperf_config=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/inference/mlperf.conf --user_config=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/user.conf -o perf_bert_none_2 -b 2 &
# P1=$!

# numactl -m 0 -N 0 -C 0-31 python3 run.py --workload-name resnet50 \
#     --mlperf-conf resnet50/pytorch-cpu/mlperf_inference/mlperf.conf \
#     --user-conf resnet50/pytorch-cpu/scripts/ICX/user.conf.ICX40C_2S \
#     --workload-config resnet50/pytorch-cpu/scripts/ICX/resnet50-config_Server_ICX40C_2S.yml \
#     --num-instance 32 \
#     --cpus-per-instance 1 \
#     --cores-offset 0 \
#     --warmup 500 \
#     --output-dir perf_resnet50_none_2 \
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

# mkdir perf_bert_none_3
# numactl -m 0 -N 0 -C 0-31 /data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/build/bert_inference -n 8 -j 4 --test_scenario=Server --model_file=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/bert.pt --sample_file=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/squad.pt --mlperf_config=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/inference/mlperf.conf --user_config=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/user.conf -o perf_bert_none_3 -b 2 &
# P1=$!

# numactl -m 0 -N 0 -C 0-31 python3 run.py --workload-name resnet50 \
#     --mlperf-conf resnet50/pytorch-cpu/mlperf_inference/mlperf.conf \
#     --user-conf resnet50/pytorch-cpu/scripts/ICX/user.conf.ICX40C_2S \
#     --workload-config resnet50/pytorch-cpu/scripts/ICX/resnet50-config_Server_ICX40C_2S.yml \
#     --num-instance 32 \
#     --cpus-per-instance 1 \
#     --cores-offset 0 \
#     --warmup 500 \
#     --output-dir perf_resnet50_none_3 \
#     --scenario Server \
#     --mode Performance &
# P2=$!
# sleep 300
# ps aux > pid_list
# python3 filter_pid.py pid_list python3 > tmp
# python3 filter_pid.py pid_list bert_inference >> tmp
# cat tmp | sudo kill `xargs`
# wait $P1 $P2

