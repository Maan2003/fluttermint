import "package:js/js.dart";

import "ffi.dart";

@JS()
external void minimintJoinFederation(String cfg);

@JS()
external int minimintBalance();

class MinimintBridgeWasm implements MinimintBridge {
  @override
  Future<String> address({hint}) {
    // TODO: implement address
    throw UnimplementedError();
  }

  @override
  Future<int> balance({hint}) async {
    return minimintBalance();
  }

  @override
  Future<MyInvoice> decodeInvoice({required String bolt11, hint}) {
    // TODO: implement decodeInvoice
    throw UnimplementedError();
  }

  @override
  Future<bool> init({required String path, hint}) async {
    return true;
  }

  @override
  Future<String> invoice({required int amount, hint}) {
    // TODO: implement invoice
    throw UnimplementedError();
  }

  @override
  Future<void> joinFederation({required String configUrl, hint}) async {
    minimintJoinFederation(configUrl);
  }

  @override
  Future<void> leaveFederation({hint}) {
    // TODO: implement leaveFederation
    throw UnimplementedError();
  }

  @override
  Future<String> pay({required String bolt11, hint}) {
    // TODO: implement pay
    throw UnimplementedError();
  }

  @override
  Future<String> pegin({required String txid, hint}) {
    // TODO: implement pegin
    throw UnimplementedError();
  }

  @override
  Future<String> pegout({required String address, hint}) {
    // TODO: implement pegout
    throw UnimplementedError();
  }

  @override
  Future<void> poll({hint}) {
    // TODO: implement poll
    throw UnimplementedError();
  }
}
