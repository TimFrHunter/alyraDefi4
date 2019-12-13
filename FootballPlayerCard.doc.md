# FootballPlayerCard
## FootballPlayerCard with ERC721 Non-Fungible Token Standard  


## name - view
_No parameters_
Return : the token name

## buyPlayerCard - read
|name |type |description
|-----|-----|-----------
|_playerCardToken|uint256|uint index Of the token/card you wanna buy
buy and transfer playerCard/token from the owner, be sure that the owner add the buyer address to the approval() function before and that the price is not failing The sended ether are transfer to the contrat owner It's a payable function declared as an external visibility

## playerCards - view
|name |type |description
|-----|-----|-----------
||uint256|uint set the tokenIndex
Return : The card details 

## ownerOf - view
|name |type |description
|-----|-----|-----------
|tokenId|uint256|uint256 ID of the token to query the owner of
Gets the owner of the specified token ID.
Return : address currently marked as the owner of the given token ID

## balanceOf - view
|name |type |description
|-----|-----|-----------
|owner|address|address to query the balance of
Gets the balance of the specified address.
Return : uint256 representing the amount owned by the passed address

## owner - view
_No parameters_
Gets the owner of the specified token ID.
Return : address currently marked as the owner of the given token ID

## symbol - view
_No parameters_
Return : Token symbol 

## constructor - read
|name |type |description
|-----|-----|-----------
|_name|string|string token name
|_symbol|string|string token symbol
init token name and token symbol init also the owner contrat
function Object() { [native code] }

## mint - read
|name |type |description
|-----|-----|-----------
|_name|string|string Player's name
|_attackLvl|uint256|uint 
|_middleLvl|uint256|uint
|_defenseLvl|uint256|uint
|_globalLvl|uint256|uint
|_price|uint256|uint price to buy the card/token from the owner
create new FootballPlayerCard by owner and then add this card/token to owner addr the lvls don't have to exceed 100

## getApproved - view
|name |type |description
|-----|-----|-----------
|tokenId|uint256|uint256 ID of the token to query the approval of
Gets the approved address for a token ID, or zero if no address set Reverts if the token ID does not exist.
Return : address currently approved for the given token ID

## approve - read
|name |type |description
|-----|-----|-----------
|to|address|address to be approved for the given token ID
|tokenId|uint256|uint256 ID of the token to be approved
Approves another address to transfer the given token ID The zero address indicates there is no approved address. There can only be one approved address per token at a given time. Can only be called by the token owner or an approved operator.

## transferFrom - read
|name |type |description
|-----|-----|-----------
|from|address|current owner of the token
|to|address|address to receive the ownership of the given token ID
|tokenId|uint256|uint256 ID of the token to be transferred
Transfers the ownership of a given token ID to another address. Usage of this method is discouraged, use `safeTransferFrom` whenever possible. Requires the msg.sender to be the owner, approved, or operator.

## safeTransferFrom - read
|name |type |description
|-----|-----|-----------
|from|address|current owner of the token
|to|address|address to receive the ownership of the given token ID
|tokenId|uint256|uint256 ID of the token to be transferred
Safely transfers the ownership of a given token ID to another address If the target address is a contract, it must implement `onERC721Received`, which is called upon a safe transfer, and return the magic value `bytes4(keccak256("onERC721Received(address,address,uint256,bytes)"))`; otherwise, the transfer is reverted. Requires the msg.sender to be the owner, approved, or operator

## setApprovalForAll - read
|name |type |description
|-----|-----|-----------
|to|address|operator address to set the approval
|approved|bool|representing the status of the approval to be set
Sets or unsets the approval of a given operator An operator is allowed to transfer all tokens of the sender on their behalf.

## safeTransferFrom - read
|name |type |description
|-----|-----|-----------
|from|address|current owner of the token
|to|address|address to receive the ownership of the given token ID
|tokenId|uint256|uint256 ID of the token to be transferred
|_data|bytes|
Safely transfers the ownership of a given token ID to another address If the target address is a contract, it must implement `onERC721Received`, which is called upon a safe transfer, and return the magic value `bytes4(keccak256("onERC721Received(address,address,uint256,bytes)"))`; otherwise, the transfer is reverted. Requires the msg.sender to be the owner, approved, or operator

## isApprovedForAll - view
|name |type |description
|-----|-----|-----------
|owner|address|owner address which you want to query the approval of
|operator|address|operator address which you want to query the approval of
Tells whether an operator is approved by a given owner.
Return : bool whether the given operator is approved by the given owner

## Transfer - read
|name |type |description
|-----|-----|-----------
|from|address|current owner of the token
|to|address|address to receive the ownership of the given token ID
|tokenId|uint256|uint256 ID of the token to be transferred
Safely transfers the ownership of a given token ID to another address If the target address is a contract, it must implement `onERC721Received`, which is called upon a safe transfer, and return the magic value `bytes4(keccak256("onERC721Received(address,address,uint256,bytes)"))`; otherwise, the transfer is reverted. Requires the msg.sender to be the owner, approved, or operator

## Approval - read
|name |type |description
|-----|-----|-----------
|owner|address|
|approved|address|representing the status of the approval to be set
|tokenId|uint256|
Sets or unsets the approval of a given operator An operator is allowed to transfer all tokens of the sender on their behalf.

## ApprovalForAll - read
|name |type |description
|-----|-----|-----------
|owner|address|
|operator|address|
|approved|bool|representing the status of the approval to be set
Sets or unsets the approval of a given operator An operator is allowed to transfer all tokens of the sender on their behalf.

## supportsInterface - view
|name |type |description
|-----|-----|-----------
|interfaceId|bytes4|
See `IERC165.supportsInterface`.     * Time complexity O(1), guaranteed to always use less than 30 000 gas.
