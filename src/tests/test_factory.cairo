use debug::PrintTrait;

// locals
use arcade_factory::factory::contract::ArcadeFactory;

use arcade_factory::factory::interface::{ ArcadeFactoryABIDispatcher, ArcadeFactoryABIDispatcherTrait };

use super::mocks::arcade_account_mock::{
  ArcadeAccountMock,
  ArcadeAccountMockABIDispatcher,
  ArcadeAccountMockABIDispatcherTrait,
};

use super::utils;
use super::constants;

//
// Setup
//

fn setup() -> ArcadeFactoryABIDispatcher {
  let owner = constants::OWNER();

  let factory_contract_address = utils::deploy(
    contract_class_hash: ArcadeFactory::TEST_CLASS_HASH,
    calldata: array![owner.into(), ArcadeAccountMock::TEST_CLASS_HASH]
  );

  ArcadeFactoryABIDispatcher { contract_address: factory_contract_address }
}

//
// Tests
//

#[test]
#[available_gas(20000000)]
fn test_deploy() {
  let factory = setup();

  // deploy
  let arcade_account_address = factory.deploy(
    salt: constants::SALT,
    public_key: constants::PUBLIC_KEY,
    master_account: constants::MASTER()
  );

  let arcade_account = ArcadeAccountMockABIDispatcher { contract_address: arcade_account_address };

  assert(arcade_account.public_key() == constants::PUBLIC_KEY, 'Invalid public key');
  assert(arcade_account.master_account() == constants::MASTER(), 'Invalid master account');
}

#[test]
#[available_gas(20000000)]
fn test_test() {
  let factory = setup();

  let addr = factory.compute_address(
    salt: 42,
    public_key: 0x1f3c942d7f492a37608cde0d77b884a5aa9e11d2919225968557370ddb5a5aa,
    master_account: starknet::contract_address_const::<0x067efd64D87F476EAD4c5F55b68E6E82E33bEceeB4715F1F154c4986E005Ce82>()
  );

  addr.print();
}
