async function main() {
  console.log("Hi");
  let variable = 5;
  console.log(variable);
}
// solidity is synchronous
// javascript is asynchronous

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
