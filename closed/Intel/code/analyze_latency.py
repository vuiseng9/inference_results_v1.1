import sys
import os

def analyze(setting, requested_latency):
    file_name = setting+"/mlperf_log_trace.json"
    try:
        f = open(file_name, "r")
        lines = f.readlines()
        latencies = []
        for line in lines:
            if "issue_to_done" in line:
                finish = int(line.split(":")[-1].split("}")[0])
                start = int(line.split(":")[-2].split(",")[0])
                latency = (finish + start)/1000000
                latencies.append(latency)
        valid_latency = 0
        latencies.sort()
        # print(len(latencies))
        # print(latencies[round(len(latencies)*0.50)])
        # print(latencies[round(len(latencies)*0.90)])
        # print(latencies[round(len(latencies)*0.95)])
        # print(latencies[round(len(latencies)*0.97)])
        # print(latencies[round(len(latencies)*0.99)])
        # print(latencies[round(len(latencies)*0.999)])
        for l in latencies:
            if l < requested_latency:
                valid_latency += 1
        # print(setting, "p99 latency: {:.2f} valid latency: {:.2f}%".format(latencies[round(len(latencies)*0.99)], valid_latency/len(latencies)*100))
        # print("{:.2f} {:.2f}%".format(latencies[round(len(latencies)*0.99)], valid_latency/len(latencies)*100))
        print("{:.2f}%".format(valid_latency/len(latencies)*100))
    except:
        print(setting, "file does not exist.")

# folder = "perf_output_2/"

# for cache in ["llc:1=0xfff;", "llc:1=0x0ff;", "llc:1=0x00f;"]:
#     for MB in ["mba:1=100;", "mba:1=75;", "mba:1=50;", "mba:1=25;"]:
#         analyze("perf_output_logs_36_1_" + cache + "_" + MB, 100)

# for cache in ["llc:1=0xfff;", "llc:1=0x0ff;", "llc:1=0x00f;"]:
#     for MB in ["mba:1=100;", "mba:1=75;", "mba:1=50;", "mba:1=25;"]:
#         analyze("bert-99/pytorch-cpu/perf_log_9_4_" + cache + "_" + MB, 130)

# folder = "resnet_900qps_bert_160qps/"
# folder = "resnet_800qps_bert_120qps/"
# folder = "resnet_750qps_bert_120qps/"
# folder = "resnet_700qps_bert_80qps/"
# folder = ""

folder = sys.argv[1]

# for root, dirs, files in os.walk(folder):
#     if dirs != []:
#         for dir in dirs:
#             model = dir.split("_")[1]
#             if model == "resnet50":
#                 analyze(folder + dir, 100)
#             if model == "bert":
#                 analyze(folder + dir, 130)

for model in ["bert", "resnet50"]:
    # for cache in ["_4_8"]:
    for cache in ["_1_1", "_2_1", "_2_2"]:
        # for mb in ["_50_100", "_60_100", "_70_100", "_80_100", "_90_100", "_100_100", "_100_90", "_100_80", "_100_70", "_100_60", "_100_50",]:
        for mb in ["_10_10", "_10_20", "_20_10", "_20_20"]:
            if model == "resnet50":
                analyze(folder + "perf_" + model + cache + mb, 100)
            if model == "bert":
                analyze(folder + "perf_" + model + cache + mb, 130)

# analyze("perf_resnet50_none_0", 100)
# analyze("perf_resnet50_none_1", 100)
# analyze("perf_resnet50_none_2", 100)
# analyze("perf_resnet50_none_3", 100)
# analyze("perf_bert_none_0", 130)
# analyze("perf_bert_none_1", 130)
# analyze("perf_bert_none_2", 130)
# analyze("perf_bert_none_3", 130)