package com.demo.dataJpa.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.demo.dataJpa.entity.Teacher;
import com.demo.dataJpa.repository.TeacherRepo;

@RestController
public class TeacherController {
	
	
    @Autowired
	TeacherRepo teacherRepo;

	@PostMapping("/api/addteachers")
	public ResponseEntity<Teacher>saveTeacher(@RequestBody Teacher teacher){
		return new ResponseEntity<>(teacherRepo.save(teacher), HttpStatus.CREATED);
	}
	
	@GetMapping("/api/getteachers")
	public ResponseEntity<Teacher>getTeachers(@RequestBody Teacher teacher){
		return new ResponseEntity<>(teacherRepo.save(teacher), HttpStatus.OK);
	}
	
	@PutMapping("/api/updateteacher")
	public ResponseEntity<Teacher>updateteacher(@RequestBody Teacher teacher){
		return new ResponseEntity<>(teacherRepo.save(teacher), HttpStatus.OK);
	}
	
    @DeleteMapping("/api/deleteteacher")
    public ResponseEntity<Teacher>deleteteacher(@RequestBody Teacher teacher){
    	return null;
    }
}
