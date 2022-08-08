@JS()
library web;

import "package:js/js.dart";
import "package:js/js_util.dart" show promiseToFuture;

@JS()
class WasmBridge {
  // @Ignore
  external get client;
  external set client(v);
  external get db;
  external set db(v);
  external String decodeInvoice(String invoice);
}

@JS("WasmBridge")
abstract class _WasmBridge {
  external Promise<bool> init();
  external Promise<void> joinFederation(String configUrl);
  external Promise<void> leaveFederation();
  external Promise<num> balance();
  external Promise<String> invoice(num amount);
  external Promise<String> pay(String bolt11);
}

extension WasmBridgeExtensions on WasmBridge {
  Future<bool> init() {
    final Object t = this;
    final _WasmBridge tt = t as _WasmBridge;
    return promiseToFuture(tt.init());
  }

  Future<void> joinFederation(String configUrl) {
    final Object t = this;
    final _WasmBridge tt = t as _WasmBridge;
    return promiseToFuture(tt.joinFederation(configUrl));
  }

  Future<void> leaveFederation() {
    final Object t = this;
    final _WasmBridge tt = t as _WasmBridge;
    return promiseToFuture(tt.leaveFederation());
  }

  Future<num> balance() {
    final Object t = this;
    final _WasmBridge tt = t as _WasmBridge;
    return promiseToFuture(tt.balance());
  }

  Future<String> invoice(num amount) {
    final Object t = this;
    final _WasmBridge tt = t as _WasmBridge;
    return promiseToFuture(tt.invoice(amount));
  }

  Future<String> pay(String bolt11) {
    final Object t = this;
    final _WasmBridge tt = t as _WasmBridge;
    return promiseToFuture(tt.pay(bolt11));
  }
}

@JS()
external WasmBridge get wasmBridge;

@JS()
abstract class Promise<T> {
  external factory Promise(
      void executor(void resolve(T result), Function reject));
  external Promise then(void onFulfilled(T result), [Function onRejected]);
}
