package com.tekvizion.hcs.service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.springframework.stereotype.Component;

import com.tekvizion.hcs.modal.Breadcrumb;

@Component
public class BreadcrumbService {
	public String oldValue="";
    protected Breadcrumb getDashboardBreadcrumb() {
        final String breadcrumbUrl = "dashboard";
        return new Breadcrumb(breadcrumbUrl, "Dashboard");
    }
 
    public List<Breadcrumb> getDashboardBreadcrumbs() throws IllegalArgumentException {
        final List<Breadcrumb> breadcrumbs = new ArrayList<>();
        breadcrumbs.add(getDashboardBreadcrumb());
        Collections.reverse(breadcrumbs);
        return breadcrumbs;
    }
    protected Breadcrumb getDynamicBreadcrumb(String breadcrumbUrl,String name) {
        //final String breadcrumbUrl = "getsubdashboard?dataCenters=Watertown";
    	String dynamicbreadcrumbUrl = breadcrumbUrl+name;
        return new Breadcrumb(dynamicbreadcrumbUrl, name);
    }
    public List<Breadcrumb> getDynamicBreadcrumbs(List<Breadcrumb> breadcrumbs) throws IllegalArgumentException {
        breadcrumbs.add(getDashboardBreadcrumb());
        Collections.reverse(breadcrumbs);
        return breadcrumbs;
    }

	public String getOldValue() {
		return oldValue;
	}

	public void setOldValue(String oldValue) {
		this.oldValue = oldValue;
	}
    
}
