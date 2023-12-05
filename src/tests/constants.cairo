use openzeppelin::token::erc20::dual20::DualCaseERC20;

mod VALID {
}

mod INVALID {
}

// addresses

fn OWNER() -> starknet::ContractAddress {
  starknet::contract_address_const::<'OWNER'>()
}

fn ZERO() -> starknet::ContractAddress {
  starknet::contract_address_const::<0>()
}

fn SIGNER() -> starknet::ContractAddress {
  starknet::contract_address_const::<1>()
}

fn SIGNER_3() -> starknet::ContractAddress {
  starknet::contract_address_const::<3>()
}

// contracts

fn ETHER(contract_address: starknet::ContractAddress) -> DualCaseERC20 {
  DualCaseERC20 { contract_address }
}

fn ETHER_1() -> DualCaseERC20 {
  ETHER(starknet::contract_address_const::<1>())
}

fn ETHER_2() -> DualCaseERC20 {
  ETHER(starknet::contract_address_const::<2>())
}

// misc

// private key = 4321
const SIGNER_PUBLIC_KEY: felt252 = 0x1766831fbcbc258a953dd0c0505ecbcd28086c673355c7a219bc031b710b0d6;

// private key = 1234
const SIGNER_3_PUBLIC_KEY: felt252 = 0x1f3c942d7f492a37608cde0d77b884a5aa9e11d2919225968557370ddb5a5aa;
