const { expect } = require("chai");
const { ethers } = require("hardhat");

const TOKEN_URI =
  "https://recruitnft.s3.us-east-2.amazonaws.com/assets/recruit.json";

describe("RecruitNFT", function () {
  it("Should deploy RecruitNFT contract", async function () {
    const RecruitNFT = await ethers.getContractFactory("RecruitNFT");
    const recruitNFT = await RecruitNFT.deploy();

    expect(await recruitNFT.name()).to.equal("RecruitNFT");
  });

  it("Should mint and read an NFT", async function () {
    const RecruitNFT = await ethers.getContractFactory("RecruitNFT");
    const recruitNFT = await RecruitNFT.deploy();

    await recruitNFT.mint();

    expect(await recruitNFT.tokenURI(0)).to.equal(TOKEN_URI);
    expect(await recruitNFT.tokenURI(1)).to.be.empty;
  });
});
