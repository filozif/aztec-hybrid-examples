# Private Voting Contract

Minimal hybrid state example demonstrating a private voting flow.

- **cast_vote (private)**: Accepts a candidate ID, hides voter identity.
- **_add_vote (internal public)**: Updates the global tally securely.
- **get_votes (public view)**: Allows public verification of results.

Focused on the private -> public state transition pattern.
