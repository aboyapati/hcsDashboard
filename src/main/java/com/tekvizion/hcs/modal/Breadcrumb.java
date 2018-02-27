package com.tekvizion.hcs.modal;

public class Breadcrumb {

    private String url;
    private String name;

    public Breadcrumb(final String url, final String name)
    {
        this.url = url;
        this.name = name;
    }

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
    
}
