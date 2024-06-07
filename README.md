
# Plant Generator Microservice

## Overview

The Plant Generator microservice generates and provides the bLOOMbABY application with procedurally generated plant data through a RESTful API. It supports generating different types of plants, each with unique attributes and phases of growth. It is entirely built out using Ruby and Sinatra!

## Features

- Generates random plant data with attributes based on predefined types.
- Currently supports two plant types: `flower1` and `flower2`. (This will be expanded in the future!)
- Provides plant attributes such as stem width, growth path, petal count, etc.
- Returns plant data in JSON format.

## Installation

1. **Clone the repository:**
   ```sh
   git clone <git@github.com:2311-capstone-bloom-brothers/bloom-brothers-be-generator.git>
   cd <repository_directory>
   ```

2. **Install dependencies:**
   ```sh
   bundle install
   ```

3. **Run the Sinatra application:**
   ```sh
   ruby app.rb
   ```

4. **Access the application:**
   Open your browser and go to `http://localhost:4567`.

## Endpoints

### Generate Plant

- **URL:** `/generate_plant`
- **Method:** `POST`
- **Content-Type:** `application/json`
- **Description:** Generates a plant with specified attributes or random attributes if not provided.
- **Request Body:**
  ```json
  {
    "name": "Plant Name",
    "description": "Plant Description",
    "plant_type": "flower1", // or "flower2"
    "position": "Position in garden"
  }
  ```
- **Response:**
  ```json
  {
    "name": "Plant Name",
    "description": "Plant Description",
    "plant_type": "flower1",
    "position": "Position in garden",
    "lifespan": 86400000,
    "planted": 1654789200,
    "phases": {
      "stem": {
        "color": [[0, 255, 0], [0, 255, 0], [0, 255, 0], [0, 255, 0], [0, 255, 0]],
        "stemWidth": [0.4, 0.4, 0.4, 0.4, 0.4],
        "path": [
          [[0.5, 0, 0], [0.5, 0, 0], [0.5, 0, 0.8], [0.1, 0.7, 0], [0.1, 0.7, 0], [0.1, 0.7, 0], [0.1, 0.7, 0], [0.1, 0.7, 0]],
          ...
        ]
      },
      "bloom": {
        "color": [255, 0, 0],
        "petalCount": [1, 1, 1, 1, 1],
        ...
      }
    }
  }
  ```

### Health Check

- **URL:** `/`
- **Method:** `GET`
- **Description:** Checks if the application is running.
- **Response:** 
  ```text
  App is running
  ```

## Modules

### PlantGenerator

This module handles the creation and generation of plants. It contains predefined attributes for different plant types and methods to generate random values for plant attributes.

#### Methods:

- **create(name:, description:, plant_type:, position:)**: Generates a plant with the specified attributes.
- **generate_random_values(array)**: Generates random values within the provided ranges.
- **generate_bloom_color**: Generates a random RGB color for the bloom.

## Configuration

- The application runs on port 4567 by default. You can change the port by setting the `PORT` environment variable in app.rb.

## Usage

- This application was built to work hand in hand with the bLOOMbaby backend application. However, if you want to run it locally,
this is also possible. Instructions are below!

1. **Start the Sinatra application:**
   ```sh
   ruby app.rb
   ```

2. **Using Postman, send a POST request to generate a plant:**
   ```sh
   Headers: 
   "Content-Type: application/json"
   Body: 
   '{
     "name": "Rose",
     "description": "A beautiful red rose",
     "plant_type": "flower1",
     "position": "Garden"
   }'
   ```

3. **Receive the generated plant data in the response.**

## License

This project is licensed under the MIT License. See the LICENSE file for more details.

---
