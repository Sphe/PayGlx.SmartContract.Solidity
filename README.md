# GlobCoin Smart Contract

Stable Coin


#### Installation & Usage

```
npm install
truffle compile
truffle migrate

truffle console -network ropsten
```


#### Ropsten deploy

```

KeyValueStorage => 0xe1fd3f9b316fe5a41740e957b1413f806f432bc8
StorageLib => 0x9a47eb6d849af4024e6ebdef62a90b43b6039c88
BasicTokenLib => 0x7e3fb43686abdac9d2b42e9b54aa37cedd567261
StandardTokenLib => 0x4f347f81b2b4c59d77f93b845b2c8e5150741e07
WhitelistingTokenLib => 0xc1547fb24c82ff286570e245558cd1d7c1b959de
PausableTokenDelegate => 0x429218b950007d38a24ed383f1617435c50abd57
GlobCoinToken => 0xc254f787365adb2a486de155a5ab2dc2ea88c75e


require("lodash")
var glx = _.extend(GlobCoinToken.at("0xc254f787365adb2a486de155a5ab2dc2ea88c75e"), PausableTokenDelegate.at("0xc254f787365adb2a486de155a5ab2dc2ea88c75e"))
glx.whitelist("0x80CEE7Be679172B18Fc97738FbF4D3b53deCce3C")
glx.mint("0x80CEE7Be679172B18Fc97738FbF4D3b53deCce3C", 1000000)

```


