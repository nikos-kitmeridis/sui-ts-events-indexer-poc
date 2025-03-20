module dummy::dummy;

use std::string::{Self, String};
use sui::event::emit;
public struct Dummy has copy, drop {
    prop1: u64,
}

public struct InitEvent has copy, drop {
    prop1: u64,
    prop2: String,
    prop3: bool,
    prop4: address,
    prop5: vector<u8>,
    prop6: Dummy,
}

public struct TriggerEvent has copy, drop {
    prop1: u64,
    prop2: address,
}

fun init(ctx: &TxContext) {
    let dummy = Dummy {
        prop1: 1,
    };

    let init_event = InitEvent {
        prop1: 1,
        prop2: string::utf8(b"Hello, World!"),
        prop3: true,
        prop4: ctx.sender(),
        prop5: vector[1, 2, 3],
        prop6: dummy,
    };

    emit(init_event);
}

public fun trigger_event(ctx: &TxContext) {
    let trigger_event = TriggerEvent {
        prop1: 2,
        prop2: ctx.sender(),
    };

    emit(trigger_event);
}