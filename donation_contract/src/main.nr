use dep::aztec::macros::aztec;

#[aztec]
pub contract DonationContract {
    // must be inside contract scope
    use dep::aztec::macros::functions::{public, private, view, initializer, internal};
    use dep::aztec::macros::storage::storage;
    use dep::aztec::state_vars::public_mutable::PublicMutable;
    use dep::aztec::protocol_types::abis::function_selector::FunctionSelector;

    #[storage]
    struct Storage<Context> {
        total_donations: PublicMutable<Field, Context>,
    }

    #[public]
    #[initializer]
    fn constructor() {
        storage.total_donations.write(0);
    }

    // PRIVATE: caller identity stays private, triggers a public update
    #[private]
    fn donate_private(amount: Field) {
        let selector = FunctionSelector::from_signature("_increment_total(Field)");
        context.call_public_function(
            context.this_address(),
            selector,
            [amount]
        );
    }

    // PUBLIC: amount is visible (transparent donation)
    #[public]
    fn donate_public(amount: Field) {
        let current = storage.total_donations.read();
        storage.total_donations.write(current + amount);
    }

    // INTERNAL PUBLIC: called from private via call_public_function
    #[public]
    #[internal]
    fn _increment_total(amount: Field) {
        let current = storage.total_donations.read();
        storage.total_donations.write(current + amount);
    }

    #[public]
    #[view]
    fn get_total_donations() -> pub Field {
        storage.total_donations.read()
    }
}
