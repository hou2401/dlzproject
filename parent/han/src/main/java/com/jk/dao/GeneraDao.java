package com.jk.dao;

import com.jk.pojo.Genera;

import java.util.List;

public interface GeneraDao {
    List queryGenera();

    void addGenera(Genera genera);
}
