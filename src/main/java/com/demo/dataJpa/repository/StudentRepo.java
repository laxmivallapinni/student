package com.demo.dataJpa.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.demo.dataJpa.entity.Student;

public interface StudentRepo extends JpaRepository<Student, Long> {

}
