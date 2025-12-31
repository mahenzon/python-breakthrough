create table articles_tags_association (
    article_id uuid not null
        references articles(id)
        on delete cascade,
    tag_id uuid not null
        references tags(id)
        on delete cascade,
    primary key (article_id, tag_id)
);
