import init, { UserClient } from "./pkg/minimint_wasm.js"

// start loading wasm as soon as possible
const wasmPromise = init();

function setGlobals() {
  /** @type {UserClient | null} */
  let client = null;
  window.minimintJoinFederation = function(cfg) {
    cfg = JSON.parse(cfg);
    client = new UserClient(cfg.client);
  }

  window.minimintBalance = function() {
    if (client === null) {
      console.warn("Join federation before querying balance");
      return 0;
    }
    return client.balance();
  }
  console.log("globals set")
}

async function load() {
  // Download main.dart.js
  console.log("loading")
  const appRunnerPromise = _flutter.loader.loadEntrypoint({
    serviceWorker: {
      serviceWorkerVersion: serviceWorkerVersion,
    }
  }).then(engineInitializer =>
    engineInitializer.initializeEngine()
  );
  const [appRunner, _] = await Promise.all([appRunnerPromise, wasmPromise]);
  console.log(appRunner);
  setGlobals();


  await appRunner.runApp();
}

window.addEventListener('load', load);
