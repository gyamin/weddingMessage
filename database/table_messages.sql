-- messages
drop table messages;

create table messages (
    id      integer primary key autoincrement not null,
    name    text    not null,
    kana    text,
    hash    text,
    message text,
    UNIQUE(hash)
);
