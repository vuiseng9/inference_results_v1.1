#!/bin/bash
export LD_LIBRARY_PATH="${CONDA_PREFIX}/lib/python3.7/site-packages/torch_ipex-1.8.0-py3.7-linux-x86_64.egg/lib:${CONDA_PREFIX}/lib:$LD_LIBRARY_PATH"
export LD_PRELOAD=$CONDA_PREFIX/lib/libiomp5.so
export LD_PRELOAD=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/resnet50/pytorch-cpu/lib/libjemalloc.so:$LD_PRELOAD
export MALLOC_CONF="oversize_threshold:1,background_thread:true,metadata_thp:auto,dirty_decay_ms:9000000000,muzzy_decay_ms:9000000000"
export DNNL_MAX_CPU_ISA=AVX512_CORE_AMX
export DNNL_PRIMITIVE_CACHE_CAPACITY=1024
# sudo bash run_clean.sh

sudo pqos -R

# # sudo pqos -R 
# sudo pqos -a "llc:1=0-35;"
# sudo pqos -e "llc:1=0xfff;"
# sudo pqos -e "mba:1=25;"

# python3 run.py --workload-name resnet50 \
#     --mlperf-conf resnet50/pytorch-cpu/mlperf_inference/mlperf.conf \
#     --user-conf resnet50/pytorch-cpu/scripts/ICX/user.conf.ICX40C_2S \
#     --workload-config resnet50/pytorch-cpu/scripts/ICX/resnet50-config_Server_ICX40C_2S.yml \
#     --num-instance 16 \
#     --cpus-per-instance 1 \
#     --cores-offset 0 \
#     --warmup 500 \
#     --output-dir perf_output_logs_16_1 \
#     --scenario Server \
#     --mode Performance

# for instance in 36 30 24 18 12 6
# do
#     /data2/yufenggu/anaconda3/envs/MLPerf_Intel_resnet50/bin/python3 run.py --workload-name resnet50 \
#         --mlperf-conf resnet50/pytorch-cpu/mlperf_inference/mlperf.conf \
#         --user-conf resnet50/pytorch-cpu/scripts/ICX/user.conf.ICX40C_2S \ 
#         --workload-config resnet50/pytorch-cpu/scripts/ICX/resnet50-config_Server_ICX40C_2S.yml \
#         --num-instance ${instance} \
#         --cpus-per-instance 1 \
#         --cores-offset 0 \
#         --warmup 500 \
#         --output-dir peak_output_logs_${instance}_1 \
#         --scenario Server \
#         --mode FindPeakPerformance
# done

for cache in "llc:1=0x0ff;" "llc:1=0xfff;" "llc:1=0x00f;"
    do
    for core in "0-35"
        do
        for MB in "mba:1=75;" "mba:1=50;" "mba:1=25;" "mba:1=100;"
            do
            echo $casche
            echo llc:1=$core;
            echo $MB
            sudo pqos -R 
            sudo pqos -a llc:1=$core;
            sudo pqos -e $cache
            sudo pqos -e $MB

            /data2/yufenggu/anaconda3/envs/MLPerf_Intel_resnet50/bin/python3 run.py --workload-name resnet50 \
                --mlperf-conf resnet50/pytorch-cpu/mlperf_inference/mlperf.conf \
                --user-conf resnet50/pytorch-cpu/scripts/ICX/user.conf.ICX40C_2S \
                --workload-config resnet50/pytorch-cpu/scripts/ICX/resnet50-config_Server_ICX40C_2S.yml \
                --num-instance 36 \
                --cpus-per-instance 1 \
                --cores-offset 0 \
                --warmup 500 \
                --output-dir perf_output_logs_36_1_${cache}_${MB} \
                --scenario Server \
                --mode Performance
            done
        done
    done

# for cache in "llc:1=0x00f;" "llc:1=0x0ff;"
#     do
#     for core in "0-35"
#         do
#         for MB in "mba:1=100;"
#             do
#             echo $cache
#             echo llc:1=$core;
#             echo $MB
#             sudo pqos -R 
#             sudo pqos -a llc:1=$core;
#             sudo pqos -e $cache
#             sudo pqos -e $MB

#             /data2/yufenggu/anaconda3/envs/MLPerf_Intel_resnet50/bin/python3 run.py --workload-name resnet50 \
#                 --mlperf-conf resnet50/pytorch-cpu/mlperf_inference/mlperf.conf \
#                 --user-conf resnet50/pytorch-cpu/scripts/ICX/user.conf.ICX40C_2S \
#                 --workload-config resnet50/pytorch-cpu/scripts/ICX/resnet50-config_Server_ICX40C_2S.yml \
#                 --num-instance 36 \
#                 --cpus-per-instance 1 \
#                 --cores-offset 0 \
#                 --warmup 500 \
#                 --output-dir peak_output_logs_36_1_${cache}_${MB} \
#                 --scenario Server \
#                 --mode FindPeakPerformance
#             done
#         done
#     done

# /data2/yufenggu/anaconda3/envs/MLPerf_Intel_resnet50/bin/python3 run.py --workload-name resnet50 \
#     --mlperf-conf resnet50/pytorch-cpu/mlperf_inference/mlperf.conf \
#     --user-conf resnet50/pytorch-cpu/scripts/ICX/user.conf.ICX40C_2S \
#     --workload-config resnet50/pytorch-cpu/scripts/ICX/resnet50-config_Server_ICX40C_2S.yml \
#     --num-instance 36 \
#     --cpus-per-instance 1 \
#     --cores-offset 0 \
#     --warmup 500 \
#     --output-dir peak_output_logs_36_1_a \
#     --scenario Server \
#     --mode FindPeakPerformance &
# P1=$!
# /data2/yufenggu/anaconda3/envs/MLPerf_Intel_resnet50/bin/python3 run.py --workload-name resnet50 \
#     --mlperf-conf resnet50/pytorch-cpu/mlperf_inference/mlperf.conf \
#     --user-conf resnet50/pytorch-cpu/scripts/ICX/user.conf.ICX40C_2S \
#     --workload-config resnet50/pytorch-cpu/scripts/ICX/resnet50-config_Server_ICX40C_2S.yml \
#     --num-instance 36 \
#     --cpus-per-instance 1 \
#     --cores-offset 0 \
#     --warmup 500 \
#     --output-dir peak_output_logs_36_1_b \
#     --scenario Server \
#     --mode FindPeakPerformance &
# P2=$!
# wait $P1 $P2

# /data2/yufenggu/anaconda3/envs/MLPerf_Intel_resnet50/bin/python3 run.py --workload-name resnet50 \
#     --mlperf-conf resnet50/pytorch-cpu/mlperf_inference/mlperf.conf \
#     --user-conf resnet50/pytorch-cpu/scripts/ICX/user.conf.ICX40C_2S \
#     --workload-config resnet50/pytorch-cpu/scripts/ICX/resnet50-config_Server_ICX40C_2S.yml \
#     --num-instance 18 \
#     --cpus-per-instance 1 \
#     --cores-offset 0 \
#     --warmup 500 \
#     --output-dir peak_output_logs_18_1_a \
#     --scenario Server \
#     --mode FindPeakPerformance &
# P1=$!
# /data2/yufenggu/anaconda3/envs/MLPerf_Intel_resnet50/bin/python3 run.py --workload-name resnet50 \
#     --mlperf-conf resnet50/pytorch-cpu/mlperf_inference/mlperf.conf \
#     --user-conf resnet50/pytorch-cpu/scripts/ICX/user.conf.ICX40C_2S \
#     --workload-config resnet50/pytorch-cpu/scripts/ICX/resnet50-config_Server_ICX40C_2S.yml \
#     --num-instance 18 \
#     --cpus-per-instance 1 \
#     --cores-offset 18 \
#     --warmup 500 \
#     --output-dir peak_output_logs_18_1_b \
#     --scenario Server \
#     --mode FindPeakPerformance &
# P2=$!
# wait $P1 $P2

# sudo pqos -R 
# sudo pqos -a "llc:1=0-17;llc:2=18-35;"
# sudo pqos -e "llc:1=0x03f;llc:2=0xfc0;"
# sudo pqos -e "mba:1=50;mba:2=50;"

# /data2/yufenggu/anaconda3/envs/MLPerf_Intel_resnet50/bin/python3 run.py --workload-name resnet50 \
#     --mlperf-conf resnet50/pytorch-cpu/mlperf_inference/mlperf.conf \
#     --user-conf resnet50/pytorch-cpu/scripts/ICX/user.conf.ICX40C_2S \
#     --workload-config resnet50/pytorch-cpu/scripts/ICX/resnet50-config_Server_ICX40C_2S.yml \
#     --num-instance 18 \
#     --cpus-per-instance 1 \
#     --cores-offset 0 \
#     --warmup 500 \
#     --output-dir peak_output_logs_18_1_c \
#     --scenario Server \
#     --mode FindPeakPerformance &
# P1=$!
# /data2/yufenggu/anaconda3/envs/MLPerf_Intel_resnet50/bin/python3 run.py --workload-name resnet50 \
#     --mlperf-conf resnet50/pytorch-cpu/mlperf_inference/mlperf.conf \
#     --user-conf resnet50/pytorch-cpu/scripts/ICX/user.conf.ICX40C_2S \
#     --workload-config resnet50/pytorch-cpu/scripts/ICX/resnet50-config_Server_ICX40C_2S.yml \
#     --num-instance 18 \
#     --cpus-per-instance 1 \
#     --cores-offset 18 \
#     --warmup 500 \
#     --output-dir peak_output_logs_18_1_d \
#     --scenario Server \
#     --mode FindPeakPerformance &
# P2=$!
# wait $P1 $P2

# sudo pqos -R 
# sudo pqos -a "llc:1=0-35;llc:2=0-35;"
# sudo pqos -e "llc:1=0x03f;llc:2=0xfc0;"
# sudo pqos -e "mba:1=100;mba:2=100;"

# /data2/yufenggu/anaconda3/envs/MLPerf_Intel_resnet50/bin/python3 run.py --workload-name resnet50 \
#     --mlperf-conf resnet50/pytorch-cpu/mlperf_inference/mlperf.conf \
#     --user-conf resnet50/pytorch-cpu/scripts/ICX/user.conf.ICX40C_2S \
#     --workload-config resnet50/pytorch-cpu/scripts/ICX/resnet50-config_Server_ICX40C_2S.yml \
#     --num-instance 36 \
#     --cpus-per-instance 1 \
#     --cores-offset 0 \
#     --warmup 500 \
#     --output-dir peak_output_logs_36_1_c \
#     --scenario Server \
#     --mode FindPeakPerformance &
# P1=$!
# /data2/yufenggu/anaconda3/envs/MLPerf_Intel_resnet50/bin/python3 run.py --workload-name resnet50 \
#     --mlperf-conf resnet50/pytorch-cpu/mlperf_inference/mlperf.conf \
#     --user-conf resnet50/pytorch-cpu/scripts/ICX/user.conf.ICX40C_2S \
#     --workload-config resnet50/pytorch-cpu/scripts/ICX/resnet50-config_Server_ICX40C_2S.yml \
#     --num-instance 36 \
#     --cpus-per-instance 1 \
#     --cores-offset 0 \
#     --warmup 500 \
#     --output-dir peak_output_logs_36_1_d \
#     --scenario Server \
#     --mode FindPeakPerformance &
# P2=$!
# wait $P1 $P2

# sudo pqos -R 
# sudo pqos -a "llc:1=0-35;llc:2=0-35;"
# sudo pqos -e "llc:1=0xfff;llc:2=0xfff;"
# sudo pqos -e "mba:1=50;mba:2=50;"

# /data2/yufenggu/anaconda3/envs/MLPerf_Intel_resnet50/bin/python3 run.py --workload-name resnet50 \
#     --mlperf-conf resnet50/pytorch-cpu/mlperf_inference/mlperf.conf \
#     --user-conf resnet50/pytorch-cpu/scripts/ICX/user.conf.ICX40C_2S \
#     --workload-config resnet50/pytorch-cpu/scripts/ICX/resnet50-config_Server_ICX40C_2S.yml \
#     --num-instance 36 \
#     --cpus-per-instance 1 \
#     --cores-offset 0 \
#     --warmup 500 \
#     --output-dir peak_output_logs_36_1_e \
#     --scenario Server \
#     --mode FindPeakPerformance &
# P1=$!
# /data2/yufenggu/anaconda3/envs/MLPerf_Intel_resnet50/bin/python3 run.py --workload-name resnet50 \
#     --mlperf-conf resnet50/pytorch-cpu/mlperf_inference/mlperf.conf \
#     --user-conf resnet50/pytorch-cpu/scripts/ICX/user.conf.ICX40C_2S \
#     --workload-config resnet50/pytorch-cpu/scripts/ICX/resnet50-config_Server_ICX40C_2S.yml \
#     --num-instance 36 \
#     --cpus-per-instance 1 \
#     --cores-offset 0 \
#     --warmup 500 \
#     --output-dir peak_output_logs_36_1_f \
#     --scenario Server \
#     --mode FindPeakPerformance &
# P2=$!
# wait $P1 $P2

# for cache in "llc:1=0x0ff;" "llc:1=0x00f;"
#     do
#     for core in "0-35"
#         do
#         for MB in "mba:1=75;" "mba:1=50;" "mba:1=25;"
#             do
#             echo $cache
#             echo llc:1=$core;
#             echo $MB
#             sudo pqos -R 
#             sudo pqos -a llc:1=$core;
#             sudo pqos -e $cache
#             sudo pqos -e $MB

#             /data2/yufenggu/anaconda3/envs/MLPerf_Intel_resnet50/bin/python3 run.py --workload-name resnet50 \
#                 --mlperf-conf resnet50/pytorch-cpu/mlperf_inference/mlperf.conf \
#                 --user-conf resnet50/pytorch-cpu/scripts/ICX/user.conf.ICX40C_2S \
#                 --workload-config resnet50/pytorch-cpu/scripts/ICX/resnet50-config_Server_ICX40C_2S.yml \
#                 --num-instance 36 \
#                 --cpus-per-instance 1 \
#                 --cores-offset 0 \
#                 --warmup 500 \
#                 --output-dir peak_output_logs_36_1_${cache}_${MB} \
#                 --scenario Server \
#                 --mode FindPeakPerformance
#             done
#         done
#     done

# sudo pqos -R 
# sudo pqos -a "llc:1=0-35;llc:2=0-35;"
# sudo pqos -e "llc:1=0x03f;llc:2=0xfc0;"
# sudo pqos -e "mba:1=50;mba:2=50;"

# /data2/yufenggu/anaconda3/envs/MLPerf_Intel_resnet50/bin/python3 run.py --workload-name resnet50 \
#     --mlperf-conf resnet50/pytorch-cpu/mlperf_inference/mlperf.conf \
#     --user-conf resnet50/pytorch-cpu/scripts/ICX/user.conf.ICX40C_2S \
#     --workload-config resnet50/pytorch-cpu/scripts/ICX/resnet50-config_Server_ICX40C_2S.yml \
#     --num-instance 36 \
#     --cpus-per-instance 1 \
#     --cores-offset 0 \
#     --warmup 500 \
#     --output-dir peak_output_logs_36_1_g \
#     --scenario Server \
#     --mode FindPeakPerformance &
# P1=$!
# /data2/yufenggu/anaconda3/envs/MLPerf_Intel_resnet50/bin/python3 run.py --workload-name resnet50 \
#     --mlperf-conf resnet50/pytorch-cpu/mlperf_inference/mlperf.conf \
#     --user-conf resnet50/pytorch-cpu/scripts/ICX/user.conf.ICX40C_2S \
#     --workload-config resnet50/pytorch-cpu/scripts/ICX/resnet50-config_Server_ICX40C_2S.yml \
#     --num-instance 36 \
#     --cpus-per-instance 1 \
#     --cores-offset 0 \
#     --warmup 500 \
#     --output-dir peak_output_logs_36_1_h \
#     --scenario Server \
#     --mode FindPeakPerformance &
# P2=$!
# wait $P1 $P2

# sudo pqos -R 
# sudo pqos -a "llc:1=0-17;llc:2=18-35;"
# sudo pqos -e "llc:1=0x03f;llc:2=0xfc0;"
# sudo pqos -e "mba:1=100;mba:2=100;"

# /data2/yufenggu/anaconda3/envs/MLPerf_Intel_resnet50/bin/python3 run.py --workload-name resnet50 \
#     --mlperf-conf resnet50/pytorch-cpu/mlperf_inference/mlperf.conf \
#     --user-conf resnet50/pytorch-cpu/scripts/ICX/user.conf.ICX40C_2S \
#     --workload-config resnet50/pytorch-cpu/scripts/ICX/resnet50-config_Server_ICX40C_2S.yml \
#     --num-instance 18 \
#     --cpus-per-instance 1 \
#     --cores-offset 0 \
#     --warmup 500 \
#     --output-dir peak_output_logs_18_1_e \
#     --scenario Server \
#     --mode FindPeakPerformance &
# P1=$!
# /data2/yufenggu/anaconda3/envs/MLPerf_Intel_resnet50/bin/python3 run.py --workload-name resnet50 \
#     --mlperf-conf resnet50/pytorch-cpu/mlperf_inference/mlperf.conf \
#     --user-conf resnet50/pytorch-cpu/scripts/ICX/user.conf.ICX40C_2S \
#     --workload-config resnet50/pytorch-cpu/scripts/ICX/resnet50-config_Server_ICX40C_2S.yml \
#     --num-instance 18 \
#     --cpus-per-instance 1 \
#     --cores-offset 18 \
#     --warmup 500 \
#     --output-dir peak_output_logs_18_1_f \
#     --scenario Server \
#     --mode FindPeakPerformance &
# P2=$!
# wait $P1 $P2

# sudo pqos -R 
# sudo pqos -a "llc:1=0-17;llc:2=18-35;"
# sudo pqos -e "llc:1=0xfff;llc:2=0xfff;"
# sudo pqos -e "mba:1=50;mba:2=50;"

# /data2/yufenggu/anaconda3/envs/MLPerf_Intel_resnet50/bin/python3 run.py --workload-name resnet50 \
#     --mlperf-conf resnet50/pytorch-cpu/mlperf_inference/mlperf.conf \
#     --user-conf resnet50/pytorch-cpu/scripts/ICX/user.conf.ICX40C_2S \
#     --workload-config resnet50/pytorch-cpu/scripts/ICX/resnet50-config_Server_ICX40C_2S.yml \
#     --num-instance 18 \
#     --cpus-per-instance 1 \
#     --cores-offset 0 \
#     --warmup 500 \
#     --output-dir peak_output_logs_18_1_g \
#     --scenario Server \
#     --mode FindPeakPerformance &
# P1=$!
# /data2/yufenggu/anaconda3/envs/MLPerf_Intel_resnet50/bin/python3 run.py --workload-name resnet50 \
#     --mlperf-conf resnet50/pytorch-cpu/mlperf_inference/mlperf.conf \
#     --user-conf resnet50/pytorch-cpu/scripts/ICX/user.conf.ICX40C_2S \
#     --workload-config resnet50/pytorch-cpu/scripts/ICX/resnet50-config_Server_ICX40C_2S.yml \
#     --num-instance 18 \
#     --cpus-per-instance 1 \
#     --cores-offset 18 \
#     --warmup 500 \
#     --output-dir peak_output_logs_18_1_h \
#     --scenario Server \
#     --mode FindPeakPerformance &
# P2=$!
# wait $P1 $P2