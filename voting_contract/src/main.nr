use dep::aztec::macros::aztec;

#[aztec]
pub contract VotingContract {
    use dep::aztec::macros::functions::{public, private, view, initializer, internal};
    use dep::aztec::macros::storage::storage;
    use dep::aztec::state_vars::map::Map;
    use dep::aztec::state_vars::public_mutable::PublicMutable;
    use dep::aztec::protocol_types::abis::function_selector::FunctionSelector;

    #[storage]
    struct Storage<Context> {
        vote_counts: Map<Field, PublicMutable<Field, Context>, Context>,
    }

    #[public]
    #[initializer]
    fn constructor() {
        // Init
    }

    #[private]
    fn cast_vote(candidate_id: Field) {
        let selector = FunctionSelector::from_signature("_add_vote(Field)");
        context.call_public_function(
            context.this_address(),
            selector,
            [candidate_id]
        );
    }

    #[public]
    #[internal]
    fn _add_vote(candidate_id: Field) {
        let current = storage.vote_counts.at(candidate_id).read();
        storage.vote_counts.at(candidate_id).write(current + 1);
    }

    #[public]
    #[view]
    fn get_votes(candidate_id: Field) -> pub Field {
        storage.vote_counts.at(candidate_id).read()
    }
}
