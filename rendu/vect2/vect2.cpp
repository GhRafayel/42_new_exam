#include "vect2.hpp"

vect2::~vect2() {}

vect2::vect2(): x(0), y(0) {}

vect2::vect2(int num1, int num2) : x(num1), y(num2) {}

vect2::vect2(const vect2 & obj) {
    this->x = obj.x;
    this->y = obj.y;
}

vect2 & vect2::operator=(const vect2 & obj) {
    if (this == &obj) return *this;
    this->x = obj.x;
    this->y = obj.y;
    return *this;
}

vect2 vect2::operator - () const {
    return vect2(this->x * -1, this->y * -1);
}

vect2 vect2::operator * (int val) const {
    return vect2(this->x * val, this->y * val);
}

vect2 & vect2::operator *= (int val) {
     this->x *= val;
     this->y *= val;
     return *this;
}

vect2 & vect2::operator+=(const vect2 & obj){
    //if (this == & obj) return *this;
    this->x += obj.x;
    this->y += obj.y;
    return *this;
}
vect2 & vect2::operator-=(const vect2& obj){
    //if (this == & obj) return *this;
    this->x -= obj.x;
    this->y -= obj.y;
    return *this;
}
vect2 & vect2::operator*=(const vect2& obj){
    //if (this == & obj) return *this;
    this->x *= obj.x;
    this->y *= obj.y;
    return *this;
}

vect2 vect2::operator+(const vect2 & obj) const {
    return vect2(this->x + obj.x, this->y + obj.y);
}

vect2 vect2::operator-(const vect2& obj) const {
    return vect2(this->x - obj.x, this->y - obj.y);
}

vect2 vect2::operator*(const vect2& obj) const {
    return vect2(this->x * obj.x, this->y * obj.y);
}

vect2 & vect2::operator++() {
    this->x += 1;
    this->y += 1;
    return *this;
}

vect2  vect2::operator++(int) {
    int x = this->x;
    int y = this->y;
    this->x += 1;
    this->y += 1;
    return vect2(x, y);
}

vect2& vect2::operator--() {
    this->x -= 1;
    this->y -= 1;
    return *this;
}
vect2  vect2::operator--(int) {
    int x = this->x;
    int y = this->y;
    this->x -= 1;
    this->y -= 1;
    return vect2(x, y);
}

bool vect2::operator==(const vect2& obj) const{
    if (this->x == obj.x && this->y == obj.y) return true;
    return false;
}

bool vect2::operator!=(const vect2& obj) const{
     if (this->x != obj.x || this->y != obj.y) return true;
    return false;
}

int vect2::operator[](int index) const {
    if (index == 0) return this->x;
    return this->y;
}

int & vect2::operator[](int index) {
    if (index == 0) return this->x;
    return this->y;
}

vect2 operator * (int num, const vect2 & obj) {
    vect2 temp(obj);
    temp *= num;
    return temp;
}

std::ostream & operator << (std::ostream & ss, const vect2 & obj)
{
    ss << "{" << obj[0] << ", " << obj[1] << "}";
    return ss;
}