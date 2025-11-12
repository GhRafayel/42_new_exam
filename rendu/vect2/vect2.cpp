#include "vect2.hpp"

vect2::~vect2() {}

vect2::vect2() : x(0), y(0) {}

vect2::vect2(int num1, int num2) : x(num1),  y(num2) {}

vect2::vect2(const vect2 & obj) {
	this->x = obj.x;
	this->y = obj.y;
}

vect2 & vect2::operator = (const vect2 & obj) {
	if (this == & obj) return *this;
	this->x = obj.x;
	this->y = obj.y;
	return *this;
}

int vect2::operator [] (int i) const {
	if (i == 1)
		return this->y;
	return this->x;
}
int & vect2::operator [] (int i) {
	if (i == 1)
		return this->y;
	return this->x;
}

vect2 & vect2::operator ++() {
	this->x++;
	this->y++;
	return *this;
}

vect2 & vect2::operator --() {

	this->x--;
	this->y--;
	return *this;
}

vect2   vect2::operator ++(int) {
	vect2 temp(this->x, this->y);
	this->x += 1;
	this->y += 1;
	return temp;
}

vect2   vect2::operator --(int) {

	vect2 temp(this->x, this->y);
	this->x -= 1;
	this->y -= 1;
	return temp;
}

vect2  vect2::operator -() const {

	return vect2(this->x * -1, this->y * -1);
}


vect2  vect2::operator + (const vect2 & obj) const{

	return vect2(this->x + obj.x, this->y + obj.y);
}

vect2  vect2::operator - (const vect2 & obj) const{

	return vect2(this->x - obj.x, this->y - obj.y);
}

vect2   & vect2::operator  += (const vect2 & obj) {

	*this = vect2(this->x + obj.x, this->y + obj.y);
	return *this;
}

vect2   & vect2::operator  *= (const vect2 & obj) {

	*this = vect2(this->x * obj.x, this->y * obj.y);
	return *this;
}

vect2   & vect2::operator  *= (int n) {

	*this = vect2(this->x * n, this->y * n);
	return *this;
}

vect2  & vect2::operator -= (const vect2 & obj) {

	*this = vect2(this->x - obj.x, this->y - obj.y);
	return *this;
}

vect2   vect2::operator * (const vect2 & obj) const {

	return vect2(this->x * obj.x, this->y * obj.y);
}

vect2   vect2::operator * (int n) const {

	return vect2(this->x * n, this->y * n);
}


bool	vect2::operator == (const vect2 & obj) const{
	if (this->x == obj.x && this->y == obj.y) return true;
	return false;
}
bool	vect2::operator != (const vect2 & obj) const {
	if (this->x != obj.x || this->y != obj.y) return true;
	return false;
}

std::ostream & operator << (std::ostream & ss, const vect2 & obj) {
	ss << "{" << obj[0] << ", " << obj[1] << "}";
	return ss;
}

vect2 operator * (int n, const vect2 & obj) {
	return vect2(obj[0] * n, obj[1] * n);
}

