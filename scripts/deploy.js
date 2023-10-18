async function main() {
  // Grab the contract factory
  var RecruitNFT = await ethers.getContractFactory("RecruitNFT");

  // Start deployment, returning a promise that resolves to a contract object
  const recruitNFT = await RecruitNFT.deploy(); // Instance of the contract
  console.log("Contract deployed to address:", recruitNFT.target);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
