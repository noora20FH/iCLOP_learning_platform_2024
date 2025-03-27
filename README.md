

## iCLOP Learning Platform 2024

This project emphasizes full-stack development, combining expertise in Python testing, backend development with Laravel, and frontend development to create an effective and user-friendly learning system.

## Contributions
- Developing and maintaining an automated testing framework using Python to validate code and learning materials.

- Integrating this testing framework with the Laravel backend of the iCLOP platform.

- Designing and developing the user interface (user pages) for an optimal learning experience, including:

    - Data Analytics with Python Learning Page

    - Detailed Material Page

- Building an API to connect the Python testing framework with the Spring Boot framework, used in the Python code validation process.

## Technologies Used:
- Frameworks: Laravel, Bootstrap

- Programming Languages: HTML, CSS, JavaScript, PHP


## Notes:

- php version ^8.0
- install composer
- check session path:
      - .env
      - SESSION_FILES_PATH=E:\00_Skripsi_2023_2024\iCLOP_learning_platform_2024\iCLOP_learning_platform_2024\storage\framework\sessions
      - save the configuration: php artisan config:clear 

install libraries in the TestPython directory:
- numpy: pip install numpy
- pandas: pip install pandas
- codewars_test framework: pip install git+https://github.com/codewars/python-test-framework.git#egg=codewars_test              

Start Laravel: php artisan serve

On the browser:
- Login/Register
- Go to http://127.0.0.1:8000/dashboard-student
