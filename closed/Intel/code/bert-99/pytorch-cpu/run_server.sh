set -x
export LD_PRELOAD=${CONDA_PREFIX}/lib/libjemalloc.so
export MALLOC_CONF="oversize_threshold:1,background_thread:true,percpu_arena:percpu,metadata_thp:always,dirty_decay_ms:9000000000,muzzy_decay_ms:9000000000";

accuracy=$1

sut_dir=$(pwd)
executable=${sut_dir}/build/bert_inference
mode="Server"

# OUTDIR="$sut_dir/test_log"
# mkdir $OUTDIR
# CONFIG="-n 18 -j 8 --test_scenario=${mode} --model_file=${sut_dir}/bert.pt --sample_file=${sut_dir}/squad.pt --mlperf_config=${sut_dir}/inference/mlperf.conf --user_config=${sut_dir}/user.conf -o ${OUTDIR} -b 2 ${accuracy}"

# ${executable} ${CONFIG}

sudo pqos -R 

# mkdir test_log_4_9
# numactl -m 0 -N 0 -C 0-35 ${executable} -n 4 -j 9 --test_scenario=${mode} --model_file=${sut_dir}/bert.pt --sample_file=${sut_dir}/squad.pt --mlperf_config=${sut_dir}/inference/mlperf.conf --user_config=${sut_dir}/user.conf -o ${sut_dir}/test_log_4_9 -b 2 -p

# mkdir test_log_6_6
# numactl -m 0 -N 0 -C 0-35 ${executable} -n 6 -j 6 --test_scenario=${mode} --model_file=${sut_dir}/bert.pt --sample_file=${sut_dir}/squad.pt --mlperf_config=${sut_dir}/inference/mlperf.conf --user_config=${sut_dir}/user.conf -o ${sut_dir}/test_log_6_6 -b 2 -p

# sudo pqos -a "llc:1=0-35;"
# sudo pqos -e "llc:1=0xfff;"
# sudo pqos -e "mba:1=25;"

# mkdir perf_test_log_4_4
# numactl -m 0 -N 0 -C 0-15 ${executable} -n 4 -j 4 --test_scenario=${mode} --model_file=${sut_dir}/bert.pt --sample_file=${sut_dir}/squad.pt --mlperf_config=${sut_dir}/inference/mlperf.conf --user_config=${sut_dir}/user.conf -o ${sut_dir}/perf_test_log_4_4 -b 2

# mkdir test_log_12_3
# numactl -m 0 -N 0 -C 0-35 ${executable} -n 12 -j 3 --test_scenario=${mode} --model_file=${sut_dir}/bert.pt --sample_file=${sut_dir}/squad.pt --mlperf_config=${sut_dir}/inference/mlperf.conf --user_config=${sut_dir}/user.conf -o ${sut_dir}/test_log_12_3 -b 2 -p

# mkdir test_log_18_2
# numactl -m 0 -N 0 -C 0-35 ${executable} -n 18 -j 2 --test_scenario=${mode} --model_file=${sut_dir}/bert.pt --sample_file=${sut_dir}/squad.pt --mlperf_config=${sut_dir}/inference/mlperf.conf --user_config=${sut_dir}/user.conf -o ${sut_dir}/test_log_18_2 -b 2 -p

# mkdir test_log_36_1
# numactl -m 0 -N 0 -C 0-35 ${executable} -n 36 -j 1 --test_scenario=${mode} --model_file=${sut_dir}/bert.pt --sample_file=${sut_dir}/squad.pt --mlperf_config=${sut_dir}/inference/mlperf.conf --user_config=${sut_dir}/user.conf -o ${sut_dir}/test_log_36_1 -b 2 -p

# for core in 2 4 6 8
# do
#     mkdir test_log_${core}_4
#     numactl -m 0 -N 0 -C 0-35 ${executable} -n ${core} -j 4 --test_scenario=${mode} --model_file=${sut_dir}/bert.pt --sample_file=${sut_dir}/squad.pt --mlperf_config=${sut_dir}/inference/mlperf.conf --user_config=${sut_dir}/user.conf -o ${sut_dir}/test_log_${core}_4 -b 2 -p
# done


# for cache in "llc:1=0xfff;" "llc:1=0x7ff;" "llc:1=0x3ff;" "llc:1=0x1ff;" "llc:1=0x0ff;" "llc:1=0x07f;" "llc:1=0x03f;" "llc:1=0x01f;" "llc:1=0x00f;" "llc:1=0x007;" "llc:1=0x003;" "llc:1=0x001;"
for cache in "llc:1=0xfff;" "llc:1=0x0ff;" "llc:1=0x00f;"
    do
    for core in "0-35"
        do
        # for MB in "mba:1=100;" "mba:1=90;" "mba:1=80;" "mba:1=70;" "mba:1=60;" "mba:1=50;" "mba:1=40;" "mba:1=30;" "mba:1=20;" "mba:1=10;"
        for MB in "mba:1=100;" "mba:1=75;" "mba:1=50;" "mba:1=25;"
            do
            echo $cache
            echo llc:1=$core;
            echo $MB
            sudo pqos -R 
            sudo pqos -a llc:1=$core;
            sudo pqos -e $cache
            sudo pqos -e $MB

            mkdir test_log_9_4_${cache}_${MB}
            numactl -m 0 -N 0 -C 0-35 ${executable} -n 9 -j 4 --test_scenario=${mode} --model_file=${sut_dir}/bert.pt --sample_file=${sut_dir}/squad.pt --mlperf_config=${sut_dir}/inference/mlperf.conf --user_config=${sut_dir}/user.conf -o ${sut_dir}/perf_log_9_4_${cache}_${MB} -b 2
            done
        done
    done


# mkdir test_log_8_4_a
# numactl -m 0 -N 0 -C 0-31 ${executable} -n 8 -j 4 --test_scenario=${mode} --model_file=${sut_dir}/bert.pt --sample_file=${sut_dir}/squad.pt --mlperf_config=${sut_dir}/inference/mlperf.conf --user_config=${sut_dir}/user.conf -o ${sut_dir}/test_log_8_4_a -b 2 -p
# P1=$!
# mkdir test_log_8_4_b
# numactl -m 0 -N 0 -C 0-31 ${executable} -n 8 -j 4 --test_scenario=${mode} --model_file=${sut_dir}/bert.pt --sample_file=${sut_dir}/squad.pt --mlperf_config=${sut_dir}/inference/mlperf.conf --user_config=${sut_dir}/user.conf -o ${sut_dir}/test_log_8_4_b -b 2 -p
# P2=$!
# wait $P1 $P2

# sudo pqos -R 
# sudo pqos -a "llc:1=0-15;llc:2=16-31;"
# sudo pqos -e "llc:1=0x03f;llc:2=0xfc0;"
# sudo pqos -e "mba:1=50;mba:2=50;"

# mkdir test_log_all_a
# numactl -m 0 -N 0 -C 0-15 ${executable} -n 4 -j 4 --test_scenario=${mode} --model_file=${sut_dir}/bert.pt --sample_file=${sut_dir}/squad.pt --mlperf_config=${sut_dir}/inference/mlperf.conf --user_config=${sut_dir}/user.conf -o ${sut_dir}/test_log_all_a -b 2 -p
# P1=$!
# mkdir test_log_all_b
# numactl -m 0 -N 0 -C 16-31 ${executable} -n 4 -j 4 --test_scenario=${mode} --model_file=${sut_dir}/bert.pt --sample_file=${sut_dir}/squad.pt --mlperf_config=${sut_dir}/inference/mlperf.conf --user_config=${sut_dir}/user.conf -o ${sut_dir}/test_log_all_b -b 2 -p
# P2=$!
# wait $P1 $P2

# sudo pqos -R 
# sudo pqos -a "llc:1=0-31;llc:2=0-31;"
# sudo pqos -e "llc:1=0x03f;llc:2=0xfc0;"
# sudo pqos -e "mba:1=100;mba:2=100;"

# mkdir test_log_llc_a
# numactl -m 0 -N 0 -C 0-31 ${executable} -n 8 -j 4 --test_scenario=${mode} --model_file=${sut_dir}/bert.pt --sample_file=${sut_dir}/squad.pt --mlperf_config=${sut_dir}/inference/mlperf.conf --user_config=${sut_dir}/user.conf -o ${sut_dir}/test_log_llc_a -b 2 -p
# P1=$!
# mkdir test_log_llc_b
# numactl -m 0 -N 0 -C 0-31 ${executable} -n 8 -j 4 --test_scenario=${mode} --model_file=${sut_dir}/bert.pt --sample_file=${sut_dir}/squad.pt --mlperf_config=${sut_dir}/inference/mlperf.conf --user_config=${sut_dir}/user.conf -o ${sut_dir}/test_log_llc_b -b 2 -p
# P2=$!
# wait $P1 $P2

# sudo pqos -R 
# sudo pqos -a "llc:1=0-31;llc:2=0-31;"
# sudo pqos -e "llc:1=0xfff;llc:2=0xfff;"
# sudo pqos -e "mba:1=50;mba:2=50;"

# mkdir test_log_mb_a
# numactl -m 0 -N 0 -C 0-31 ${executable} -n 8 -j 4 --test_scenario=${mode} --model_file=${sut_dir}/bert.pt --sample_file=${sut_dir}/squad.pt --mlperf_config=${sut_dir}/inference/mlperf.conf --user_config=${sut_dir}/user.conf -o ${sut_dir}/test_log_mb_a -b 2 -p
# P1=$!
# mkdir test_log_mb_b
# numactl -m 0 -N 0 -C 0-31 ${executable} -n 8 -j 4 --test_scenario=${mode} --model_file=${sut_dir}/bert.pt --sample_file=${sut_dir}/squad.pt --mlperf_config=${sut_dir}/inference/mlperf.conf --user_config=${sut_dir}/user.conf -o ${sut_dir}/test_log_mb_b -b 2 -p
# P2=$!
# wait $P1 $P2

# sudo pqos -R 
# sudo pqos -a "llc:1=0-31;llc:2=0-31;"
# sudo pqos -e "llc:1=0x03f;llc:2=0xfc0;"
# sudo pqos -e "mba:1=50;mba:2=50;"

# mkdir test_log_llc_mb_a
# numactl -m 0 -N 0 -C 0-31 ${executable} -n 8 -j 4 --test_scenario=${mode} --model_file=${sut_dir}/bert.pt --sample_file=${sut_dir}/squad.pt --mlperf_config=${sut_dir}/inference/mlperf.conf --user_config=${sut_dir}/user.conf -o ${sut_dir}/test_log_llc_mb_a -b 2 -p
# P1=$!
# mkdir test_log_llc_mb_b
# numactl -m 0 -N 0 -C 0-31 ${executable} -n 8 -j 4 --test_scenario=${mode} --model_file=${sut_dir}/bert.pt --sample_file=${sut_dir}/squad.pt --mlperf_config=${sut_dir}/inference/mlperf.conf --user_config=${sut_dir}/user.conf -o ${sut_dir}/test_log_llc_mb_b -b 2 -p
# P2=$!
# wait $P1 $P2

# sudo pqos -R 
# sudo pqos -a "llc:1=0-15;llc:2=16-31;"
# sudo pqos -e "llc:1=0x03f;llc:2=0xfc0;"
# sudo pqos -e "mba:1=100;mba:2=100;"

# mkdir test_log_core_llc_a
# numactl -m 0 -N 0 -C 0-15 ${executable} -n 4 -j 4 --test_scenario=${mode} --model_file=${sut_dir}/bert.pt --sample_file=${sut_dir}/squad.pt --mlperf_config=${sut_dir}/inference/mlperf.conf --user_config=${sut_dir}/user.conf -o ${sut_dir}/test_log_core_llc_a -b 2 -p
# P1=$!
# mkdir test_log_core_llc_b
# numactl -m 0 -N 0 -C 16-31 ${executable} -n 4 -j 4 --test_scenario=${mode} --model_file=${sut_dir}/bert.pt --sample_file=${sut_dir}/squad.pt --mlperf_config=${sut_dir}/inference/mlperf.conf --user_config=${sut_dir}/user.conf -o ${sut_dir}/test_log_core_llc_b -b 2 -p
# P2=$!
# wait $P1 $P2

# sudo pqos -R 
# sudo pqos -a "llc:1=0-15;llc:2=16-31;"
# sudo pqos -e "llc:1=0xfff;llc:2=0xfff;"
# sudo pqos -e "mba:1=50;mba:2=50;"

# mkdir test_log_core_mb_a
# numactl -m 0 -N 0 -C 0-15 ${executable} -n 4 -j 4 --test_scenario=${mode} --model_file=${sut_dir}/bert.pt --sample_file=${sut_dir}/squad.pt --mlperf_config=${sut_dir}/inference/mlperf.conf --user_config=${sut_dir}/user.conf -o ${sut_dir}/test_log_core_mb_a -b 2 -p
# P1=$!
# mkdir test_log_core_mb_b
# numactl -m 0 -N 0 -C 16-31 ${executable} -n 4 -j 4 --test_scenario=${mode} --model_file=${sut_dir}/bert.pt --sample_file=${sut_dir}/squad.pt --mlperf_config=${sut_dir}/inference/mlperf.conf --user_config=${sut_dir}/user.conf -o ${sut_dir}/test_log_core_mb_b -b 2 -p
# P2=$!
# wait $P1 $P2

# sudo pqos -R 
# sudo pqos -a "llc:1=0-15;llc:2=16-31;"
# sudo pqos -e "llc:1=0xfff;llc:2=0xfff;"
# sudo pqos -e "mba:1=100;mba:2=100;"

# mkdir test_log_core_a
# numactl -m 0 -N 0 -C 0-15 ${executable} -n 4 -j 4 --test_scenario=${mode} --model_file=${sut_dir}/bert.pt --sample_file=${sut_dir}/squad.pt --mlperf_config=${sut_dir}/inference/mlperf.conf --user_config=${sut_dir}/user.conf -o ${sut_dir}/test_log_core_a -b 2 -p
# P1=$!
# mkdir test_log_core_b
# numactl -m 0 -N 0 -C 16-31 ${executable} -n 4 -j 4 --test_scenario=${mode} --model_file=${sut_dir}/bert.pt --sample_file=${sut_dir}/squad.pt --mlperf_config=${sut_dir}/inference/mlperf.conf --user_config=${sut_dir}/user.conf -o ${sut_dir}/test_log_core_b -b 2 -p
# P2=$!
# wait $P1 $P2


# if [ ${accuracy} = "--accuracy" ]; then
#         vocab_file= ../bert-large-uncased/vocab.txt
#         val_data= ../datasets/dev-v1.1.json
#         bash acc_scripts/accuracy.sh $vocab_file $val_data
#         # bash acc_scripts/accuracy.sh test_log_9_4
# fi

set +x
