import "minimint_bridge_wasm.dart";
// This file initializes the dynamic library and connects it with the stub
// generated by flutter_rust_bridge_codegen.

abstract class MinimintBridge {
  Future<String> address({dynamic hint});

  /// If this returns Some, user has joined a federation. Otherwise they haven't.
  Future<bool> init({required String path, dynamic hint});

  Future<void> joinFederation({required String configUrl, dynamic hint});

  Future<void> leaveFederation({dynamic hint});

  Future<int> balance({dynamic hint});

  Future<String> pegin({required String txid, dynamic hint});

  Future<String> pegout({required String address, dynamic hint});

  Future<String> pay({required String bolt11, dynamic hint});

  Future<MyInvoice> decodeInvoice({required String bolt11, dynamic hint});

  Future<String> invoice({required int amount, dynamic hint});

  Future<void> poll({dynamic hint});
}


class MyInvoice {
  final int? amount;
  final String description;
  final String invoice;

  MyInvoice({
    this.amount,
    required this.description,
    required this.invoice,
  });
}

final MinimintBridge api = MinimintBridgeWasm();
