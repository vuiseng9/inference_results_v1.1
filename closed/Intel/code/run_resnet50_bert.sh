export LD_LIBRARY_PATH="${CONDA_PREFIX}/lib/python3.7/site-packages/torch_ipex-1.8.0-py3.7-linux-x86_64.egg/lib:${CONDA_PREFIX}/lib:$LD_LIBRARY_PATH"
export LD_PRELOAD=$CONDA_PREFIX/lib/libiomp5.so
export LD_PRELOAD=${CONDA_PREFIX}/lib/libjemalloc.so
export MALLOC_CONF="oversize_threshold:1,background_thread:true,percpu_arena:percpu,metadata_thp:always,dirty_decay_ms:9000000000,muzzy_decay_ms:9000000000";
export LD_PRELOAD=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/resnet50/pytorch-cpu/lib/libjemalloc.so:$LD_PRELOAD
export MALLOC_CONF="oversize_threshold:1,background_thread:true,metadata_thp:auto,dirty_decay_ms:9000000000,muzzy_decay_ms:9000000000"
export DNNL_MAX_CPU_ISA=AVX512_CORE_AMX
export DNNL_PRIMITIVE_CACHE_CAPACITY=1024

sudo pqos -R 
sudo pqos -a "llc:1=0-15;llc:2=16-31;"
sudo pqos -e "llc:1=0x03f;llc:2=0xfc0;"
sudo pqos -e "mba:1=50;mba:2=50;"

mkdir peak_bert_4_4
numactl -m 0 -N 0 -C 0-15 /data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/build/bert_inference -n 4 -j 4 --test_scenario=Server --model_file=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/bert.pt --sample_file=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/squad.pt --mlperf_config=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/inference/mlperf.conf --user_config=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/user.conf -o peak_bert_4_4 -b 2 > bert.txt &
P1=$!

python3 run.py --workload-name resnet50 \
    --mlperf-conf resnet50/pytorch-cpu/mlperf_inference/mlperf.conf \
    --user-conf resnet50/pytorch-cpu/scripts/ICX/user.conf.ICX40C_2S \
    --workload-config resnet50/pytorch-cpu/scripts/ICX/resnet50-config_Server_ICX40C_2S.yml \
    --num-instance 16 \
    --cpus-per-instance 1 \
    --cores-offset 16 \
    --warmup 500 \
    --output-dir peak_resnet50_4_4 \
    --scenario Server \
    --mode Performance > resnet50.txt &
P2=$!
wait $P1 $P2


# sudo pqos -R 

# mkdir peak_bert_none
# numactl -m 0 -N 0 -C 0-31 /data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/build/bert_inference -n 8 -j 4 --test_scenario=Server --model_file=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/bert.pt --sample_file=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/squad.pt --mlperf_config=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/inference/mlperf.conf --user_config=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/user.conf -o peak_bert_none -b 2 -p > bert_none.txt &
# P1=$!

# python3 run.py --workload-name resnet50 \
#     --mlperf-conf resnet50/pytorch-cpu/mlperf_inference/mlperf.conf \
#     --user-conf resnet50/pytorch-cpu/scripts/ICX/user.conf.ICX40C_2S \
#     --workload-config resnet50/pytorch-cpu/scripts/ICX/resnet50-config_Server_ICX40C_2S.yml \
#     --num-instance 32 \
#     --cpus-per-instance 1 \
#     --cores-offset 0 \
#     --warmup 500 \
#     --output-dir peak_resnet50_none \
#     --scenario Server \
#     --mode FindPeakPerformance > resnet50_none.txt &
# P2=$!
# wait $P1 $P2


# sudo pqos -R 
# sudo pqos -a "llc:1=0-15;llc:2=16-31;"
# sudo pqos -e "llc:1=0x03f;llc:2=0xfc0;"
# sudo pqos -e "mba:1=50;mba:2=50;"

# mkdir peak_bert_all
# numactl -m 0 -N 0 -C 0-15 /data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/build/bert_inference -n 4 -j 4 --test_scenario=Server --model_file=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/bert.pt --sample_file=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/squad.pt --mlperf_config=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/inference/mlperf.conf --user_config=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/user.conf -o peak_bert_all -b 2 -p > bert_all.txt &
# P1=$!

# python3 run.py --workload-name resnet50 \
#     --mlperf-conf resnet50/pytorch-cpu/mlperf_inference/mlperf.conf \
#     --user-conf resnet50/pytorch-cpu/scripts/ICX/user.conf.ICX40C_2S \
#     --workload-config resnet50/pytorch-cpu/scripts/ICX/resnet50-config_Server_ICX40C_2S.yml \
#     --num-instance 16 \
#     --cpus-per-instance 1 \
#     --cores-offset 16 \
#     --warmup 500 \
#     --output-dir peak_resnet50_all \
#     --scenario Server \
#     --mode FindPeakPerformance > resnet50_all.txt &
# P2=$!
# wait $P1 $P2

# # sudo pqos -R 
# # sudo pqos -a "llc:1=0-31;llc:2=0-31;"
# # sudo pqos -e "llc:1=0x03f;llc:2=0xfc0;"
# # sudo pqos -e "mba:1=100;mba:2=100;"

# # mkdir peak_bert_llc
# # numactl -m 0 -N 0 -C 0-31 /data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/build/bert_inference -n 8 -j 4 --test_scenario=Server --model_file=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/bert.pt --sample_file=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/squad.pt --mlperf_config=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/inference/mlperf.conf --user_config=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/user.conf -o peak_bert_llc -b 2 -p > bert_llc.txt &
# # P1=$!

# # python3 run.py --workload-name resnet50 \
# #     --mlperf-conf resnet50/pytorch-cpu/mlperf_inference/mlperf.conf \
# #     --user-conf resnet50/pytorch-cpu/scripts/ICX/user.conf.ICX40C_2S \
# #     --workload-config resnet50/pytorch-cpu/scripts/ICX/resnet50-config_Server_ICX40C_2S.yml \
# #     --num-instance 32 \
# #     --cpus-per-instance 1 \
# #     --cores-offset 0 \
# #     --warmup 500 \
# #     --output-dir peak_resnet50_llc \
# #     --scenario Server \
# #     --mode FindPeakPerformance > resnet50_llc.txt &

# # P2=$!
# # wait $P1 $P2

# # sudo pqos -R 
# # sudo pqos -a "llc:1=0-31;llc:2=0-31;"
# # sudo pqos -e "llc:1=0xfff;llc:2=0xfff;"
# # sudo pqos -e "mba:1=50;mba:2=50;"

# # mkdir peak_bert_mb
# # numactl -m 0 -N 0 -C 0-31 /data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/build/bert_inference -n 8 -j 4 --test_scenario=Server --model_file=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/bert.pt --sample_file=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/squad.pt --mlperf_config=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/inference/mlperf.conf --user_config=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/user.conf -o peak_bert_mb -b 2 -p > bert_mb.txt &
# # P1=$!

# # python3 run.py --workload-name resnet50 \
# #     --mlperf-conf resnet50/pytorch-cpu/mlperf_inference/mlperf.conf \
# #     --user-conf resnet50/pytorch-cpu/scripts/ICX/user.conf.ICX40C_2S \
# #     --workload-config resnet50/pytorch-cpu/scripts/ICX/resnet50-config_Server_ICX40C_2S.yml \
# #     --num-instance 32 \
# #     --cpus-per-instance 1 \
# #     --cores-offset 0 \
# #     --warmup 500 \
# #     --output-dir peak_resnet50_mb \
# #     --scenario Server \
# #     --mode FindPeakPerformance > resnet50_mb.txt &

# # P2=$!
# # wait $P1 $P2

# sudo pqos -R 
# sudo pqos -a "llc:1=0-15;llc:2=16-31;"
# sudo pqos -e "llc:1=0xfff;llc:2=0xfff;"
# sudo pqos -e "mba:1=100;mba:2=100;"

# mkdir peak_bert_core
# numactl -m 0 -N 0 -C 0-15 /data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/build/bert_inference -n 4 -j 4 --test_scenario=Server --model_file=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/bert.pt --sample_file=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/squad.pt --mlperf_config=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/inference/mlperf.conf --user_config=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/user.conf -o peak_bert_core -b 2 -p > bert_core.txt &
# P1=$!

# python3 run.py --workload-name resnet50 \
#     --mlperf-conf resnet50/pytorch-cpu/mlperf_inference/mlperf.conf \
#     --user-conf resnet50/pytorch-cpu/scripts/ICX/user.conf.ICX40C_2S \
#     --workload-config resnet50/pytorch-cpu/scripts/ICX/resnet50-config_Server_ICX40C_2S.yml \
#     --num-instance 16 \
#     --cpus-per-instance 1 \
#     --cores-offset 16 \
#     --warmup 500 \
#     --output-dir peak_resnet50_core \
#     --scenario Server \
#     --mode FindPeakPerformance > resnet50_core.txt &
# P2=$!
# wait $P1 $P2

# # sudo pqos -R 
# # sudo pqos -a "llc:1=0-31;llc:2=0-31;"
# # sudo pqos -e "llc:1=0x03f;llc:2=0xfc0;"
# # sudo pqos -e "mba:1=50;mba:2=50;"

# # mkdir peak_bert_llc_mb
# # numactl -m 0 -N 0 -C 0-31 /data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/build/bert_inference -n 8 -j 4 --test_scenario=Server --model_file=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/bert.pt --sample_file=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/squad.pt --mlperf_config=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/inference/mlperf.conf --user_config=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/user.conf -o peak_bert_llc_mb -b 2 -p > bert_llc_mb.txt &
# # P1=$!

# # python3 run.py --workload-name resnet50 \
# #     --mlperf-conf resnet50/pytorch-cpu/mlperf_inference/mlperf.conf \
# #     --user-conf resnet50/pytorch-cpu/scripts/ICX/user.conf.ICX40C_2S \
# #     --workload-config resnet50/pytorch-cpu/scripts/ICX/resnet50-config_Server_ICX40C_2S.yml \
# #     --num-instance 32 \
# #     --cpus-per-instance 1 \
# #     --cores-offset 0 \
# #     --warmup 500 \
# #     --output-dir peak_resnet50_llc_mb \
# #     --scenario Server \
# #     --mode FindPeakPerformance > resnet50_llc_mb.txt &
# # P2=$!
# # wait $P1 $P2

# sudo pqos -R 
# sudo pqos -a "llc:1=0-15;llc:2=16-31;"
# sudo pqos -e "llc:1=0x03f;llc:2=0xfc0;"
# sudo pqos -e "mba:1=100;mba:2=100;"

# mkdir peak_bert_core_llc
# numactl -m 0 -N 0 -C 0-15 /data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/build/bert_inference -n 4 -j 4 --test_scenario=Server --model_file=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/bert.pt --sample_file=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/squad.pt --mlperf_config=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/inference/mlperf.conf --user_config=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/user.conf -o peak_bert_core_llc -b 2 -p > bert_core_llc.txt &
# P1=$!

# python3 run.py --workload-name resnet50 \
#     --mlperf-conf resnet50/pytorch-cpu/mlperf_inference/mlperf.conf \
#     --user-conf resnet50/pytorch-cpu/scripts/ICX/user.conf.ICX40C_2S \
#     --workload-config resnet50/pytorch-cpu/scripts/ICX/resnet50-config_Server_ICX40C_2S.yml \
#     --num-instance 16 \
#     --cpus-per-instance 1 \
#     --cores-offset 16 \
#     --warmup 500 \
#     --output-dir peak_resnet50_core_llc \
#     --scenario Server \
#     --mode FindPeakPerformance > resnet50_core_llc.txt &
# P2=$!
# wait $P1 $P2

# sudo pqos -R 
# sudo pqos -a "llc:1=0-15;llc:2=16-31;"
# sudo pqos -e "llc:1=0xfff;llc:2=0xfff;"
# sudo pqos -e "mba:1=50;mba:2=50;"

# mkdir peak_bert_core_mb
# numactl -m 0 -N 0 -C 0-15 /data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/build/bert_inference -n 4 -j 4 --test_scenario=Server --model_file=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/bert.pt --sample_file=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/squad.pt --mlperf_config=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/inference/mlperf.conf --user_config=/data2/yufenggu/inference_results_v1.1/closed/Intel/code/bert-99/pytorch-cpu/user.conf -o peak_bert_core_mb -b 2 -p > bert_core_mb.txt &
# P1=$!

# python3 run.py --workload-name resnet50 \
#     --mlperf-conf resnet50/pytorch-cpu/mlperf_inference/mlperf.conf \
#     --user-conf resnet50/pytorch-cpu/scripts/ICX/user.conf.ICX40C_2S \
#     --workload-config resnet50/pytorch-cpu/scripts/ICX/resnet50-config_Server_ICX40C_2S.yml \
#     --num-instance 16 \
#     --cpus-per-instance 1 \
#     --cores-offset 16 \
#     --warmup 500 \
#     --output-dir peak_resnet50_core_mb \
#     --scenario Server \
#     --mode FindPeakPerformance > resnet50_core_mb.txt &
# P2=$!
# wait $P1 $P2
