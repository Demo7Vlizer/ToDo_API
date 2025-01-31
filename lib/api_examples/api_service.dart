class ApiService {
  final String baseUrl = 'https://679c68d087618946e65216b3.mockapi.io/api/todolist';
  
  // Common headers
  Map<String, String> get headers => {
    'Content-Type': 'application/json',
  };
} 