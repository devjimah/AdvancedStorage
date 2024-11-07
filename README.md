The SimpleStorage contract is a Solidity smart contract that demonstrates the use of various Solidity features, including mappings, events, and data locations (storage, memory, and calldata).
Key changes:
Mappings:
Added a mapping called nameToFavoriteNumber to store the association between names and favorite numbers.
Modified the addPerson function to store the name-favorite number association in the mapping.
Events:
Added a new event called NumberUpdated that logs the old and new favorite number values when the storeNumber function is called.
Emitted the NumberUpdated event in the storeNumber function.
Data Locations:
The favorite number is stored in a storage variable favoriteNumber.
The calculateWithMemory function uses a memory variable localFavoriteNumber to perform calculations.
The processCalldata function takes a calldata string parameter and processes it without modifying the input.
