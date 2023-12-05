use array::{ ArrayTrait, SpanSerde };

//
// Interfaces
//

#[starknet::interface]
trait IFactory<TState> {
  fn compute_address(
    self: @TState,
    salt: felt252,
    public_key: felt252,
    master_account: starknet::ContractAddress,
  ) -> starknet::ContractAddress;

  fn deploy(
    ref self: TState,
    salt: felt252,
    public_key: felt252,
    master_account: starknet::ContractAddress
  ) -> starknet::ContractAddress;
}

//
// ABI
//

#[starknet::interface]
trait RewardsABI<TState> {
  // IFactory
  fn compute_address(
    self: @TState,
    salt: felt252,
    public_key: felt252,
    master_account: starknet::ContractAddress,
  ) -> starknet::ContractAddress;

  fn deploy(
    ref self: TState,
    salt: felt252,
    public_key: felt252,
    master_account: starknet::ContractAddress
  ) -> starknet::ContractAddress;

  // Upgradeable
  fn upgrade(ref self: TState, new_class_hash: starknet::ClassHash);

  // Ownable
  fn owner(self: @TState) -> starknet::ContractAddress;

  fn transfer_ownership(ref self: TState, new_owner: starknet::ContractAddress);
  fn renounce_ownership(ref self: TState);
}