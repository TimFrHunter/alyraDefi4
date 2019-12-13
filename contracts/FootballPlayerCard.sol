pragma solidity ^0.5.11;

import "./dependences/ERC721.sol"; //version 2.3.0 recuperer depuis le github officiel de openzepplin


/**
 * @title  FootballPlayerCard with ERC721 Non-Fungible Token Standard
 *
 */
contract FootballPlayerCard is ERC721 {
    string public  name;
    string public  symbol;
    address payable public owner;

    struct PlayerCard {
        string name;
        uint attackLvl;
        uint middleLvl;
        uint defenseLvl;
        uint globalLvl;
        uint price;
        bool exists;
    }

    PlayerCard[] public playerCards;

    modifier onlyOwner {
        require(msg.sender == owner,"Vous n'avez pas les droits d'accès");
        _;
    }

    /**
     * @dev init token name and token symbol
     * init also the owner contrat
     * @param _name string token name
     * @param _symbol string token symbol
     */
    constructor (string memory _name, string memory _symbol) public {
        name = _name;
        symbol = _symbol;
        owner = msg.sender;
    }

    /**
     * @dev create new FootballPlayerCard by owner and then add this card/token to owner addr
     * the lvls don't have to exceed 100
     * @param _name string Player's name
     * @param _attackLvl uint
     * @param _middleLvl uint
     * @param _defenseLvl uint
     * @param _globalLvl uint
     * @param _price uint price to buy the card/token from the owner
     */
    function mint(string memory _name, uint _attackLvl, uint _middleLvl, uint _defenseLvl, uint _globalLvl, uint _price) public onlyOwner {
        PlayerCard memory _playerCard = PlayerCard(_name, _attackLvl, _middleLvl, _defenseLvl, _globalLvl, _price, true);
        playerCards.push(_playerCard);
        _mint(owner, playerCards.length - 1); //addr & Array Index of the fresh playerCard
    }

    /**
     * @dev buy and transfer playerCard/token from the owner,
     * be sure that the owner add the buyer address to the approval() function before
     * and that the price is not failing
     * The sended ether are transfer to the contrat owner
     * It's a payable function declared as an external visibility
     * @param _playerCardToken uint index Of the token/card you wanna buy
     */
    function buyPlayerCard(uint _playerCardToken) external payable {
        require(playerCards[_playerCardToken].exists,"Cette carte n'existe pas");
        require(playerCards[_playerCardToken].price == msg.value,"Le prix n'est pas correct");
        safeTransferFrom(owner, msg.sender, _playerCardToken);
        contractWithdraw();
    }

    /**
     * @dev Use to get ether of the contrat when client buy a token/card
     */
    function contractWithdraw() private {
        owner.transfer(address(this).balance);
    }

}