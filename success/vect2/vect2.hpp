#ifndef VECT2_HPP
#define VECT2_HPP

#include <iostream>
#include <sstream>

class vect2
{
	private:
		int	x;
		int	y;
	public:
		~vect2();
		vect2();
		vect2(int, int);
		vect2(const vect2 &);
		vect2 & operator=(const vect2 &);
		
		int & operator [] (int);
		int   operator [] (int) const;
		
		vect2  operator - () const;
		vect2  operator * (int) const;
		
		vect2  & operator *= (int n);
		
		vect2  & operator *= (const vect2 &);
		vect2  & operator += (const vect2 &);
		vect2  & operator -= (const vect2 &);
		
		vect2  operator +(const vect2 &) const;
		vect2  operator -(const vect2 &) const;
		vect2  operator *(const vect2 &) const;	

		vect2 & operator ++();
		vect2 & operator --();
		vect2   operator ++(int);
		vect2   operator --(int);
		
		bool	operator == (const vect2 &) const;
		bool	operator != (const vect2 &) const;
		
};

std::ostream & operator << (std::ostream &, const vect2 &);

vect2 operator * (int n, const vect2 & obj);

#endif
