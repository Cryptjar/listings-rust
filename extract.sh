#!/bin/bash

# This file automatically extracts various type names from the local rust
# sources. (Needs a submoudle `rust` to the official rust repository).

DATA_FILE=std-names.toml

echo "# Name lists extracted from Rust source code" > $DATA_FILE

# Get all public trait definitions
grep 'pub \(unsafe \|\)\(auto \|\)trait [_A-Za-z][_A-Za-z0-9]*' -r rust/library | \
	# Extract the name
	sed 's/^.*pub \(unsafe \|\)\(auto \|\)trait \([_A-Za-z][_A-Za-z0-9]*\).*/\3/g' | \
	# Sort and remove duplicates
	sort -u | \
	# Replace newlines with commas
	tr '\n' ',' | \
	# Add 'traits = ...' framing, and remove trailing comma
	sed 's/^\(.*\),$/traits = "\1"\n/g' | \
	# Add spacing after commas
	sed 's/,/, /g' >> $DATA_FILE

# Get all public struct definitions
grep 'pub struct [_A-Za-z][_A-Za-z0-9]*' -r rust/library | \
	# Extract the name
	sed 's/^.*pub struct \([_A-Za-z][_A-Za-z0-9]*\).*/\1/g' | \
	# Sort and remove duplicates
	sort -u | \
	# Replace newlines with commas
	tr '\n' ',' | \
	# Add 'traits = ...' framing, and remove trailing comma
	sed 's/^\(.*\),$/structs = "\1"\n/g' | \
	# Add spacing after commas
	sed 's/,/, /g' >> $DATA_FILE

# Get all public enum definitions
grep 'pub enum [_A-Za-z][_A-Za-z0-9]*' -r rust/library | \
	# Extract the name
	sed 's/^.*pub enum \([_A-Za-z][_A-Za-z0-9]*\).*/\1/g' | \
	# Sort and remove duplicates
	sort -u | \
	# Replace newlines with commas
	tr '\n' ',' | \
	# Add 'traits = ...' framing, and remove trailing comma
	sed 's/^\(.*\),$/enums = "\1"\n/g' | \
	# Add spacing after commas
	sed 's/,/, /g' >> $DATA_FILE

# Get all public enum definitions
grep 'pub union [_A-Za-z][_A-Za-z0-9]*' -r rust/library | \
	# Extract the name
	sed 's/^.*pub union \([_A-Za-z][_A-Za-z0-9]*\).*/\1/g' | \
	# Sort and remove duplicates
	sort -u | \
	# Replace newlines with commas
	tr '\n' ',' | \
	# Add 'traits = ...' framing, and remove trailing comma
	sed 's/^\(.*\),$/unions = "\1"\n/g' | \
	# Add spacing after commas
	sed 's/,/, /g' >> $DATA_FILE

# Get all public enum definitions
grep 'pub type [_A-Za-z][_A-Za-z0-9]*' -r rust/library | \
	# Extract the name
	sed 's/^.*pub type \([_A-Za-z][_A-Za-z0-9]*\).*/\1/g' | \
	# Sort and remove duplicates
	sort -u | \
	# Replace newlines with commas
	tr '\n' ',' | \
	# Add 'traits = ...' framing, and remove trailing comma
	sed 's/^\(.*\),$/typdefs = "\1"\n/g' | \
	# Add spacing after commas
	sed 's/,/, /g' >> $DATA_FILE

# Get all macro definitions
grep 'macro_rules! [_A-Za-z][_A-Za-z0-9]*' -r rust/library | \
	# Extract the name adding the exclamation mark
	sed 's/^.*macro_rules! \([_A-Za-z][_A-Za-z0-9]*\).*/\1!/g' | \
	# Sort and remove duplicates
	sort -u | \
	# Replace newlines with commas
	tr '\n' ',' | \
	# Add 'traits = ...' framing, and remove trailing comma
	sed 's/^\(.*\),$/macros = "\1"\n/g' | \
	# Add spacing after commas
	sed 's/,/, /g' >> $DATA_FILE



