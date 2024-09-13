# EncryptDataLibrary

This is a simple encryption library for Roblox, implemented in Lua. It provides functions to encrypt and decrypt data using a fixed key. The encryption method used is XOR-based with a simple hashing function to generate a key from a string.

## Features

- **Fixed Key Encryption**: The library uses a fixed key for both encryption and decryption.
- **XOR-Based Encryption**: A lightweight XOR encryption method is used, making it suitable for simple use cases within Roblox.

## Installation

To use this library in your Roblox project, follow these steps:

1. Copy the `EncryptDataLibrary` script into your Roblox project.
2. Require the `EncryptDataLibrary` in any script where you want to use encryption or decryption.

   **The .rbxl file is attached to the repository**

## Usage

### 1. Encrypting Data

To encrypt data, use the `encryptData` function:

```lua
local EncryptDataLibrary = require(path.to.EncryptDataLibrary)

local originalData = "SensitiveData123"
local encryptedData = EncryptDataLibrary:encryptData(originalData)
print("Encrypted Data: " .. encryptedData) 
```

### 2. Decrypting Data

To decrypt data, use the `decryptData function:`

```lua

local decryptedData = EncryptDataLibrary:decryptData(encryptedData)
print("Decrypted Data: " .. decryptedData)
```
# Example
Here is a complete example of `encrypting` and `decrypting` data:

```lua

local EncryptDataLibrary = require(path.to.EncryptDataLibrary)

local originalData = "SensitiveData123"

-- Encrypt the data
local encryptedData = EncryptDataLibrary:encryptData(originalData)
print("Encrypted Data: " .. encryptedData)

-- Decrypt the data
local decryptedData = EncryptDataLibrary:decryptData(encryptedData)
print("Decrypted Data: " .. decryptedData)
```

### Security Considerations
`Fixed Key:` The library uses a hardcoded fixed key (FixedSecretKey123) for encryption and decryption. This key should be kept secret to prevent unauthorized access to your data.
`Obfuscation:` While this library provides basic encryption, it is not suitable for highly sensitive data. For better security, consider more advanced encryption techniques and key management strategies.
Contributing
If you would like to contribute to this project, feel free to fork the repository and submit a pull request with your changes.

### License
This project is licensed under the MIT License. See the LICENSE file for more details.
