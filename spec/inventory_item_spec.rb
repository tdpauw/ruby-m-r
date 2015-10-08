require 'spec_helper'
require 'securerandom'
require 'simplecqrs/inventory_item'


describe SimpleCQRS::InventoryItem do
  it 'creates an inventory item' do
    inventoryId = SecureRandom.uuid
    inventoryItemName = "anInventoryItem"
    sut = SimpleCQRS::InventoryItem.new(inventoryId, inventoryItemName)

    events = sut.uncommittedChanges()
    expect(events).to match_array([SimpleCQRS::InventoryItemCreated.new(inventoryId, inventoryItemName)])
  end
end
