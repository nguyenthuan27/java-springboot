package com.assignment.Entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
public class Reporttype implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id 
	private String name;
	private Date createDate;
	private Long countquantitys;
	private Double countprices;
}