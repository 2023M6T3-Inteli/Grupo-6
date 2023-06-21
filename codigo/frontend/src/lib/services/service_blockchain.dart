import 'dart:async';
import 'package:flutter/services.dart' show rootBundle;
import 'package:web3dart/web3dart.dart';
import '../constants.dart';
import 'package:http/http.dart';
import 'package:flutter/widgets.dart'; // Importe a biblioteca widgets.dart
import 'package:flutter_web3/flutter_web3.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Garanta que o Flutter esteja inicializado

  final provider = Web3Provider(Web3ProviderType.web3dart);
  final isConnected = await provider.connect(Web3ProviderType.metamask);
  Web3Client? ethClient;
  Client? httpClient;

  httpClient = Client();
  ethClient = Web3Client(infuraApiKey, httpClient);

  if (isConnected) {
    final ethClient = provider.eth;
    final contract = await loadContract();

    await mintAchievement(
      "https://ipfs.io/ipfs/QmNzEAMzJfk63bMUseoN4RZZfkrA3iARN3mre3WTqWgVuK",
      ethClient,
    );
  } else {
    print("Falha na conexão com o MetaMask");
  }

  // Web3Client? ethClient;
  // Client? httpClient;
  // httpClient = Client();
  // ethClient = Web3Client(infuraApiKey, httpClient);
  // mintAchievement(
  //     "https://ipfs.io/ipfs/QmNzEAMzJfk63bMUseoN4RZZfkrA3iARN3mre3WTqWgVuK",
  //     ethClient);
}

Future<DeployedContract> loadContract() async {
  // String path = "codigo/frontend/src/assets/blockchain/abi.json";
  String path = "../../assets/blockchain/abi.json";
  String abi = await rootBundle.loadString(path);
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
  // if (ethClient == null) {
  //   return "EthClient is null";
  // }
  var response =
      await sendFunction("mintAchievement", [uri], ethClient, privateKey);
  print("NFT minted successfully!");
  return response;
}

Future<String> getAchievement(String tokenId, Web3Client ethClient) async {
  var response =
      await sendFunction("getAchievement", [tokenId], ethClient, privateKey);
  print("Get NFT succesfully!");
  return response;
}

// class MyApp extends StatelessWidget {
//   final Web3Client ethClient;

//   MyApp(this.ethClient);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       // Resto do código do seu aplicativo
//     );
//   }
// }