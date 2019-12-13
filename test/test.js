const chai = require('chai'); 
const chaiAsPromised = require('chai-as-promised');
chai.use(chaiAsPromised);
const { expect, assert } = chai;

var FPC = artifacts.require("FootballPlayerCard");

contract('Testing ERC721 contract', function(accounts) {

    let token;
    const name = "FootPlayerCardToken";
    const symbol = "FPC";
    const playerCardDefaultPrice = 200;

    const owner = accounts[0];

    it(' Test construct() ', async () => {
        token = await FPC.new(name, symbol)
        expect(await token.symbol()).to.equal(symbol)
        expect(await token.name()).to.equal(name)
    })

    it(' Test mint()', async () => {
        var tx = await token.mint('Ronaldinho', 80, 90, 70, 80, playerCardDefaultPrice, {from: owner})
        expect(tx.receipt.status).to.true;

        let card = await token.playerCards(0);
        expect(card.name).is.string;
        
        assert.isAtLeast(parseInt(card.attackLvl, 10), 0, " has to be >= 0");
        assert.isAtMost(parseInt(card.attackLvl, 10), 100, " has to be <= 100");
        assert.isAtLeast(parseInt(card.middleLvl, 10), 0, " has to be >= 0");
        assert.isAtMost(parseInt(card.middleLvl, 10), 100, " has to be <= 100");
        assert.isAtLeast(parseInt(card.defenseLvl, 10), 0, " has to be >= 0");
        assert.isAtMost(parseInt(card.defenseLvl, 10), 100, " has to be <= 100");
        assert.isAtLeast(parseInt(card.globalLvl, 10), 0, " has to be >= 0");
        assert.isAtMost(parseInt(card.globalLvl, 10), 100, " has to be <= 100");
        
        assert.isAbove(parseInt(card.price, 10), 0, " has to be > 0");
      
        expect(card.exists).is.true;
        
    })

    it(' Test buyPlayerCard()', async () => {
        const tokenId = 0;
        var tx = await token.buyPlayerCard(tokenId, {from : owner, value : playerCardDefaultPrice});
        expect(tx.receipt.status).to.true;
    })

})