package com.home.tools;

public class ViewPost {

    private Long id;

    private String title;

    private String text;

    private String author;

    private boolean change;


    public ViewPost(Long id, String title, String text, String author, boolean change) {
        this.id = id;
        this.title = title;
        this.text = text;
        this.author = author;
        this.change = change;
    }

    public Long getId() {
        return id;
    }

    public String getTitle() {
        return title;
    }

    public String getText() {
        return text;
    }

    public String getAuthor() {
        return author;
    }

    public boolean isChange() {
        return change;
    }
}
