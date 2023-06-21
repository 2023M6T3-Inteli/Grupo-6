import 'dart:async';
import 'package:flutter/services.dart' show rootBundle;
import 'package:web3dart/web3dart.dart';
import '../constants.dart';

Future<DeployedContract> loadContract() async {
  String abi = await rootBundle.loadString("assets/blockchain/abi.json");
  String contractAddress = contractAddress1;
  final contract = DeployedContract(ContractAbi.fromJson(abi, 'Dellfactory'),
      EthereumAddress.fromHex(contractAddress));
  return contract;
}

Future<String> sendFunction(String funcname, List<dynamic> args,
    Web3Client ethClient, String privateKey) async {
  EthPrivateKey credentials = EthPrivateKey.fromHex(privateKey);
  DeployedContract contract = await loadContract();
  final ethFunction = contract.function(funcname);
  final result = await ethClient.sendTransaction(
      credentials,
      Transaction.callContract(
          contract: contract, function: ethFunction, parameters: args));
  return result;
}

Future<List<dynamic>> callFunction(String funcname, List<dynamic> args,
    Web3Client ethClient, String privateKey) async {
  // EthPrivateKey credentials = EthPrivateKey.fromHex(privateKey);
  DeployedContract contract = await loadContract();
  final ethFunction = contract.function(funcname);
  final result = await ethClient.call(
  contract: contract, function: ethFunction, params: args);
  return result;
}

Future<String> mintAchievement(String uri, Web3Client ethClient) async {
  var response =
      await sendFunction("mintAchievement", [uri], ethClient, privateKey);
  print("NFT minted successfully!");
  return response;
}

Future<String> getAchievement(String tokenId, Web3Client ethClient) async{
  var response = await sendFunction("getAchievement", [tokenId], ethClient, privateKey);
  print("Get NFT succesfully!");
  return response;
}
