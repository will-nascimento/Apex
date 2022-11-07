public class UniversityClass {
	 public List<Student> studentList = new List<Student>();
        public Graduation graduation;

        public List<Student> findByLastName(String searchText) {
            List<Student> filteredList = new List<Student>();

            for (Student student : this.studentList) {
                if (student.lastName.toLowerCase().contains(searchText.toLowerCase())) {
                    filteredList.add(student);                    
                }                
            }

            return filteredList;
        }

        public List<Student> filterByMinor(){
            List<Student> filteredList = new List<Student>();

            for (Student student : this.studentList) {
                if (!student.isLegal) {
                    filteredList.add(student);                    
                }
            }

            return filteredList;
        }

        public List<Student> filterByGrade(Decimal minGraderange, Decimal maxGradeRange){
            List<Student> filteredList = new List<Student>();

            for (Student student : this.studentList) {
                if ((minGraderange == null && maxGradeRange != null) && student.averageGrade <= maxGradeRange) {
                    filteredList.add(student);                    
                } else if ((minGraderange != null && maxGradeRange == null) && student.averageGrade >= minGraderange) {
                    filteredList.add(student);                    
                } else if ((minGraderange != null && maxGradeRange != null) && student.averageGrade >= minGraderange && student.averageGrade <= maxGradeRange) {
                    filteredList.add(student);                    
                }     
            }

            return filteredList;
        }

        public Map<String, List<Student>> getByCountry(List<String> countryList){
            Map<String, List<Student>> countryToStudentMap = new Map<String, List<Student>>();

            for (Student student : this.studentList) {
                if (countryList.isEmpty() || countryList.contains(student.country)) {
                    if (countryToStudentMap.containsKey(student.country)) {     
                        countryToStudentMap.get(student.country).add(student);
                    } else {
                        countryToStudentMap.put(student.country, new List<student> {student});
                    }
                }           
            }

            return countryToStudentMap;
        }
}