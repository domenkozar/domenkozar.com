---
categories: ["english", "rust", "c", "memory safety"]
author: Domen Kožar
date: 2026-08-13 09:00:00
title: 'I want extern "fil-c"'
draft: false
slug: i-want-extern-fil-c
description: "Compile legacy C with Fil-C, call it safely from Rust, and make runtime checks the tax for not migrating the hot path."
---

Rust's C FFI gives us access to decades of useful software, but the bargain is
backwards.

We use Rust to prove memory safety at compile time. Then we cross an `unsafe`
boundary and trust the C library to respect a contract that neither language
can enforce. The legacy code remains the cheap path, while rewriting it is the
expensive one.

[Fil-C](https://fil-c.org/) offers a more interesting bargain. It recompiles C
and C++ with capabilities, runtime checks, and a concurrent garbage collector.
Memory-safety violations panic instead of becoming exploits. Existing software
often needs few or no source changes, but it pays for safety at runtime.

I want a Rust FFI that speaks the Fil-C ABI.

The first version could be deliberately narrow: scalar values, copied strings
and slices, and opaque handles. It would generate safe Rust wrappers, compile
the complete C dependency graph with Fil-C, and provide no escape hatch back to
ordinary unsafe C. Shared memory could come later, once the bridge can give
Fil-C a capability that Rust can reliably revoke.

This is not a new option for `bindgen`. Fil-C is
[source-compatible with C but intentionally not ABI-compatible](https://fil-c.org/runtime),
and ordinary Rust `extern "C"` speaks the ABI Fil-C calls Yolo-C. Building the
bridge means teaching Rust, Fil-C, or a pair of generated stubs how to exchange
values without losing Fil-C's guarantees. If it were easy, it would already
exist.

One important part of this stack is already taking shape. [filnix](https://github.com/mbrock/filnix)
packages Fil-C as a Nix cross-compilation platform and has ports for more than
100 nixpkgs packages. Treating Fil-C as a platform means Nix rebuilds the
transitive dependency closure for the Fil-C ABI instead of accidentally
linking ordinary C into it. filnix is not the Rust bridge yet, but it provides
the reproducible toolchain, package universe, and test bed where one could be
built.

Zig is approaching the same problem from another direction. Andrew Kelley has
[proposed an optional `fil` ABI](https://codeberg.org/ziglang/zig/issues/36237)
inspired by Fil-C. It would be an independent implementation in the Zig
compiler and standard library, intended to compile a Zig program and its entire
C and C++ dependency tree with runtime memory safety. That is remarkably close
to the world a Rust bridge would need to enter.

But the result would give us exactly the right incentives.

We could use Rust for compile-time safety and then pay a performance penalty
for using C.

Keep the legacy library and it remains memory-safe, but every pointer operation
is checked and its memory participates in garbage collection. Rewrite the hot
path in Rust and those checks become static, so the tax disappears. C becomes
the safe compatibility path rather than the permanent fast path.

"100% safe" here means memory-safe across the whole supported boundary, not
free of logic bugs, deadlocks, or bad APIs. That boundary is the hard part.
Fil-C currently requires
[the whole program and its dependencies to use its ABI](https://fil-c.org/runtime).
The project also treats interoperability with ordinary C as a non-goal. A Rust
bridge would have to preserve that whole-world guarantee rather than quietly
punching a Yolo-shaped hole through it.

I want `extern "fil-c"`: Rust on the fast path, old C on the safe path, and a
performance reason to finish the migration.

I would also like to see cross-ecosystem collaboration instead of several
almost-compatible islands. Fil-C has the capability model and working runtime.
Rust has compile-time safety. Zig is exploring a Fil-C-inspired ABI. Nix and
filnix can rebuild and test complete dependency graphs. This problem deserves
the best minds from all four communities in the same room.

So here is the invitation: join us at [OceanSprint](https://oceansprint.org/)
next year in Lanzarote and build it together. Mikael Brockman, who is building
filnix, has already accepted.

Who else is joining us?
