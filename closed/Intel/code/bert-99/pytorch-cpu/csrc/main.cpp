#include <loadgen.h>
#include <omp.h>
#include <iostream>
#include <vector>
#include <thread>
#include <unistd.h>
#include <time.h>

#include "cxxopts.hpp"
#include "torch_sut.hpp"
#include "test_settings.h"

int main(int argc, char **argv) {
  cxxopts::Options opts (
    "bert_inference", "MLPerf Benchmark, BERT Inference");
  opts.allow_unrecognised_options();
  opts.add_options()
    ("m,model_file", "Torch Model File",
     cxxopts::value<std::string>())

    ("s,sample_file", "SQuAD Sample File",
     cxxopts::value<std::string>())

    ("k,test_scenario", "Test scenario [Offline, Server]",
     cxxopts::value<std::string>()->default_value("Offline"))

    ("n,inter_parallel", "Instance Number",
     cxxopts::value<int>()->default_value("1"))

    ("j,intra_parallel", "Thread Number Per-Instance",
     cxxopts::value<int>()->default_value("4"))

    ("c,mlperf_config", "Configuration File for LoadGen",
     cxxopts::value<std::string>()->default_value("mlperf.conf"))

    ("u,user_config", "User Configuration for LoadGen",
     cxxopts::value<std::string>()->default_value("user.conf"))

    ("o,output_dir", "Test Output Directory",
     cxxopts::value<std::string>()->default_value("mlperf_output"))

    ("b,batch", "Offline Model Batch Size",
     cxxopts::value<int>()->default_value("1"))

    ("disable-hyperthreading", "Whether system enabled hyper-threading or not",
     cxxopts::value<bool>()->default_value("false"))

    ("a,accuracy", "Run test in accuracy mode instead of performance",
     cxxopts::value<bool>()->default_value("false"))

    ("p,find_peak_performance", "Run test in FindPeakPerformance mode instead of performance",
     cxxopts::value<bool>()->default_value("false"))

    ;

  auto parsed_opts = opts.parse(argc, argv);

  auto model_file = parsed_opts["model_file"].as<std::string>();
  auto sample_file = parsed_opts["sample_file"].as<std::string>();
  auto inter_parallel = parsed_opts["inter_parallel"].as<int>();
  auto intra_parallel = parsed_opts["intra_parallel"].as<int>();
  auto output_dir = parsed_opts["output_dir"].as<std::string>();
  auto mlperf_conf = parsed_opts["mlperf_config"].as<std::string>();
  auto user_conf = parsed_opts["user_config"].as<std::string>();
  auto batch_size = parsed_opts["batch"].as<int>();
  auto disable_ht = parsed_opts["disable-hyperthreading"].as<bool>();
  auto test_scenario = parsed_opts["test_scenario"].as<std::string>();
  auto accuracy_mode = parsed_opts["accuracy"].as<bool>();
  auto find_peak_performance_mode = parsed_opts["find_peak_performance"].as<bool>();

  mlperf::TestSettings testSettings;
  mlperf::LogSettings logSettings;
  logSettings.log_output.outdir = output_dir;

  if (test_scenario == "Offline") {
    BertOfflineSUT sut(
        model_file, sample_file, inter_parallel,
        intra_parallel, batch_size, !disable_ht);
  
    testSettings.scenario = mlperf::TestScenario::Offline;
    testSettings.FromConfig(mlperf_conf, "bert", "Offline");
    testSettings.FromConfig(user_conf, "bert", "Offline");

    if (accuracy_mode)
      testSettings.mode = mlperf::TestMode::AccuracyOnly;

    std::cout<<"Start Offline testing..."<<std::endl;
    mlperf::StartTest(&sut, sut.GetQSL(), testSettings, logSettings);
    std::cout<<"Testing done."<<std::endl;

  } else if (test_scenario == "Server") {
    BertServerSUT server_sut(
        model_file, sample_file, inter_parallel,
        intra_parallel, batch_size, !disable_ht);

    testSettings.scenario = mlperf::TestScenario::Server;
    testSettings.FromConfig(mlperf_conf, "bert", "Server");
    testSettings.FromConfig(user_conf, "bert", "Server");

    if (accuracy_mode)
      testSettings.mode = mlperf::TestMode::AccuracyOnly;
    else if (find_peak_performance_mode)
      testSettings.mode = mlperf::TestMode::FindPeakPerformance;
    else
      testSettings.mode = mlperf::TestMode::PerformanceOnly;


    sleep(5);
    auto start = std::chrono::system_clock::now();
    std::cout<<"Start Server testing..."<<std::endl;
    mlperf::StartTest(&server_sut, server_sut.GetQSL(), testSettings, logSettings);
    std::cout<<"Testing done."<<std::endl;
    auto end = std::chrono::system_clock::now();
    auto elapsed =  std::chrono::duration_cast<std::chrono::seconds>(end - start);
    std::cout << "Time:" << elapsed.count() << "s.\n";
  }

  return 0;
}
