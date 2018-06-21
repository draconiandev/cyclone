module Utils
  module Core
    class Vector3d
      require 'bigdecimal'

      attr_reader :x, :y, :z

      # Default constructor creates a vector of zero length
      # Explicit constructor creates a vector with given components
      # Conversion to big decimal happens only for strings
      # But it takes care of validation
      def initialize(x = 0, y = 0, z = 0)
        @x, @y, @z = BigDecimal(x.to_s), BigDecimal(y.to_s), BigDecimal(z.to_s)
      end

      # When you are quickly comparing two vectors, it is faster to just compare the square
      # magnitude rather than exact magnitude
      def square_magnitude
        x * x + y * y + z * z
      end

      # Returns the value of the vector
      def magnitude
        Math.sqrt(square_magnitude)
      end

      # API to get the value of the vector
      def unit
        normalize
      end

      # Vector Comparision
      # Equality opertator between two vectors
      def ==(other)
        x == other.x &&
          y == other.y &&
          z == other.z
      end

      # Inequality opertator between two vectors
      def !=(other)
        !(self.== other)
      end

      # Less than opertator between two vectors
      def <(other)
        x < other.x &&
          y < other.y &&
          z < other.z
      end

      # Greater than opertator between two vectors
      def >(other)
        x > other.x &&
          y > other.y &&
          z > other.z
      end

      # Less than or equal to opertator between two vectors
      def <=(other)
        x <= other.x &&
          y <= other.y &&
          z <= other.z
      end

      # Greater than or equal to opertator between two vectors
      def <=(other)
        x <= other.x &&
          y <= other.y &&
          z <= other.z
      end

      # Vector multiplication
      # Multiplies this vector by the given scalar
      def *=(scalar_val)
        @x *= scalar_val
        @y *= scalar_val
        @z *= scalar_val
      end

      # Returns a copy of this vector scaled the given value
      def *(scalar_val)
        new(x * scalar_val, y * scalar_val, z * scalar_val)
      end

      # Vector addition
      # Adds the given vector to this
      def +=(other)
        @x += other.x
        @y += other.y
        @z += other.z
      end

      # Returns the value of the given vector added to this
      def +(other)
        new(x + other.x, y + other.y, z + other.z)
      end

      # Vector subtraction
      # Subtracts the given vector from this
      def -=(other)
        @x -= other.x
        @y -= other.y
        @z -= other.z
      end

      # Returns the value of the given vector subtracted from this
      def -(other)
        new(x - other.x, y - other.y, z - other.z)
      end

      # Adds the given vector to this, scaled by the given amount.
      def add_scaled_vector(other, scalar_val)
        @x += other.x * scalar_val;
        @y += other.y * scalar_val;
        @z += other.z * scalar_val;
      end

      private

      # Turns a non zero vector into a vector of unit length
      # TODO: Understand this shit. Reimplement
      def normalize
        # new_val = magnitude *  1.0 / magnitude
        return 1 if magnitude > 0
        magnitude
      end
    end
  end
end
