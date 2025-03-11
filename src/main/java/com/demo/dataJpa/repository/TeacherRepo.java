package com.demo.dataJpa.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.demo.dataJpa.entity.Teacher;

public interface TeacherRepo extends JpaRepository<Teacher, Long> {

}
