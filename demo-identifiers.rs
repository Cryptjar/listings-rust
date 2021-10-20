// keywords
as async await break const continue crate dyn else enum extern fn for if impl in let loop
match mod move mut pub ref return Self self static struct super trait type
union unsafe use where while

// Literals
"this is a test" 'a' 'b' 'c' 123 0xf00d 1_000u32

// primitive types
bool char f32 f64 i8 i16 i32 i64 isize never str u8 u16 u32 u64 unit usize i128
u128

// some common type and value constructors
Box Option Result String Vec Some None Ok Err true false

// some common traits
Copy Send Sized Sync Drop Fn FnMut FnOnce ToOwned Clone PartialEq PartialOrd
Eq Ord AsRef AsMut Into From Default Iterator Extend IntoIterator
DoubleEndedIterator ExactSizeIterator ToString

// some common macros
assert! assert_eq! assert_ne! cfg! column! compile_error! concat!
concat_idents! debug_assert! debug_assert_eq! debug_assert_ne! env! eprint!
eprintln! file! format! format_args! include! include_bytes! include_str!
line! module_path! option_env! panic! print! println! stringify!
thread_local! unimplemented! unreachable! vec! write! writeln!

// some other types
Cow MaybeUninit Root Infallible bool_t Ordering Poll SocketAddr Backtrace TryFrom
