package com.home.tools;

public class ViewPost {

    private Long id;

    private String title;

    private String text;

    private String author;

    private String deleteLink;

    private String updateLink;

    public ViewPost(Long id, String title, String text, String author, String deleteLink, String updateLink) {
        this.id = id;
        this.title = title;
        this.text = text;
        this.author = author;
        this.deleteLink = deleteLink;
        this.updateLink = updateLink;
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

    public String getDeleteLink() {
        return deleteLink;
    }

    public String getUpdateLink() {
        return updateLink;
    }
}
