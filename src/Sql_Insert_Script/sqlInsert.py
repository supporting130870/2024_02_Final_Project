import os
import mysql.connector

# MySQL 연결 설정
db_config = {
    'host': 'localhost',
    'user': 'root',
    'password': '130870',
    'database': 'lms_data'
}

# 데이터베이스 연결
connection = mysql.connector.connect(**db_config)

# 데이터 폴더 경로
data_folder = r'C:\Users\Jiwon\OneDrive\바탕 화면\sql\data\data'

# 테이블 데이터 삭제
def clear_tables():
    try:
        with connection.cursor() as cursor:
            cursor.execute("SET FOREIGN_KEY_CHECKS = 0;")
            cursor.execute("TRUNCATE TABLE Course;")
            cursor.execute("TRUNCATE TABLE Department;")
            cursor.execute("TRUNCATE TABLE College;")
            cursor.execute("TRUNCATE TABLE Campus;")
            cursor.execute("SET FOREIGN_KEY_CHECKS = 1;")
        connection.commit()
        print("All tables cleared successfully.")
    except Exception as e:
        print(f"Error clearing tables: {e}")

# 캠퍼스 데이터 삽입
def insert_campus():
    campuses = [
        (1, '서울', 'seoul'),
        (2, '용인', 'yongin')
    ]
    try:
        with connection.cursor() as cursor:
            cursor.executemany(
                "INSERT IGNORE INTO Campus (campus_id, name_kor, name_eng) VALUES (%s, %s, %s)", 
                campuses
            )
        connection.commit()
        print("Campus data inserted successfully.")
    except Exception as e:
        print(f"Error inserting campus data: {e}")

# 대학 데이터 삽입
def insert_colleges():
    files = ['seoul.txt', 'yongin.txt']
    for file in files:
        campus_id = 1 if 'seoul' in file else 2
        print(f"Processing file: {file}")
        with open(os.path.join(data_folder, file), 'r', encoding='utf-8') as f:
            for line in f:
                print(f"Line content: {repr(line.strip())}")
                try:
                    _, name_kor, name_eng = line.strip().split()
                    with connection.cursor() as cursor:
                        cursor.execute(
                            "INSERT IGNORE INTO College (campus_id, name_kor, name_eng) VALUES (%s, %s, %s)",
                            (campus_id, name_kor, name_eng)
                        )
                except Exception as e:
                    print(f"Error inserting college from {file}: {line.strip()}, Error: {e}")
        connection.commit()
    print("College data inserted successfully.")

# 학과 데이터 삽입
def insert_departments():
    college_files = [
        f for f in os.listdir(data_folder) 
        if f.endswith('.txt') and f not in ['seoul.txt', 'yongin.txt']
    ]
    for file in college_files:
        college_name = file.split('.')[0]
        print(f"Processing file: {file}")
        print(f"Looking for College name: {college_name}")
        with connection.cursor() as cursor:
            cursor.execute("SELECT college_id FROM College WHERE name_eng = %s", (college_name,))
            college_id = cursor.fetchone()
            # 결과를 가져와서 'Unread result found' 오류 방지
            if college_id is not None:
                college_id = college_id[0]
                cursor.fetchall()  # 커서 결과를 모두 소모하여 오류 방지
        
        if not college_id:
            print(f"College {college_name} not found in College table.")
            continue

        with open(os.path.join(data_folder, file), 'r', encoding='utf-8') as f:
            for line in f:
                print(f"Line content: {repr(line.strip())}")
                try:
                    _, name_kor, name_eng = line.strip().split()
                    with connection.cursor() as cursor:
                        cursor.execute(
                            "INSERT IGNORE INTO Department (college_id, name_kor, name_eng) VALUES (%s, %s, %s)",
                            (college_id, name_kor, name_eng)
                        )
                except Exception as e:
                    print(f"Error inserting department from {file}: {line.strip()}, Error: {e}")
    connection.commit()
    print("Department data inserted successfully.")

# 수업 데이터 삽입
def insert_courses():
    # 모든 수업 파일 탐색
    department_files = [
        f for f in os.listdir(data_folder) 
        if f.endswith('.txt') and not f in ['root.txt', 'seoul.txt', 'yongin.txt']
    ]
    
    for file in department_files:
        department_name = file.split('.')[0]
        print(f"Processing file: {file}")
        print(f"Looking for Department name: {department_name}")
        
        # 독립 커서로 Department ID 가져오기
        with connection.cursor() as cursor:
            cursor.execute("SELECT department_id FROM Department WHERE name_eng = %s", (department_name,))
            department_id = cursor.fetchone()
            # 결과를 가져와서 문제 방지
            if department_id is not None:
                department_id = department_id[0]
                cursor.fetchall()  # 커서 결과를 모두 소모하여 오류 방지
        
        if not department_id:
            print(f"Department {department_name} not found in Department table. Skipping {file}.")
            continue

        # Course 데이터 삽입
        with open(os.path.join(data_folder, file), 'r', encoding='utf-8') as f:
            for line in f:
                try:
                    print(f"Line content: {repr(line.strip())}")
                    course_data = line.strip().split()
                    
                    # 데이터가 예상한 5개 필드인지 확인
                    if len(course_data) != 5:
                        print(f"Invalid data format in file {file}: {line.strip()}")
                        continue
                    
                    course_id, course_name, professor_name, credits, schedule = (
                        course_data[0],  # ID
                        course_data[1],  # 수업명
                        course_data[2],  # 교수명
                        int(course_data[3]),  # 학점
                        course_data[4],  # 시간표
                    )
                    
                    # 독립 커서로 INSERT 실행
                    with connection.cursor() as cursor:
                        cursor.execute(
                            "INSERT IGNORE INTO Course (department_id, course_name, professor_name, credits, schedule) VALUES (%s, %s, %s, %s, %s)",
                            (department_id, course_name, professor_name, credits, schedule)
                        )
                except mysql.connector.Error as e:
                    print(f"MySQL Error while processing {line.strip()}: {e}")
                except Exception as e:
                    print(f"Error inserting course from {file}: {line.strip()}, Error: {e}")
    connection.commit()
    print("Course data inserted successfully.")

# 데이터 삽입 실행
try:
    clear_tables()
    insert_campus()
    insert_colleges()
    insert_departments()
    insert_courses()
    print("Data successfully inserted into the database!")
except Exception as e:
    print("An error occurred during data insertion:", e)
    connection.rollback()
finally:
    connection.close()
